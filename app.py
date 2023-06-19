from flask import Flask, send_from_directory
from flask_restful import Api, Resource, reqparse
from flask_cors import CORS #comment this on deployment
from api.HelloApiHandler import HelloApiHandler
from flask_vite import Vite

app = Flask(__name__, static_url_path='', static_folder='vite/dist')
# CORS(app) #comment this on deployment
api = Api(app)
vite = Vite(app)

@app.route("/", defaults={'path':''})
@app.route('/')
@app.route('/signup')
@app.route('/login')
def serve(path):
    return send_from_directory(app.static_folder,'index.html')

api.add_resource(HelloApiHandler, '/flask/hello')