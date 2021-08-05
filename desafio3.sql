USE SpotifyClone;
CREATE VIEW historico_reproducao_usuarios AS
SELECT
usuario.name AS usuario,
songs.song_name As nome
FROM SpotifyClone.usuario
INNER JOIN SpotifyClone.historico_de_reproducoes
ON historico_de_reproducoes.usuario_id = usuario.usuario_id
INNER JOIN SpotifyClone.songs
ON songs.song_id = historico_de_reproducoes.song_id
ORDER BY usuario, song_name;
