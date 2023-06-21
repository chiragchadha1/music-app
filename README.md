# Music App

## Introduction

The application can be ran through two interfaces: The Flask/React front-end, which allows users to register, login, view profile info, and delete account. Additionally, the application can be ran through the CLI, which allows users to perform all CRUD operations on the database, such as registering, logging in, creating playlists, liking songs, following aritsts, etc. The CLI is written in Python and interacts with a MySQL database to perform various operations related to music management. The main script is `main.py`.

This is a music application built with Flask, a Python web framework. The application uses Flask-RESTful for creating the API and Flask-Cors for handling Cross-Origin Resource Sharing (CORS). It allows users to create users, log in, and perform CRUD operations to our database.

# Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.


## MySQL Setup
By default, `server.py` uses AWS RDS as the host for the online database. If you wish to host the MySQL database on your local machine perform the following instructions.

1.


## Python/Flask Server/Backend Setup

The application requires Python and the following Python packages:

- aniso8601==9.0.1
- blinker==1.6.2
- click==8.1.3
- Flask==2.3.2
- Flask-Cors==3.0.10
- Flask-MySQL==1.5.2
- Flask-RESTful==0.3.10
- flask-vite==0.2.4
- gunicorn==20.1.0
- itsdangerous==2.1.2
- Jinja2==3.1.2
- MarkupSafe==2.1.3
- mysql-connector-python==8.0.33
- protobuf==3.20.3
- PyMySQL==1.0.3
- pytz==2023.3
- six==1.16.0
- Werkzeug==2.3.6

You can install these packages using pip in step 4

 ```
## Installation
1. Clone the repository to your local machine:

```bash
git clone https://github.com/chiragchadha1/music-app/
```
You can also use the provided ZIP file to download the files

2. Navigate to the project directory:
```bash
cd music-app
```

3. Activate the Python virtual environment:
```bash
source venv/ben/activate
```

4. Install the required Python packages:
```bash
pip install -r requirements.txt
```

5. Navigate to the api directory:
```bash
cd api
```
6. Run the backend application:
```bash
python server.py
```

The backend (server) is now running

## React.js / Vite.js Frontend Setup
Once the project is on your local machine, begin by navigating to the frontend dictory (vite)

1. Navigate to the vite directory
```bash
cd vite
```

2. Install the required Node.js modules
```bash
npm install
```

3. Run the frontend application:
```bash
npm run dev
```

The frontend is now running.

## Technology Download Pages

For your convenience, here are the download pages for the technologies used in this project:

- [Python](https://www.python.org/downloads/)
- [Flask](https://flask.palletsprojects.com/en/2.1.x/installation/#installation)
- [Flask-RESTful](https://flask-restful.readthedocs.io/en/latest/installation.html)
- [Flask-Cors](https://flask-cors.readthedocs.io/en/latest/)
- [Flask-MySQL](https://pypi.org/project/Flask-MySQL/)
- [mysql-connector-python](https://pypi.org/project/mysql-connector-python/)
- [gunicorn](https://gunicorn.org/#installation)

Please ensure you have the correct versions of the technologies as specified in the prerequisites section.



# Music App CLI

This is a command-line interface (CLI) for a music application. The CLI is written in Python and interacts with a MySQL database to perform various operations related to music management. The main script is `main.py`.

## Main Features

The CLI provides the following features:

1. **User Registration**: Users can register by providing their email, username, password, first name, last name, and date of birth.
2. **User Login**: Users can log in using their username and password.
3. **Playlist Creation**: Logged-in users can create a playlist by providing a playlist name and author.
4. **Add Song to Playlist**: Logged-in users can add a song to a playlist.
5. **Print All Songs with Artist**: Prints a list of all songs along with their respective artists.
6. **Remove Song from Playlist**: Logged-in users can remove a song from a playlist.
7. **Print Playlist**: Prints the details of a specific playlist.
8. **Print All Artists**: Prints a list of all artists.
9. **Follow Artist**: Logged-in users can follow an artist.
10. **Unfollow Artist**: Logged-in users can unfollow an artist.
11. **Search All**: Logged-in users can search for songs and artists.
12. **Like Song**: Logged-in users can like a song.
13. **Unlike Song**: Logged-in users can unlike a song.
14. **Like Playlist**: Logged-in users can like a playlist.
15. **Unlike Playlist**: Logged-in users can unlike a playlist.
16. **Exit**: Exit the application.

## How to Run

To run the CLI, execute the `main.py` script. You can do this by navigating into the cli directory and then executing `python3 main.py` or `python main.py` You will be presented with a menu of options corresponding to the features listed above. Enter the number of the option you want to perform and follow the prompts.

## Code Structure

The `main.py` script contains a `main` function that serves as the entry point for the CLI. This function presents the menu to the user and calls the appropriate function based on the user's choice.

Each feature is implemented as a separate function. For example, the `register_user` function handles user registration, the `login_user` function handles user login, and so on. These functions interact with the MySQL database using the `mysql.connector` library.

## Database Connection

The script connects to a MySQL database hosted on Amazon RDS. The connection details (user, password, host, and database name) are hard-coded in the `connect_to_database` function. This function establishes the connection and returns a connection object and a cursor object.

## Error Handling

Each function includes error handling to catch and report any errors that occur when interacting with the database. If an error occurs, the function prints an error message and, in some cases, rolls back any changes made during the function's execution.