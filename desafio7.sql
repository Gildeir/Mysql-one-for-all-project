CREATE VIEW perfil_artistas AS
SELECT 
artista.name AS artista,
album.album_name AS album,
COUNT(seguindo_artistas.usuario_id) AS seguidores
FROM artista
INNER JOIN album
ON album.artista_id = artista.artista_id
INNER JOIN seguindo_artistas
ON seguindo_artistas.artista_id = album.artista_id
GROUP BY album.album_id
ORDER BY seguidores DESC, artista, album;
