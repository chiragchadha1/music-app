from flask import Flask, jsonify, g, request
from flask_cors import CORS #comment this on deployment
import mysql.connector

app = Flask(__name__)
CORS(app) #comment this on deployment

def get_db():
    if 'db' not in g:
        g.db = mysql.connector.connect(
            user="admin",
            password="6kWyqokwLRHqy6HyIvKC",
            host="musicapp.cf3u0flvivkp.us-east-1.rds.amazonaws.com",
            database="musicApp" # Replace with your database name
        )
    return g.db

@app.teardown_appcontext
def close_db(e=None):
    db = g.pop('db', None)
    if db is not None:
        db.close()

@app.route("/")
def hello():
    db = get_db()
    # Creating a cursor object
    cur = db.cursor(dictionary=True)
    try:
        cur.execute('SELECT * FROM User')
        results = cur.fetchall()
        return jsonify(results) #returning the results as JSON
    except Exception as e:
        print("Error: unable to fetch items")
        print(e)
    return jsonify({"response": "Error in the database query"})


@app.route('/signup', methods=['POST'])
def signup():
    user_details = request.get_json()
    db = get_db()
    cur = db.cursor()
    try:
        cur.callproc("RegisterUser", (
            user_details['email'],
            user_details['username'],
            user_details['password'],
            user_details['firstName'],
            user_details['lastName'],
            user_details['dob']
        ))
        db.commit()
        return jsonify({"response": "User created successfully"}), 200
    except Exception as e:
        print("Error: unable to create user")
        print(e)
        return jsonify({"response": "Error in creating user: " + str(e)}), 400

@app.route('/login', methods=['POST'])
def login():
    user_details = request.get_json()
    db = get_db()
    cur = db.cursor()
    try:
        cur.callproc("LoginUser", (user_details['username'], user_details['password']))
        user = cur.fetchone()
        if user:
            user_data = {
                'user_ID': user[0],
                'email_id': user[1],
                'username': user[2],
                'first_name': user[4],
                'last_name': user[5],
                'date_of_birth': user[6]
            }
            return jsonify({'user': user_data})
        else:
            return jsonify({'message': 'Invalid username or password'}), 401
    except Exception as e:
        print("Error: unable to perform login")
        print(e)
        return jsonify({'response': 'Error in login process'}), 500
    finally:
        cur.close()
        db.close()

@app.route("/search", methods=['GET'])
def search():
    query = request.args.get('query')
    table_name = request.args.get('table_name')
    db = get_db()
    cur = db.cursor(dictionary=True)
    try:
        cur.callproc("Search", (query, table_name))
        results = cur.fetchall()
        return jsonify(results)
    except Exception as e:
        print("Error: unable to perform search")
        print(e)
        return jsonify({'response': 'Error in search process'}), 500

@app.route("/like_song", methods=['POST'])
def like_song():
    like_details = request.get_json()
    db = get_db()
    cur = db.cursor()
    try:
        cur.callproc("LikeSong", (like_details['user_ID'], like_details['song_ID']))
        db.commit()
        return jsonify({'message': 'Song liked successfully'})
    except Exception as e:
        print("Error: unable to like song")
        print(e)
        return jsonify({'response': 'Error in liking song'}), 500

@app.route("/create_playlist", methods=['POST'])
def create_playlist():
    playlist_details = request.get_json()
    db = get_db()
    cur = db.cursor()
    try:
        cur.callproc("CreatePlaylist", (
            playlist_details['name'],
            playlist_details['author'],
            playlist_details['duration'],
            playlist_details['user_ID']
        ))
        db.commit()
        return jsonify({'message': 'Playlist created successfully'})
    except Exception as e:
        print("Error: unable to create playlist")
        print(e)
        return jsonify({'response': 'Error in creating playlist'}), 500

@app.route("/follow_artist", methods=['POST'])
def follow_artist():
    follow_details = request.get_json()
    db = get_db()
    cur = db.cursor()
    try:
        cur.callproc("FollowArtist", (follow_details['user_ID'], follow_details['artist_ID']))
        db.commit()
        return jsonify({'message': 'Artist followed successfully'})
    except Exception as e:
        print("Error: unable to follow artist")
        print(e)
        return jsonify({'response': 'Error in following artist'}), 500

@app.route("/add_song_to_playlist", methods=['POST'])
def add_song_to_playlist():
    playlist_song_details = request.get_json()
    db = get_db()
    cur = db.cursor()
    try:
        cur.callproc("AddSongToPlaylist", (
            playlist_song_details['playlist_id'],
            playlist_song_details['song_id']
        ))
        db.commit()
        return jsonify({'message': 'Song added to playlist successfully'})
    except Exception as e:
        print("Error: unable to add song to playlist")
        print(e)
        return jsonify({'response': 'Error in adding song to playlist'}), 500

@app.route("/delete_song_from_playlist", methods=['POST'])
def delete_song_from_playlist():
    playlist_song_details = request.get_json()
    db = get_db()
    cur = db.cursor()
    try:
        cur.callproc("DeleteSongFromPlaylist", (
            playlist_song_details['playlist_id'],
            playlist_song_details['song_id']
        ))
        db.commit()
        return jsonify({'message': 'Song deleted from playlist successfully'})
    except Exception as e:
        print("Error: unable to delete song from playlist")
        print(e)
        return jsonify({'response': 'Error in deleting song from playlist'}), 500

@app.route("/update_song_details", methods=['POST'])
def update_song_details():
    song_details = request.get_json()
    db = get_db()
    cur = db.cursor()
    try:
        cur.callproc("UpdateSongDetails", (
            song_details['song_id'],
            song_details['duration'],
            song_details['language']
        ))
        db.commit()
        return jsonify({'message': 'Song details updated successfully'})
    except Exception as e:
        print("Error: unable to update song details")
        print(e)
        return jsonify({'response': 'Error in updating song details'}), 500

@app.route("/update_user_details", methods=['POST'])
def update_user_details():
    user_details = request.get_json()
    db = get_db()
    cur = db.cursor()
    try:
        cur.callproc("UpdateUserDetails", (
            user_details['user_id'],
            user_details['email_id'],
            user_details['username'],
            user_details['password'],
            user_details['first_name'],
            user_details['last_name'],
            user_details['date_of_birth']
        ))
        db.commit()
        return jsonify({'message': 'User details updated successfully'})
    except Exception as e:
        print("Error: unable to update user details")
        print(e)
        return jsonify({'response': 'Error in updating user details'}), 500

@app.route("/get_playlist_songs", methods=['GET'])
def get_playlist_songs():
    playlist_id = request.args.get('playlist_id')
    db = get_db()
    cur = db.cursor(dictionary=True)
    try:
        cur.callproc("GetPlaylistSongs", (playlist_id,))
        results = cur.fetchall()
        return jsonify(results)
    except Exception as e:
        print("Error: unable to get playlist songs")
        print(e)
        return jsonify({'response': 'Error in getting playlist songs'}), 500


if __name__ == "__main__":
    app.run()