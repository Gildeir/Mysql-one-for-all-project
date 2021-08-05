USE SpotifyClone;
CREATE VIEW top_3_artistas AS
SELECT
artista.name AS artista,
COUNT(seguindo_artistas.usuario_id) AS seguidores
FROM artista
INNER JOIN seguindo_artistas
ON seguindo_artistas.artista_id = artista.artista_id
GROUP BY artista.name
ORDER BY seguidores DESC, artista.name
LIMIT 3;
