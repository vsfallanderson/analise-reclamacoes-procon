-- 1. Reclamações por estado
SELECT "UF", COUNT(*) AS total_reclamacoes
FROM reclamacoes_procon
GROUP BY "UF"
ORDER BY total_reclamacoes DESC;

-- 2. Empresas com mais reclamações
SELECT "strRazaoSocial", COUNT(*) AS total_reclamacoes
FROM reclamacoes_procon
GROUP BY "strRazaoSocial"
ORDER BY total_reclamacoes DESC
LIMIT 10;

-- 3. Percentual atendidas vs não atendidas
SELECT "Atendida", COUNT(*) AS total,
ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentual
FROM reclamacoes_procon
GROUP BY "Atendida"
ORDER BY total DESC;

-- 4. Problemas mais recorrentes
SELECT "DescricaoProblema", COUNT(*) AS total
FROM reclamacoes_procon
GROUP BY "DescricaoProblema"
ORDER BY total DESC
LIMIT 10;

-- 5. Reclamações por faixa etária
SELECT "FaixaEtariaConsumidor", COUNT(*) AS total
FROM reclamacoes_procon
GROUP BY "FaixaEtariaConsumidor"
ORDER BY total DESC;