from flask import Flask
import mysql.connector

app = Flask(__name__)

# Establishing the connection
cnx = mysql.connector.connect(
    user="admin",
    password="6kWyqokwLRHqy6HyIvKC",
    host="musicapp.cf3u0flvivkp.us-east-1.rds.amazonaws.com",
    database="musicApp" # Replace with your database name
)

# Creating a cursor object
cur = cnx.cursor()


@app.route("/")
def hello():
    cur.execute('SELECT * FROM User')
    user = cur.fetchall()
    return user[0]

if __name__ == "__main__":
    app.run()
