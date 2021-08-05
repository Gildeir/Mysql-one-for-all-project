USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN name VARCHAR(100))
BEGIN
SELECT 
artista.name AS artista, 
album.album_name AS album
from SpotifyClone.artista 
inner join SpotifyClone.album ON album.artista_id = artista.artista_id AND artista.name LIKE name
ORDER BY album;
END $$
DELIMITER ;
