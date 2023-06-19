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
        cur.execute("INSERT INTO User(email_id, username, password, first_name, last_name, date_of_birth) VALUES (%s, %s, %s, %s, %s, %s)", (user_details['email'], user_details['username'], user_details['password'], user_details['firstName'], user_details['lastName'], user_details['dateOfBirth']))
        db.commit()
        return jsonify({"response": "User created successfully"})
    except Exception as e:
        print("Error: unable to create user")
        print(e)
    return jsonify({"response": "Error in creating user"})

if __name__ == "__main__":
    app.run()
