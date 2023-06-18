-- create the database
DROP DATABASE IF EXISTS musicApp;
CREATE DATABASE musicApp;

-- select the database
USE musicApp;


CREATE TABLE User (
    user_ID INT AUTO_INCREMENT PRIMARY KEY,
    email_id VARCHAR(255) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    profile_pic BLOB
);

CREATE TABLE Artist (
    artist_ID INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(100) NOT NULL,
    follower_count INT DEFAULT 0,
    profile_pic BLOB
);

CREATE TABLE Genre (
    Genre_ID INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

CREATE TABLE Album (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    duration INT NOT NULL,
    cover_art BLOB,
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES Genre(Genre_ID) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Songs (
    song_ID INT AUTO_INCREMENT PRIMARY KEY,
    duration INT NOT NULL,
    language VARCHAR(50) NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Album(album_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE SongArtist (
    song_ID INT,
    artist_ID INT,
    PRIMARY KEY (song_ID, artist_ID),
    FOREIGN KEY (song_ID) REFERENCES Songs(song_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (artist_ID) REFERENCES Artist(artist_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE LikedSongs (
    user_ID INT,
    song_ID INT,
    date_and_time_liked DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_ID, song_ID),
    FOREIGN KEY (user_ID) REFERENCES User(user_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (song_ID) REFERENCES Songs(song_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Followers (
    user_ID INT,
    artist_ID INT,
    PRIMARY KEY (user_ID, artist_ID),
    FOREIGN KEY (user_ID) REFERENCES User(user_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (artist_ID) REFERENCES Artist(artist_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Playlist (
    playlist_ID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    duration INT NOT NULL,
    cover_image BLOB,
    playlist_like_count INT DEFAULT 0,
    user_ID INT,
    FOREIGN KEY (user_ID) REFERENCES User(user_ID) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE PlaylistLikes (
    user_ID INT,
    playlist_ID INT,
    PRIMARY KEY (user_ID, playlist_ID),
    FOREIGN KEY (user_ID) REFERENCES User(user_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (playlist_ID) REFERENCES Playlist(playlist_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PlaylistSongs (
    playlist_ID INT,
    song_ID INT,
    PRIMARY KEY (playlist_ID, song_ID),
    FOREIGN KEY (playlist_ID) REFERENCES Playlist(playlist_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (song_ID) REFERENCES Songs(song_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- SELECT * FROM User;