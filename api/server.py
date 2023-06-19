from flask import Flask
from flask_cors import CORS #comment this on deployment

app = Flask(__name__)
CORS(app) #comment this on deployment

# Members API Route
@app.route("/members")
def members():
    return {"Members": ["Member1", "Member2", "Member3"]}

if __name__ == "__main__":
    app.run(debug=True)
