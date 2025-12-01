USE minimundo_contrato;

-- UPDATE 1: Atribuir bruxo a contrato sem bruxo
UPDATE contrato
SET bruxo_responsavel = 1, status = 'Em Andamento'
WHERE contrato_id = 2 AND bruxo_responsavel IS NULL;

-- UPDATE 2: Aumentar 5% da recompensa para contratos abertos
UPDATE contrato
SET recompensa = ROUND(recompensa * 1.05, 2)
WHERE status = 'Aberto';

-- DELETE 1: Remover associações inválidas 
DELETE cm FROM contrato_monstro cm
LEFT JOIN contrato c ON cm.contrato_id = c.contrato_id
WHERE c.contrato_id IS NULL;

-- DELETE 2: Remover contratos com recompensa nula ou zero
DELETE FROM contrato
WHERE recompensa IS NULL OR recompensa <= 0;
