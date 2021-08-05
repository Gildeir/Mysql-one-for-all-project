SELECT
songs.song_name AS nome,
COUNT(historico_de_reproducoes.usuario_id) AS reproducoes
FROM songs
INNER JOIN historico_de_reproducoes
ON songs.album_id = historico_de_reproducoes.album_id
INNER JOIN usuario
ON usuario.usuario_id = historico_de_reproducoes.usuario_id
WHERE usuario.plano_id IN (2, 3)
GROUP BY song_name
ORDER BY reproducoes, nome ASC;