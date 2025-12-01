USE minimundo_contrato;

INSERT INTO escola (nome) VALUES ('Academia Arcana');
INSERT INTO bruxo (nome, escola_id) VALUES ('Galdor Silvaran', 1);

INSERT INTO cliente (nome) VALUES ('Prefeitura de Várzea');
INSERT INTO regiao (nome) VALUES ('Floresta Sombria');

INSERT INTO monstro (nome_tipo) VALUES ('Troll das Cavernas'), ('Vespertilion');

INSERT INTO contrato (cliente_id, regiao_id, bruxo_responsavel, descricao, recompensa, status)
VALUES
(1, 1, 1, 'Remoção de trolls no rio', 15000.00, 'Aberto'),
(1, 1, NULL, 'Caçar Vespertilions', 3000.00, 'Aberto');

INSERT INTO contrato_monstro (contrato_id, monstro_id) VALUES
(1, 1),
(2, 2);
