USE SpotifyClone;
CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(song_name) AS cancoes,
(SELECT COUNT(name) FROM SpotifyClone.artista) AS artista,
(SELECT COUNT(album_name) FROM SpotifyClone.album) AS albuns
FROM SpotifyClone.songs;
