from flask import Flask, jsonify, g
import mysql.connector

app = Flask(__name__)

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

if __name__ == "__main__":
    app.run()
