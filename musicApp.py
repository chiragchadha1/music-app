import mysql.connector
from mysql.connector import Error

# Establishing the connection
cnx = mysql.connector.connect(
    user="admin",
    password="6kWyqokwLRHqy6HyIvKC",
    host="musicapp.cf3u0flvivkp.us-east-1.rds.amazonaws.com",
    database="musicApp" # Replace with your database name
)

# Creating a cursor object
cur = cnx.cursor()

# Function for user registration
def register_user(user):
    try:
        cur.execute(
            "INSERT INTO User (email_id, username, password, first_name, last_name, date_of_birth) VALUES (%s, %s, %s, %s, %s, %s)",
            (user['email_id'], user['username'], user['password'], user['first_name'], user['last_name'], user['date_of_birth'])
        )
        cnx.commit()
    except Error as e:
        print(f"An error occurred: {e}")
        cnx.rollback()

# Function for user login
def login_user(username, password):
    try:
        cur.execute(
            "SELECT * FROM User WHERE username = %s AND password = %s",
            (username, password)
        )
        user = cur.fetchone()
        return user
    except Error as e:
        print(f"An error occurred: {e}")
        cnx.rollback()

# Function to search songs, artists, albums, or playlists
def search(query, table_name):
    try:
        cur.execute(
            f"SELECT * FROM {table_name} WHERE name LIKE %s",
            ('%' + query + '%',)
        )
        results = cur.fetchall()
        return results
    except Error as e:
        print(f"An error occurred: {e}")
        cnx.rollback()

# Function to like a song
def like_song(user_ID, song_ID):
    try:
        cur.execute(
            "INSERT INTO LikedSongs (user_ID, song_ID) VALUES (%s, %s)",
            (user_ID, song_ID)
        )
        cnx.commit()
    except Error as e:
        print(f"An error occurred: {e}")
        cnx.rollback()

# Function to create a playlist
def create_playlist(playlist):
    try:
        cur.execute(
            "INSERT INTO Playlist (name, author, duration, user_ID) VALUES (%s, %s, %s, %s)",
            (playlist['name'], playlist['author'], playlist['duration'], playlist['user_ID'])
        )
        cnx.commit()
    except Error as e:
        print(f"An error occurred: {e}")
        cnx.rollback()

# Function to follow an artist
def follow_artist(user_ID, artist_ID):
    try:
        cur.execute(
            "INSERT INTO Followers (user_ID, artist_ID) VALUES (%s, %s)",
            (user_ID, artist_ID)
        )
        cnx.commit()
    except Error as e:
        print(f"An error occurred: {e}")
        cnx.rollback()

def add_song_to_playlist(playlist_id, song_id):
    try:
        cur.execute(
            "INSERT INTO PlaylistSongs (playlist_id, song_id) VALUES (%s, %s)",
            (playlist_id, song_id)
        )
        cnx.commit()
    except Error as e:
        print(f"An error occurred: {e}")
        cnx.rollback()

def delete_song_from_playlist(playlist_id, song_id):
    try:
        cur.execute(
            "DELETE FROM PlaylistSongs WHERE playlist_id = %s AND song_id = %s",
            (playlist_id, song_id)
        )
        cnx.commit()
    except Error as e:
        print(f"An error occurred: {e}")
        cnx.rollback()

def update_song_details(song_id, new_details):
    try:
        cur.execute(
            "UPDATE Songs SET duration = %s, language = %s WHERE song_id = %s",
            (new_details['duration'], new_details['language'], song_id)
        )
        cnx.commit()
    except Error as e:
        print(f"An error occurred: {e}")
        cnx.rollback()

def update_user_details(user_id, new_details):
    try:
        cur.execute(
            "UPDATE User SET email_id = %s, username = %s, password = %s, first_name = %s, last_name = %s, date_of_birth = %s WHERE user_id = %s",
            (new_details['email_id'], new_details['username'], new_details['password'], new_details['first_name'], new_details['last_name'], new_details['date_of_birth'], user_id)
        )
        cnx.commit()
    except Error as e:
        print(f"An error occurred: {e}")
        cnx.rollback()

def get_playlist_songs(playlist_id):
    try:
        cur.execute(
            "SELECT Songs.* FROM Songs JOIN PlaylistSongs ON Songs.song_id = PlaylistSongs.song_id WHERE PlaylistSongs.playlist_id = %s",
            (playlist_id,)
        )
        return cur.fetchall()
    except Error as e:
        print(f"An error occurred: {e}")
        cnx.rollback()



# Closing the connection
    cnx.close()

def main():
    # Register a new user
    user = {
        'email_id': 'new_user@example.com',
        'username': 'new_user',
        'password': 'new_password',
        'first_name': 'New',
        'last_name': 'User',
        'date_of_birth': '2000-01-01'
        # 'profile_pic' is not included, assuming it's optional and that your register_user function can handle its absence
    }
    register_user(user)
    print('User registered successfully')

    # Log in as the new user
    logged_in_user = login_user(user['username'], user['password'])
    if logged_in_user:
        print('User logged in successfully')
        # Create a playlist for the new user
        playlist = {
            'name': 'New Playlist',
            'author': 'new_user',
            'duration': 0,  # Assuming this is in seconds, adjust as necessary
            'user_ID': logged_in_user[0]  # Assuming that user_id is the first column in the User table
            # 'cover_image' is not included, assuming it's optional and that your create_playlist function can handle its absence
        }
        create_playlist(playlist)
        print('Playlist created successfully')

        # Add a song to the new playlist
        playlist_id = 1  # Replace with actual playlist_id
        song_id = 1  # Replace with actual song_id
        add_song_to_playlist(playlist_id, song_id)
        print('Song added to playlist successfully')
    else:
        print('Failed to log in')

if __name__ == "__main__":
    main()