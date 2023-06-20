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
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
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


DELIMITER //

CREATE PROCEDURE RegisterUser(
    IN email_id VARCHAR(255),
    IN username VARCHAR(50),
    IN password VARCHAR(255),
    IN first_name VARCHAR(50),
    IN last_name VARCHAR(50),
    IN date_of_birth DATE
)
BEGIN
    INSERT INTO User (email_id, username, password, first_name, last_name, date_of_birth)
    VALUES (email_id, username, password, first_name, last_name, date_of_birth);
    COMMIT;
END //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS LoginUser;
CREATE PROCEDURE LoginUser(
	IN `user` VARCHAR(50), 
    IN `pass` VARCHAR(50)
)
BEGIN
    SELECT * FROM User WHERE username = `user` AND password = `pass`;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE Search(
    IN query VARCHAR(100),
    IN table_name VARCHAR(100)
)
BEGIN
    SET @search_query = CONCAT('%', query, '%');
    SET @sql_statement = 'SELECT songs.*, album.name AS album_name, GROUP_CONCAT(artist.name) AS artist_names
                          FROM songs 
                            JOIN album ON songs.album_id = album.id 
                            JOIN SongArtist ON songs.id = SongArtist.song_ID 
                            JOIN artist ON SongArtist.artist_ID = artist.id
                          WHERE songs.name LIKE ?
                          GROUP BY songs.id';
;
    PREPARE stmt FROM @sql_statement;
    EXECUTE stmt USING @search_query;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE LikeSong(
    IN user_ID INT,
    IN song_ID INT
)
BEGIN
    INSERT INTO LikedSongs (user_ID, song_ID) VALUES (user_ID, song_ID);
    COMMIT;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreatePlaylist(
    IN name VARCHAR(100),
    IN author VARCHAR(100),
    IN duration INT,
    IN user_ID INT
)
BEGIN
    INSERT INTO Playlist (name, author, duration, user_ID)
    VALUES (name, author, duration, user_ID);
    COMMIT;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE FollowArtist(
    IN user_ID INT,
    IN artist_ID INT
)
BEGIN
    INSERT INTO Followers (user_ID, artist_ID) VALUES (user_ID, artist_ID);
    COMMIT;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddSongToPlaylist(
    IN playlist_id INT,
    IN song_id INT
)
BEGIN
    INSERT INTO PlaylistSongs (playlist_id, song_id)
    VALUES (playlist_id, song_id);
    COMMIT;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE DeleteSongFromPlaylist(
    IN playlist_id INT,
    IN song_id INT
)
BEGIN
    DELETE FROM PlaylistSongs
    WHERE playlist_id = playlist_id AND song_id = song_id;
    COMMIT;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE UpdateSongDetails(
    IN song_id INT,
    IN new_duration INT,
    IN new_language VARCHAR(50)
)
BEGIN
    UPDATE Songs
    SET duration = new_duration, language = new_language
    WHERE song_id = song_id;
    COMMIT;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS GetUserIdByUsername;
DELIMITER //

CREATE PROCEDURE GetUserIdByUsername(
    IN old_username VARCHAR(50),
    OUT user_id INT
)
BEGIN
    SELECT user_id INTO user_id FROM User WHERE username = old_username;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS UpdateUserDetails;

DELIMITER //

CREATE PROCEDURE UpdateUserDetails(
    IN p_user_id INT,
    IN new_email_id VARCHAR(255),
    IN new_username VARCHAR(50),
    IN new_password VARCHAR(255),
    IN new_first_name VARCHAR(50),
    IN new_last_name VARCHAR(50),
    IN new_date_of_birth DATE
)
BEGIN
    -- First, ensure that the new_username isn't already used by another user
    IF NOT EXISTS (SELECT * FROM User WHERE username = new_username AND user_id != p_user_id) THEN
        UPDATE User
        SET email_id = new_email_id, username = new_username, password = new_password,
        first_name = new_first_name, last_name = new_last_name, date_of_birth = new_date_of_birth
        WHERE user_id = p_user_id;
        COMMIT;
    ELSE
        -- Handle the error appropriately. This is just an example.
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Username already exists for another user';
    END IF;
END //


DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetPlaylistSongs(
    IN playlist_id INT
)
BEGIN
    SELECT Songs.*
    FROM Songs
    JOIN PlaylistSongs ON Songs.song_id = PlaylistSongs.song_id
    WHERE PlaylistSongs.playlist_id = playlist_id;
END //

DELIMITER ;
