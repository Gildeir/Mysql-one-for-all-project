CREATE VIEW faturamento_atual AS
SELECT
ROUND(MIN(plano.valor_plano), 2) AS faturamento_minimo,
ROUND(MAX(plano.valor_plano), 2) AS faturamento_maximo,
ROUND(SUM(plano.valor_plano) / COUNT(usuario.usuario_id), 2) AS faturamento_medio,
ROUND(SUM(plano.valor_plano), 2) AS faturamento_total
FROM plano
INNER JOIN SpotifyClone.usuario
ON plano.plano_id = usuario.plano_id;
