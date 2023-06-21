import mysql.connector
from mysql.connector import Error
import pandas as pd

def connect_to_database():
    try:
        # Establishing the connection
        cnx = mysql.connector.connect(
            user="admin",
            password="6kWyqokwLRHqy6HyIvKC",
            host="musicapp.cf3u0flvivkp.us-east-1.rds.amazonaws.com",
            database="musicApp"  # Replace with your database name
        )
        cur = cnx.cursor()  # Create a cursor object
        return cnx, cur
    except Error as e:
        print(f"An error occurred while connecting to the database: {e}")
        return None, None

def register_user(email, username, password, first_name, last_name, date_of_birth):
    try:
        # Get the database connection and cursor
        cnx, cur = connect_to_database()
        if not cnx or not cur:
            return

        # Call the RegisterUser procedure
        cur.callproc("RegisterUser", [email, username, password, first_name, last_name, date_of_birth])

        # Commit the changes
        cnx.commit()

        print("User registered successfully")

    except Error as e:
        print(f"An error occurred while registering the user: {e}")

    finally:
        # Closing the cursor and connection
        cur.close()
        cnx.close()


def login_user(username, password):
    try:
        # Get the database connection and cursor
        cnx, cur = connect_to_database()
        if not cnx or not cur:
            return None

        # Execute the login query
        cur.callproc('LoginUser', [username, password])

        # Fetch the user if found
        for result in cur.stored_results():
            user = result.fetchone()

        # Read and discard any unread results
        cur.fetchall()

        # Closing the cursor and connection
        cur.close()
        cnx.close()

        return user

    except Error as e:
        print(f"An error occurred while logging in: {e}")

    return None



def create_playlist(user_id, playlist_name, author):
    try:
        # Get the database connection and cursor
        cnx, cur = connect_to_database()
        if not cnx or not cur:
            return

        # Call the CreatePlaylist procedure
        cur.callproc("CreatePlaylist", [playlist_name, author, user_id])

        # Commit the changes
        cnx.commit()

         # Get the generated playlist ID
        cur.execute("SELECT LAST_INSERT_ID()")
        playlist_id = cur.fetchone()[0]

        print("Playlist created successfully! Playlist ID: " + str(playlist_id))

    except Error as e:
        print(f"An error occurred while creating the playlist: {e}")

    finally:
        # Closing the cursor and connection
        cur.close()
        cnx.close()

def add_song_to_playlist(playlist_id, song_id):
    try:
        # Get the database connection and cursor
        cnx, cur = connect_to_database()
        if not cnx or not cur:
            return

        # Call the AddSongToPlaylist procedure
        cur.callproc("AddSongToPlaylist", [playlist_id, song_id])

        # Commit the changes
        cnx.commit()

        print(f"Song with ID {song_id} added to playlist with ID {playlist_id}")

    except Error as e:
        print(f"An error occurred while adding the song to the playlist: {e}")

    finally:
        # Closing the cursor and connection
        cur.close()
        cnx.close()


def print_all_songs_with_artist():
    try:
        # Get the database connection and cursor
        cnx, cur = connect_to_database()
        if not cnx or not cur:
            return

        # Select all songs with artist information
        query = "SELECT Songs.song_ID, Songs.song_name, Artist.artist_name " \
                "FROM Songs " \
                "INNER JOIN SongArtist ON Songs.song_ID = SongArtist.song_ID " \
                "INNER JOIN Artist ON SongArtist.artist_ID = Artist.artist_ID"

        cur.execute(query)

        # Fetch all the rows returned by the query
        rows = cur.fetchall()

        # Create a DataFrame to display all songs with artists
        df = pd.DataFrame(rows, columns=['Song ID', 'Song Name', 'Artist'])
        print("\nList of All Songs with Artists:")
        print(df)

    except Error as e:
        print(f"An error occurred while printing the songs: {e}")

    finally:
        # Closing the cursor and connection
        cur.close()
        cnx.close()


def remove_song_from_playlist(playlist_id, song_id):
    try:
        # Get the database connection and cursor
        cnx, cur = connect_to_database()
        if not cnx or not cur:
            return

        # Call the DeleteSongFromPlaylist procedure
        cur.callproc("DeleteSongFromPlaylist", [playlist_id, song_id])

        # Commit the changes
        cnx.commit()

        print(f"Song with ID {song_id} removed from playlist with ID {playlist_id}")

    except Error as e:
        print(f"An error occurred while removing the song from the playlist: {e}")

    finally:
        # Closing the cursor and connection
        cur.close()
        cnx.close()

