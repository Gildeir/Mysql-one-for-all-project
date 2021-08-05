CREATE VIEW faturamento_atual AS
SELECT
MIN(plano.valor_plano) AS faturamento_minimo,
MAX(plano.valor_plano) AS faturamento_maximo,
ROUND(SUM(plano.valor_plano) / COUNT(usuario.usuario_id), 2) AS faturamento_medio,
SUM(plano.valor_plano) AS faturamento_total
FROM plano
INNER JOIN SpotifyClone.usuario
ON plano.plano_id = usuario.plano_id;
