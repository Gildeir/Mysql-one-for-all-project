CREATE VIEW top_2_hits_do_momento AS
SELECT
songs.song_name AS cancao,
COUNT(historico_de_reproducoes.song_id) AS reproducoes
FROM songs
INNER JOIN historico_de_reproducoes
ON historico_de_reproducoes.song_id = songs.song_id
GROUP BY songs.song_name
ORDER BY reproducoes DESC, cancao
LIMIT 2;
