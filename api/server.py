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

@app.route('/api/signup', methods=['POST'], strict_slashes=False)
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

@app.route('/api/login', methods=['POST'], strict_slashes=False)
def login():
    user_details = request.get_json()
    db = get_db()
    cur = db.cursor()
    try:
        cur.callproc("LoginUser", (user_details['username'], user_details['password']))
        for result in cur.stored_results():
            user = result.fetchone()
            if user:
                user_data = {
                    'user_ID': user[0],
                    'email_id': user[1],
                    'username': user[2],
                    'password': user[3],
                    'first_name': user[4],
                    'last_name': user[5],
                    'date_of_birth': user[6],
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

def get_user_id_by_username(username):
    db = get_db()
    cur = db.cursor()
    try:
        cur.execute("SELECT user_id FROM User WHERE username = %s", (username,))
        result = cur.fetchone()
        return result[0] if result else None
    except Exception as e:
        print(f"An error occurred: {e}")
        db.rollback()

@app.route("/api/update_user_details", methods=['POST'], strict_slashes=False)
def update_user_details():
    user_details = request.get_json()
    print(user_details)
    user_id = get_user_id_by_username(user_details['old_username'])
    print(user_id)
    db = get_db()
    cur = db.cursor()
    try:
        cur.callproc("UpdateUserDetails", (
            user_id,
            user_details['email'],
            user_details['username'],
            user_details['password'],
            user_details['first_name'],
            user_details['last_name'],
            user_details['date_of_birth']
        ))
        db.commit()
        return jsonify({'response': 'User details updated successfully'})
    except Exception as e:
        print("Error: unable to update user details")
        print(e)
        # Return error message in response
        return jsonify({'response': 'Error in updating user details', 'error': str(e)}), 500

def delete_user_from_db(user_id):
    db = get_db()
    cur = db.cursor()
    try:
        cur.execute("DELETE FROM User WHERE user_id = %s", (user_id,))
        db.commit()
        return True
    except Exception as e:
        print(f"An error occurred: {e}")
        db.rollback()
        return False


@app.route("/api/delete_user", methods=['DELETE'], strict_slashes=False)
def delete_user():
    user_details = request.get_json()
    user_id = get_user_id_by_username(user_details['username'])
    print(user_id)
    if user_id:
        success = delete_user_from_db(user_id)
        if success:
            return jsonify({'response': 'User deleted successfully'})
        else:
            return jsonify({'response': 'Error in deleting user'}), 500
    else:
        return jsonify({'response': 'User not found'}), 404


if __name__ == '__main__':
    app.run(use_reloader=True, port=5000, threaded=True)