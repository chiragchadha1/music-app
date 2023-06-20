from flask import Flask, jsonify, g, request, send_from_directory
from flask_jwt_extended import JWTManager, create_access_token, jwt_required
from flask_cors import CORS #comment this on deployment
import mysql.connector
import jwt
import datetime
import os

app = Flask(__name__, static_folder='../vite/dist')
app.config["JWT_SECRET_KEY"] = "secret"
jwt = JWTManager(app)
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

def generate_token(user_id):
    # Define the payload for the JWT token
    payload = {
        'user_id': user_id,
        'exp': datetime.datetime.utcnow() + datetime.timedelta(days=1)  # Token expiration time
    }

    # Generate the JWT token
    token = jwt.encode(payload, 'your_secret_key', algorithm='HS256')  # Replace 'your_secret_key' with your own secret key

    return token

@app.teardown_appcontext
def close_db(e=None):
    db = g.pop('db', None)
    if db is not None:
        db.close()

@app.route('/api/protected', methods=['GET'])
@jwt_required()
def protected():
    return jsonify({'message': 'This is a protected route'})

@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def serve(path):
    if path != "" and os.path.exists(app.static_folder + '/' + path):
        return send_from_directory(app.static_folder, path)
    else:
        return send_from_directory(app.static_folder, 'index.html')
# @app.route('/', defaults={'path': ''})
# @app.route('/<path:path>')
# def serve(path):
#      path_dir = os.path.abspath("../vite/dist") #path react build
#      if path != "" and os.path.exists(os.path.join(path_dir, path)):
#          return send_from_directory(os.path.join(path_dir), path)
#      else:
#          return send_from_directory(os.path.join(path_dir),'index.html')

@app.route('/api/signup', methods=['POST'])
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

@app.route('/api/login', methods=['POST'])
def login():
    user_details = request.get_json()
    db = get_db()
    cur = db.cursor()
    try:
        # cur.callproc("LoginUser", (user_details['username'], user_details['password']))
        cur.callproc("LoginUser", (user_details['username'], user_details['password']))
        for result in cur.stored_results():
            user = result.fetchone()
            if user:
                user_data = {
                    'user_ID': user[0],
                    'email_id': user[1],
                    'username': user[2],
                    'first_name': user[4],
                    'last_name': user[5],
                    'date_of_birth': user[6]
                }
                token = create_access_token(identity=user_data['user_ID'])
                return jsonify({
                    'response': 'Login successful',
                    'token': token,
                    'expiresIn': '36000000',
                    'user': user_data
                }), 200
            else:
                return jsonify({'response': 'Invalid username or password'}), 401
    except Exception as e:
        print("Error: unable to perform login")
        print(e)
        return jsonify({'response': 'Error in login process'}), 500
    finally:
        cur.close()
        db.close()


@app.route("/api/search", methods=['GET'])
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

@app.route("/api/like_song", methods=['POST'])
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

@app.route("/api/create_playlist", methods=['POST'])
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

@app.route("/api/follow_artist", methods=['POST'])
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

@app.route("/api/add_song_to_playlist", methods=['POST'])
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

@app.route("/api/delete_song_from_playlist", methods=['POST'])
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

@app.route("/api/update_song_details", methods=['POST'])
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

@app.route("/api/update_user_details", methods=['POST'])
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

@app.route("/api/get_playlist_songs", methods=['GET'])
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


if __name__ == '__main__':
    app.run(use_reloader=True, port=5000, threaded=True)