DELIMITER $$ CREATE TRIGGER BEFORE DELETE ON SpotifyClone.usuario 
FOR EACH ROW BEGIN
DELETE FROM SpotifyClone.seguindo_artistas
WHERE
seguindo_artistas.usuario_id = old.usuario_id;
DELETE FROM SpotifyClone.historico_de_reproducoes 
WHERE 
historico_de_reproducoes.usuario_id = old.usuario_id;
END $$
DELIMITER ;