def print_playlist(playlist_id):
    try:
        # Get the database connection and cursor
        cnx, cur = connect_to_database()
        if not cnx or not cur:
            return

        # Prepare the call to the GetPlaylistSongs stored procedure
        cur.callproc("GetPlaylistSongs", [playlist_id])

        playlist_songs = []
        # Iterate over stored_results to get the actual result
        for result in cur.stored_results():
            playlist_songs = result.fetchall()

        if not playlist_songs or len(playlist_songs) == 0:
            print("There are no songs in the playlist to display.")
            return

        # Print the songs in the playlist
        print(f"Playlist with ID {playlist_id}:")
        for song in playlist_songs:
            song_id, duration, language, album_id, song_name, release_date = song
            print(f"Song ID: {song_id}")
            print(f"Duration: {duration}")
            print(f"Language: {language}")
            print(f"Album ID: {album_id}")
            print(f"Song Name: {song_name}")
            print(f"Release Date: {release_date}")
            print("----------------------")

    except Error as e:
        print(f"An error occurred while printing the playlist: {e}")

    finally:
        # Closing the cursor and connection
        cur.close()
        cnx.close()

def get_playlist_song_ids(playlist_id):
    try:
        # Get the database connection and cursor
        cnx, cur = connect_to_database()
        if not cnx or not cur:
            return []

        # Select song IDs in the playlist
        query = "SELECT song_ID FROM PlaylistSongs WHERE playlist_ID = %s"
        cur.execute(query, (playlist_id,))
        song_ids = [row[0] for row in cur.fetchall()]

        return song_ids

    except Error as e:
        print(f"An error occurred while getting playlist song IDs: {e}")
        return []


def add_songs_to_playlist_interaction(playlist_id):
    try:
        # Get the database connection and cursor
        cnx, cur = connect_to_database()
        if not cnx or not cur:
            return

        query = "SELECT Songs.song_ID, Songs.song_name, GROUP_CONCAT(Artist.artist_name SEPARATOR ', ') AS artist_names " \
                "FROM Songs " \
                "LEFT JOIN SongArtist ON Songs.song_ID = SongArtist.song_ID " \
                "LEFT JOIN Artist ON SongArtist.artist_ID = Artist.artist_ID " \
                "GROUP BY Songs.song_ID"
        cur.execute(query)
        songs_data = cur.fetchall()

        # Create a DataFrame from the songs data
        songs_df = pd.DataFrame(songs_data, columns=["Song ID", "Song Name", "Artist Names"])

        # Print the songs DataFrame
        print("All Songs:")
        print(songs_df)

        # Prompt the user for the number of songs to add
        num_songs = int(input("Enter the number of songs to add: "))

        # Add songs to the playlist
        for i in range(num_songs):
            while True:
                song_id = int(input(f"Enter the song ID for song {i+1}: "))
                if song_id in songs_df["Song ID"].values:
                    break
                else:
                    print("Invalid song ID. Please try again.")

            print(f"Adding song {song_id} to playlist {playlist_id}")
            add_song_to_playlist(playlist_id, song_id)

        # Print the playlist
        print_playlist(playlist_id)

    except Error as e:
        print(f"An error occurred while creating the playlist: {e}")

    finally:
        # Closing the cursor and connection
        cur.close()
        cnx.close()

