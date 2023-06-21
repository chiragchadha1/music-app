-- create the database
DROP DATABASE IF EXISTS musicApp;
CREATE DATABASE musicApp;

-- select the database
USE musicApp;

CREATE TABLE User (
    user_ID INT AUTO_INCREMENT PRIMARY KEY,
    email_id VARCHAR(255) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
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

CREATE TABLE Song (
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
    FOREIGN KEY (song_ID) REFERENCES Song(song_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (artist_ID) REFERENCES Artist(artist_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE LikedSongs (
    user_ID INT,
    song_ID INT,
    date_and_time_liked DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_ID, song_ID),
    FOREIGN KEY (user_ID) REFERENCES User(user_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (song_ID) REFERENCES Song(song_ID) ON DELETE CASCADE ON UPDATE CASCADE
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
    duration INT DEFAULT 0,
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
    FOREIGN KEY (song_ID) REFERENCES Song(song_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE Song ADD COLUMN song_name VARCHAR(100) NOT NULL AFTER song_id;

ALTER TABLE Album ADD COLUMN album_name VARCHAR(100) NOT NULL AFTER album_id;

ALTER TABLE Song ADD COLUMN release_date DATE NOT NULL AFTER song_name;

ALTER TABLE Album ADD COLUMN release_date DATE NOT NULL AFTER album_name;


DROP PROCEDURE IF EXISTS RegisterUser;

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

DROP PROCEDURE IF EXISTS LoginUser;

DELIMITER //

CREATE PROCEDURE LoginUser(
	IN `user` VARCHAR(50), 
    IN `pass` VARCHAR(50)
)
BEGIN
    SELECT * FROM User WHERE username = `user` AND password = `pass`;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS SearchAll;

DELIMITER //

CREATE PROCEDURE SearchAll(
    IN search_query VARCHAR(100)
)
BEGIN
    SET @pattern = CONCAT('%', search_query, '%');

    -- Search in Song
    SELECT Song.song_id AS id, Song.song_name AS name, Album.album_name AS album_name, GROUP_CONCAT(DISTINCT Artist.artist_name) AS artist_name, 'song' AS type
    FROM Song
    LEFT JOIN Album ON Song.album_ID = Album.album_ID
    LEFT JOIN SongArtist ON Song.song_id = SongArtist.song_ID
    LEFT JOIN Artist ON SongArtist.artist_ID = Artist.artist_ID
    WHERE Song.song_name LIKE @pattern OR Artist.artist_name LIKE @pattern OR Album.album_name LIKE @pattern
    GROUP BY Song.song_id

    UNION ALL

    -- Search in Artists table only
    SELECT Artist.artist_id AS id, Artist.artist_name AS name, NULL AS album_name, NULL AS artist_name, 'artist' AS type
    FROM Artist
    WHERE Artist.artist_name LIKE @pattern

    UNION ALL

    -- Search in Albums table only
    SELECT Album.album_id AS id, Album.album_name AS name, NULL AS album_name, NULL AS artist_name, 'album' AS type
    FROM Album
    WHERE Album.album_name LIKE @pattern;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS LikeSong;

DELIMITER //

CREATE PROCEDURE LikeSong(IN user_id INT, IN song_id INT)
BEGIN
    INSERT INTO LikedSongs (user_id, song_id, date_and_time_liked) VALUES (user_id, song_id, NOW());
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS UnlikeSong;

DELIMITER //

CREATE PROCEDURE UnlikeSong(IN user_id INT, IN song_id INT)
BEGIN
    DELETE FROM LikedSongs WHERE user_id = user_id AND song_id = song_id;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS LikePlaylist;

DELIMITER //

CREATE PROCEDURE LikePlaylist(IN user_id INT, IN playlist_id INT)
BEGIN
    INSERT INTO PlaylistLikes (user_id, playlist_id) VALUES (user_id, playlist_id);
END // 

DELIMITER ;

DROP PROCEDURE IF EXISTS LikePlaylist;

DELIMITER //

CREATE PROCEDURE UnlikePlaylist(IN user_id INT, IN playlist_id INT)
BEGIN
    DELETE FROM PlaylistLikes WHERE user_id = user_id AND playlist_id = playlist_id;
END // 

DELIMITER ;

DROP PROCEDURE IF EXISTS CreatePlaylist;

DELIMITER //

CREATE PROCEDURE CreatePlaylist(
    IN name VARCHAR(100),
    IN author VARCHAR(100),
    IN user_ID INT
)
BEGIN
    INSERT INTO Playlist (name, author, user_ID)
    VALUES (name, author, user_ID);
    COMMIT;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS FollowArtist;

DELIMITER //

CREATE PROCEDURE FollowArtist(
    IN user_ID INT,
    IN artist_ID INT
)
BEGIN
    INSERT INTO UpdateUserDetailsFollowers (user_ID, artist_ID) VALUES (user_ID, artist_ID);
    UPDATE Artist SET follower_count = follower_count + 1 WHERE artist_ID = artist_ID;
    COMMIT;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS AddSongToPlaylist;

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

DROP PROCEDURE IF EXISTS DeleteSongFromPlaylist;

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

DROP PROCEDURE IF EXISTS UpdateSongDetails;

DELIMITER //

CREATE PROCEDURE UpdateSongDetails(
    IN song_id INT,
    IN new_duration INT,
    IN new_language VARCHAR(50)
)
BEGIN
    UPDATE Song
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
        -- Handle the error appropriately.
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Username already exists for another user';
    END IF;
END //


DELIMITER ;
DROP PROCEDURE IF EXISTS GetPlaylistSongs;

DELIMITER //

CREATE PROCEDURE GetPlaylistSongs(
	IN playlist_id INT
)
BEGIN
	SELECT Song.song_ID, Song.duration, Song.language, Song.album_ID, Song.song_name, Song.release_date
    FROM Song
    INNER JOIN PlaylistSongs ON Song.song_ID = PlaylistSongs.song_ID
    WHERE PlaylistSongs.playlist_ID = playlist_id;
END //

DELIMITER ;
DROP PROCEDURE IF EXISTS DeleteSongFromPlaylist;

DELIMITER //

CREATE PROCEDURE DeleteSongFromPlaylist(
	IN p_playlist_id INT,
    IN p_song_id INT
)
BEGIN
	DELETE FROM PlaylistSongs
    WHERE playlist_ID = p_playlist_id AND song_ID = p_song_id;
    COMMIT;
END //

DELIMITER ;

DELIMITER //
	
CREATE TRIGGER update_follower_count
AFTER INSERT ON Followers
FOR EACH ROW
BEGIN
    -- Increment the follower count when a new follower is added
    UPDATE Artist SET follower_count = follower_count + 1 WHERE artist_ID = NEW.artist_ID;
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER decrease_follower_count
AFTER DELETE ON Followers
FOR EACH ROW
BEGIN
    -- Decrement the follower count when a follower is removed
    UPDATE Artist SET follower_count = follower_count - 1 WHERE artist_ID = OLD.artist_ID;
END//

DELIMITER ;