-- schema.sql (compacto)
CREATE DATABASE IF NOT EXISTS minimundo_contrato CHARACTER SET = 'utf8mb4';
USE minimundo_contrato;

-- Cria tabela escola, com chave primária e nome
CREATE TABLE escola (
  escola_id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Cria tabela bruxo, com chave primária, e chave estrangeira referenciando o id da escola
CREATE TABLE bruxo (
  bruxo_id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  escola_id INT,
  FOREIGN KEY (escola_id) REFERENCES escola(escola_id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Cria a tabela cliente com chave primária, ela incrementa a cada registro criado
CREATE TABLE cliente (
  cliente_id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL
) ENGINE=InnoDB;

-- Mesma coisa pra tabela regiao
CREATE TABLE regiao (
  regiao_id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Mesma coisa pra tabela monstro
CREATE TABLE monstro (
  monstro_id INT AUTO_INCREMENT PRIMARY KEY,
  nome_tipo VARCHAR(100) NOT NULL
) ENGINE=InnoDB;





--  - contrato_id: (PK)
--  - cliente_id: referência ao cliente que solicitou o contrato (FK)
--  - regiao_id: referência à região onde o serviço será realizado (FK)
--  - bruxo_responsavel: opcional, bruxo designado para executar o contrato (FK, fica NULL se o bruxo for removido)
--  - descricao: detalhes do serviço/contrato
--  - recompensa: valor pago pelo contrato
--  - status: estado atual do contrato
CREATE TABLE contrato (
  contrato_id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  regiao_id INT NOT NULL,
  bruxo_responsavel INT,
  descricao TEXT,
  recompensa DECIMAL(10,2),
  status VARCHAR(20) NOT NULL DEFAULT 'Aberto',
  FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id),
  FOREIGN KEY (regiao_id) REFERENCES regiao(regiao_id),
  FOREIGN KEY (bruxo_responsavel) REFERENCES bruxo(bruxo_id) ON DELETE SET NULL
) ENGINE=InnoDB;



-- Tabela de associação que liga contratos a monstros (relação muitos-para-muitos).
-- Campos principais:
--  - contrato_id: referência ao contrato (parte da chave primária e FK; ao deletar o contrato, as linhas relacionadas são removidas).
--  - monstro_id: referência ao monstro (parte da chave primária e FK).
-- Chave primária composta (contrato_id, monstro_id) garante que cada par contrato-monstro seja único.
CREATE TABLE contrato_monstro (
  contrato_id INT NOT NULL,
  monstro_id INT NOT NULL,
  PRIMARY KEY (contrato_id, monstro_id),
  FOREIGN KEY (contrato_id) REFERENCES contrato(contrato_id) ON DELETE CASCADE,
  FOREIGN KEY (monstro_id) REFERENCES monstro(monstro_id)
) ENGINE=InnoDB;
