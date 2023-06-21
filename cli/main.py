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

def login_user(username, password):
    try:
        # Get the database connection and cursor
        cnx, cur = connect_to_database()
        if not cnx or not cur:
            return None

        # Execute the login query
        cur.execute(
            "SELECT * FROM User WHERE username = %s AND password = %s",
            (username, password)
        )

        # Fetch the user if found
        user = cur.fetchone()

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

        print("Playlist created successfully")

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

        # Fetch the result set from the stored procedure
        result = next(cur.stored_results())

        # Fetch all the rows returned by the stored procedure
        rows = result.fetchall()

        # Print the songs in the playlist
        print(f"Playlist with ID {playlist_id}:")
        for row in rows:
            song_id, duration, language, album_id, song_name, release_date = row
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


def create_playlist_interaction(user_id):
    try:
        # Get the database connection and cursor
        cnx, cur = connect_to_database()
        if not cnx or not cur:
            return

        # Prompt the user for playlist name and author
        playlist_name = input("Enter the playlist name: ")
        author = input("Enter the author: ")

        # Call the CreatePlaylist procedure to create the playlist
        cur.callproc("CreatePlaylist", [playlist_name, author, user_id])

        # Commit the changes
        cnx.commit()

        print("Playlist created successfully")

        # Get the generated playlist ID
        cur.execute("SELECT LAST_INSERT_ID()")
        playlist_id = cur.fetchone()[0]

        # Get all songs with artists as a DataFrame
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

def main():
    # Log in to get the user ID
    username = 'new_user_test'  # Replace with the username
    password = 'new_password'  # Replace with the password
    logged_in_user = login_user(username, password)
    if not logged_in_user:
        print("Login failed")
        return

    print('User logged in successfully')

    # Get the user ID
    user_id = logged_in_user[0]  # Assuming user_id is the first column in the User table

    # Create a playlist with interaction
    create_playlist_interaction(user_id)

if __name__ == "__main__":
    main()