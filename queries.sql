USE minimundo_contrato;

-- 1) Contratos com cliente e bruxo (LEFT JOIN para bruxo opcional)
SELECT c.contrato_id, cli.nome AS cliente, b.nome AS bruxo, c.descricao, c.recompensa, c.status
FROM contrato c
JOIN cliente cli ON c.cliente_id = cli.cliente_id
LEFT JOIN bruxo b ON c.bruxo_responsavel = b.bruxo_id
ORDER BY c.recompensa DESC;

-- 2) Monstros de um contrato (ex.: contrato_id = 1)
SELECT m.monstro_id, m.nome_tipo
FROM monstro m
JOIN contrato_monstro cm ON m.monstro_id = cm.monstro_id
WHERE cm.contrato_id = 1;

-- 3) Contratos abertos com recompensa > 2000
SELECT contrato_id, descricao, recompensa
FROM contrato
WHERE status = 'Aberto' AND recompensa > 2000
ORDER BY recompensa DESC;