def delete_songs_from_playlist_interaction(playlist_id):
    try:
        # Get the database connection and cursor
        cnx, cur = connect_to_database()
        if not cnx or not cur:
            return

        query = "SELECT Songs.song_ID, Songs.song_name, GROUP_CONCAT(Artist.artist_name SEPARATOR ', ') AS artist_names " \
                "FROM Songs " \
                "LEFT JOIN SongArtist ON Songs.song_ID = SongArtist.song_ID " \
                "LEFT JOIN Artist ON SongArtist.artist_ID = Artist.artist_ID " \
                "GROUP BY Songs.song_ID"
        cur.execute(query)
        songs_data = cur.fetchall()

        # Create a DataFrame from the songs data
        songs_df = pd.DataFrame(songs_data, columns=["Song ID", "Song Name", "Artist Names"])

        cur.callproc('GetPlaylistSongs', [playlist_id])
        playlist_songs = []
        # Iterate over stored_results to get the actual result
        for result in cur.stored_results():
            playlist_songs = result.fetchall()


        if not playlist_songs or len(playlist_songs) == 0:
            print("There are no songs in the playlist to delete.")
            return

        # Print the playlist
        print_playlist(playlist_id)

        # Prompt the user for the number of songs to delete
        num_songs_to_delete = int(input("Enter the number of songs to delete: "))

        # Remove songs from the playlist
        for i in range(num_songs_to_delete):
            while True:
                song_id_to_remove = int(input(f"Enter the song ID to remove from playlist {playlist_id}: "))
                if song_id_to_remove in songs_df["Song ID"].values and song_id_to_remove in get_playlist_song_ids(playlist_id):
                    break
                else:
                    print("Invalid song ID or song not in the playlist. Please try again.")

            print(f"Removing song {song_id_to_remove} from playlist {playlist_id}")
            remove_song_from_playlist(playlist_id, song_id_to_remove)

        # Print the updated playlist
        print_playlist(playlist_id)

    except Error as e:
        print(f"An error occurred while creating the playlist: {e}")

    finally:
        # Closing the cursor and connection
        cur.close()
        cnx.close()

def print_all_playlists():
    try:
        # Get the database connection and cursor
        cnx, cur = connect_to_database()
        if not cnx or not cur:
            return pd.DataFrame()  # return empty DataFrame in case of connection error

        # Select all records from Playlist table
        query = "SELECT * FROM Playlist"
        cur.execute(query)

        # Fetch all the rows returned by the query
        rows = cur.fetchall()


        # Get column names
        col_names = [desc[0] for desc in cur.description]

        # Create a DataFrame from the fetched records
        df = pd.DataFrame(rows, columns=col_names)

        print("\nAll Playlists:")
        print(df)


    except Error as e:
        print(f"An error occurred while fetching playlists: {e}")
        return pd.DataFrame()  # return empty DataFrame in case of error

    finally:
        # Closing the cursor and connection
        cur.close()
        cnx.close()

def print_artists_with_followers():
    try:
        # Get the database connection and cursor
        cnx, cur = connect_to_database()
        if not cnx or not cur:
            return

        # Execute the SQL query to retrieve artists with follower counts
        query = "SELECT artist_ID, artist_name, follower_count FROM Artist"
        cur.execute(query)

        # Fetch all the rows returned by the query
        rows = cur.fetchall()

        # Create a DataFrame from the rows
        columns = ["Artist ID", "Artist Name", "Follower Count"]
        df = pd.DataFrame(rows, columns=columns)

        # Print the DataFrame
        print(df)

    except mysql.connector.Error as e:
        print(f"An error occurred while printing the artists: {e}")

    finally:
        # Closing the cursor and connection
        cur.close()
        cnx.close()


def follow_artist_interaction(user_id):
    try:
        # Get the database connection and cursor
        cnx, cur = connect_to_database()
        if not cnx or not cur:
            return

        # Print the artists with follower counts
        print_artists_with_followers()

        # Prompt the user to enter the artist ID to follow
        artist_id = int(input("Enter the Artist ID to follow: "))

        # Insert the follower into the Followers table
        query = "INSERT INTO Followers (user_ID, artist_ID) VALUES (%s, %s)"
        values = (user_id, artist_id)
        cur.execute(query, values)

        # Commit the changes
        cnx.commit()

        # Print the followed artist details
        cur.execute("SELECT artist_name, follower_count FROM Artist WHERE artist_ID = %s", (artist_id,))
        result = cur.fetchone()
        if result:
            artist_name, follower_count = result
            print("Artist Followed:")
            print(f"Artist ID: {artist_id}")
            print(f"Artist Name: {artist_name}")
            print(f"Follower Count: {follower_count}")
        else:
            print("Invalid artist ID.")

        # Print the artists with follower counts
        print_artists_with_followers()

        # # Prompt the user to unfollow the artist
        # unfollow = input("Would you like to unfollow this artist? (y/n): ")
        # if unfollow.lower() == "y":
        #     # Delete the follower from the Followers table
        #     query = "DELETE FROM Followers WHERE user_ID = %s AND artist_ID = %s"
        #     values = (user_id, artist_id)
        #     cur.execute(query, values)

        #     # Commit the changes
        #     cnx.commit()
        #     print("Artist unfollowed.")

    except mysql.connector.Error as e:
        print(f"An error occurred while following/unfollowing the artist: {e}")

    finally:
        # Closing the cursor and connection
        cur.close()
        cnx.close()

