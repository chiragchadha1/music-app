from flask import Flask
from flaskext.mysql import MySQL

app = Flask(__name__)
mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'admin'
app.config['MYSQL_DATABASE_PASSWORD'] = '6kWyqokwLRHqy6HyIvKC'
app.config['MYSQL_DATABASE_HOST'] = 'musicapp.cf3u0flvivkp.us-east-1.rds.amazonaws.com'
app.config['MYSQL_DATABASE_DB'] = 'musicApp'
conn = mysql.connect()
cursor =conn.cursor()

cursor.execute("SELECT * from User")
data = cursor.fetchone()
mysql.init_app(app)

@app.route("/")
def hello():
    return data

if __name__ == "__main__":
    app.run()