def unfollow_artist_interaction(user_id):
    try:
        # Get the database connection and cursor
        cnx, cur = connect_to_database()
        if not cnx or not cur:
            return

        # Print the artists with follower counts
        print_artists_with_followers()

        # Prompt the user to unfollow the artist
        artist_id = int(input("Enter the Artist ID to unfollow: "))

        # Check if the artist has any followers
        query = "SELECT COUNT(*) FROM Followers WHERE artist_ID = %s"
        values = (artist_id,)
        cur.execute(query, values)
        num_followers = cur.fetchone()[0]

        if num_followers == 0:
            print("Error: This artist has no followers.")
            return

        # Delete the follower from the Followers table
        query = "DELETE FROM Followers WHERE user_ID = %s AND artist_ID = %s"
        values = (user_id, artist_id)
        cur.execute(query, values)

        # Commit the changes
        cnx.commit()
        print("Artist unfollowed.")

        # Print the artists with follower counts
        print_artists_with_followers()

    except mysql.connector.Error as e:
        print(f"An error occurred while following/unfollowing the artist: {e}")

    finally:
        # Closing the cursor and connection
        cur.close()
        cnx.close()

def main():
    while True:
        print("\n1. Register")
        print("2. Log in")
        print("3. Create playlist")
        print("4. Add song to playlist")
        print("5. Print all songs with artist")
        print("6. Remove song from playlist")
        print("7. Print playlist")
        print("8. Print all artists")
        print("9. Follow artist")
        print("10. Unfollow artist")
        print("11. Exit")

        try:
            option = int(input("\nChoose an option: "))
        except ValueError:
            print("Invalid input, please enter a number.")
            continue

        if option == 1:
            email = input("Enter email: ")
            username = input("Enter username: ")
            password = input("Enter password: ")
            first_name = input("Enter first name: ")
            last_name = input("Enter last name: ")
            date_of_birth = input("Enter date of birth (yyyy-mm-dd): ")
            register_user(email, username, password, first_name, last_name, date_of_birth)

        elif option == 2:
            username = input("Enter username: ")
            password = input("Enter password: ")
            logged_in_user = login_user(username, password)
            if not logged_in_user:
                print("Login failed")
            else:
                print('User logged in successfully')
                user_id = logged_in_user[0]  # Assuming user_id is the first column in the User table

        elif option == 3:
            if 'user_id' in locals():
                playlist_name = input("Enter the playlist name: ")
                author = input("Enter the author: ")
                create_playlist(user_id, playlist_name, author)
            else:
                print("Please log in first")

        elif option == 4:
            if 'user_id' in locals():
                print_all_playlists()
                playlist_id = int(input("Enter the playlist ID: "))
                add_songs_to_playlist_interaction(playlist_id)
            else:
                print("Please log in first")

        elif option == 5:
            print_all_songs_with_artist()

        elif option == 6:
            if 'user_id' in locals():
                print_all_playlists()
                playlist_id = int(input("Enter the playlist ID: "))
                delete_songs_from_playlist_interaction(playlist_id)
            else:
                print("Please log in first")

        elif option == 7:
            if 'user_id' in locals():
                print_all_playlists()
                playlist_id = int(input("Enter the playlist ID: "))
                print_playlist(playlist_id)
            else:
                print("Please log in first")

        elif option == 8:
            if 'user_id' in locals():
                    print_artists_with_followers()
            else:
                print("Please log in first")

        elif option == 9:
            if 'user_id' in locals():
                    follow_artist_interaction(user_id)
            else:
                print("Please log in first")

        elif option == 10:
            if 'user_id' in locals():
                    unfollow_artist_interaction(user_id)
            else:
                print("Please log in first")


        elif option == 11:
            print("Exiting...")
            break

        else:
            print("Invalid option, please try again")

if __name__ == "__main__":
    main()
