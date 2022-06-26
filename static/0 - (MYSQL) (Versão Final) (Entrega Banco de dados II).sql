DROP DATABASE IF EXISTS dbgestaofisiconutricional;
CREATE DATABASE dbgestaofisiconutricional;
USE dbgestaofisiconutricional ;


-- -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
-- CRIAÇÃO OBJETOS BANCO DE DADOS
-- -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
-- -----------------------------------------------------
-- Tabela alimento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS alimento (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  descricao VARCHAR(100) NOT NULL,
  valor_calorico INT NOT NULL,
  valor_gordura INT NOT NULL,
  valor_proteina INT NOT NULL,
  valor_carboidrato INT NOT NULL,
  ativo TINYINT(1) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Tabela usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usuario (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(90) NULL,
  login VARCHAR(45) NULL,
  senha VARCHAR(45) NULL,
  cliente TINYINT NULL,
  profissional_ed_fisica TINYINT NULL,
  nutricionista TINYINT NULL,
  administrador TINYINT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Tabela cardapio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cardapio (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  data_inicio DATE NOT NULL,
  data_fim DATE NOT NULL,
  usuario_consumidor_id INT NOT NULL,
  usuario_nutricionista_id INT NOT NULL,
  CONSTRAINT fk_cardapio_usuario
    FOREIGN KEY (usuario_consumidor_id)
    REFERENCES usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Tabela alimento_cardapio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS alimento_cardapio (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  alimento_id INT NOT NULL,
  cardapio_id INT NOT NULL,
  quantidade DECIMAL(10,2) NOT NULL,
  CONSTRAINT fk_alimento
    FOREIGN KEY (alimento_id)
    REFERENCES alimento (id),
  CONSTRAINT fk_cardapio
    FOREIGN KEY (cardapio_id)
    REFERENCES cardapio (id))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Tabela atividade_fisica
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS atividade_fisica (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  descricao VARCHAR(100) NOT NULL,
  gasto_calorico INT NOT NULL,
  ativo TINYINT(1) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Tabela ficha_atividade
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ficha_atividade (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  data_inicio DATE NOT NULL,
  data_fim DATE NOT NULL,
  usuario_praticante_id INT NOT NULL,
  usuario_profissional_ed_fisica_id INT NOT NULL,
  CONSTRAINT fk_ficha_atividade_usuario
    FOREIGN KEY (usuario_praticante_id)
    REFERENCES usuario (id)
    )
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Tabela atividade_fisica_ficha
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS atividade_fisica_ficha (
  id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
  atividade_fisica_id INT NOT NULL,
  ficha_atividade_id INT NOT NULL,
  serie INT NULL,
  repeticao INT NULL,
  tempo_descanso_segundos INT NULL,
  CONSTRAINT fk_atividade_fisica_ficha__atividade_fisica
    FOREIGN KEY (atividade_fisica_id)
    REFERENCES atividade_fisica (id),
  CONSTRAINT fk_atividade_fisica_ficha__ficha_atividade
    FOREIGN KEY (ficha_atividade_id)
    REFERENCES ficha_atividade (id))
ENGINE = InnoDB;



-- -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
-- CARGA DE DADOS INICIAL
-- -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
-- -----------------------------------------------------------------------------
-- Alimento
-- -----------------------------------------------------------------------------
INSERT INTO alimento(id, nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo) 
VALUES (1,"Café com açúcar 50ml","Café com açúcar 50ml",33,0,0,0,1);
INSERT INTO alimento(id, nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo) 
VALUES (2, "Café sem açúcar 40ml","Café sem açúcar 40ml",3,0,0,0,1);
INSERT INTO alimento(id, nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo) 
VALUES (3, "Refrigerante de cola 350ml","Refrigerante de cola 350ml",137,0,0,0,1);
INSERT INTO alimento(id, nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo) 
VALUES (4, "Cupim 100g","Cupim 100g",375,0,0,0,1);
INSERT INTO alimento(id, nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo) 
VALUES (5, "Filé de frango 100g","Filé de frango 100g",101,0,0,0,1);
INSERT INTO alimento(id, nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo) 
VALUES (6, "Filé-mignon 100g","Filé-mignon 100g",140,0,0,0,1);

select * from alimento;

-- -----------------------------------------------------------------------------
-- Atividade_Fisica
-- -----------------------------------------------------------------------------
INSERT INTO atividade_fisica(id, nome, descricao, gasto_calorico, ativo) 
VALUES (1,"Caminhada devagar 1Hr","Caminhada devagar por uma hora", 240, 1);
INSERT INTO atividade_fisica(id, nome, descricao, gasto_calorico, ativo) 
VALUES (2,"Caminhada rápida 1Hr","Caminhada rápida por uma hora", 520, 1);
INSERT INTO atividade_fisica(id, nome, descricao, gasto_calorico, ativo) 
VALUES (3,"Jogar futebol 1Hr","Jogar futebol por uma hora", 580, 1);
INSERT INTO atividade_fisica(id, nome, descricao, gasto_calorico, ativo) 
VALUES (4,"Subir escada 1Hr","Subir escada por uma hora", 1000, 1);
INSERT INTO atividade_fisica(id, nome, descricao, gasto_calorico, ativo) 
VALUES (5,"Dormir 1Hr","Dormir por uma hora", 60, 1);
INSERT INTO atividade_fisica(id, nome, descricao, gasto_calorico, ativo) 
VALUES (6,"Limpeza 1Hr","Limpeza de casa por uma hora", 60, 1);

select * from atividade_fisica;
-- -----------------------------------------------------------------------------
-- Usuario
-- -----------------------------------------------------------------------------

INSERT INTO usuario(id, nome, login, senha, cliente, profissional_ed_fisica, nutricionista, administrador)
VALUES(1,"Marcio Augusto dos Santos","marcio.augusto","123", 1, 1, 1, 1);

INSERT INTO usuario(id, nome, login, senha, cliente, profissional_ed_fisica, nutricionista, administrador)
VALUES(2,"Vanessa Cristina Pallos","vanessa.cristina","123", 0, 0, 1, 0);

INSERT INTO usuario(id, nome, login, senha, cliente, profissional_ed_fisica, nutricionista, administrador)
VALUES(3,"Elizabeth Madeira","elizabeth.madeira","123", 0, 1, 0, 0);

INSERT INTO usuario(id, nome, login, senha, cliente, profissional_ed_fisica, nutricionista, administrador)
VALUES(4,"Antonio Carlos Silva","antonio.carlos","123", 1, 0, 0, 0);

select * from usuario;

-- -----------------------------------------------------------------------------
-- Cardapio
-- -----------------------------------------------------------------------------
-- Usuário 4 - Cliente (em todos os cardápios)

INSERT INTO cardapio(id, data_inicio, data_fim, usuario_consumidor_id) 
VALUES (1, "2022-03-21", "2022-04-21",  4);

INSERT INTO cardapio(id, data_inicio, data_fim, usuario_consumidor_id) 
VALUES (2, "2022-04-21", "2022-05-21",  4);

INSERT INTO cardapio(id, data_inicio, data_fim, usuario_consumidor_id) 
VALUES (3, "2022-05-21", "2022-06-21",  4);

INSERT INTO cardapio(id, data_inicio, data_fim, usuario_consumidor_id) 
VALUES (4, "2022-06-21", "2022-07-21",  4);

select * from cardapio;

-- -----------------------------------------------------------------------------
-- Alimento_Cardapio -- Cardinalidade N:N(tbls Alimento:Cardapio)
-- -----------------------------------------------------------------------------
-- Café com açúcar 50ml
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (1,1,1,3);
-- Café sem açúcar 40ml
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (2,2,1,5);
-- Refrigerante de cola 350ml
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (3,3,2,5);
-- Cupim 100g
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (4,4,3,5);
-- Filé de frango 100g
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (5,5,3,5);
-- Filé-mignon 100g
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (6,6,4,5); 

select * from alimento_cardapio;

-- -----------------------------------------------------------------------------
-- Ficha_Atividade - Usuário 4 Cliente que seguirá o mesmo período do cardápio
-- -----------------------------------------------------------------------------
INSERT INTO ficha_atividade(id, data_inicio, data_fim, usuario_praticante_id)
VALUES (1, "2022-03-21", "2022-04-21",  4);

INSERT INTO ficha_atividade(id, data_inicio, data_fim, usuario_praticante_id)
VALUES (2, "2022-04-21", "2022-05-21",  4);

INSERT INTO ficha_atividade(id, data_inicio, data_fim, usuario_praticante_id)
VALUES (3, "2022-05-21", "2022-06-21",  4);

INSERT INTO ficha_atividade(id, data_inicio, data_fim, usuario_praticante_id)
VALUES (4, "2022-06-21", "2022-07-21",  4);

select * from ficha_atividade;

-- -----------------------------------------------------------------------------
-- Atividade_Fisica_Ficha -- Cardinalidade N:N(tbls Atividade_Fisica:Ficha)
-- -----------------------------------------------------------------------------

INSERT INTO atividade_fisica_ficha(id, atividade_fisica_id, ficha_atividade_id, serie, repeticao, tempo_descanso_segundos)
VALUES(1, 1, 2, 15,5,600);

INSERT INTO atividade_fisica_ficha(id, atividade_fisica_id, ficha_atividade_id, serie, repeticao, tempo_descanso_segundos)
VALUES(2, 2, 1, 15,5,900);

INSERT INTO atividade_fisica_ficha(id, atividade_fisica_id, ficha_atividade_id, serie, repeticao, tempo_descanso_segundos)
VALUES(3, 3, 3, 30,5,300);

INSERT INTO atividade_fisica_ficha(id, atividade_fisica_id, ficha_atividade_id, serie, repeticao, tempo_descanso_segundos)
VALUES(4, 4, 3, 30,5,900);

INSERT INTO atividade_fisica_ficha(id, atividade_fisica_id, ficha_atividade_id, serie, repeticao, tempo_descanso_segundos)
VALUES(5, 5, 4, 60,5,300);

INSERT INTO atividade_fisica_ficha(id, atividade_fisica_id, ficha_atividade_id, serie, repeticao, tempo_descanso_segundos)
VALUES(6, 6, 1, 60,5,600);

select * from atividade_fisica_ficha;



-- -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
-- CONSULTAS
-- -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
-- -----------------------------------------------------------------------------
-- Consulta: Resumo de Ficha de Atividade
-- -----------------------------------------------------------------------------
DROP VIEW IF EXISTS vw_ficha_atividade_resumo;
CREATE VIEW vw_ficha_atividade_resumo AS 
SELECT
	usuario_praticante.id AS id_praticante,
	usuario_praticante.nome AS nome_praticante,
  ficha_atividade.id AS id_ficha,
	ficha_atividade.data_inicio AS data_inicio_ficha_atividade,
	ficha_atividade.data_fim AS data_fim_ficha_atividade,
	atividade_fisica.descricao AS descricao_atividade_fisica,
	atividade_fisica.gasto_calorico AS gasto_calorico_atividade_fisica,
	atividade_fisica_ficha.serie AS nr_serie_ficha_item,
	atividade_fisica_ficha.repeticao AS nr_repeticao_ficha_item,
	atividade_fisica_ficha.tempo_descanso_segundos AS tempo_descanso_em_segundos,
												/* 2 Segundos estimados para cada repetição */
	((atividade_fisica_ficha.serie * (atividade_fisica_ficha.repeticao * 2)) + 
		atividade_fisica_ficha.tempo_descanso_segundos) AS tempo_minimo_execucao_item_ficha_atividade 	
FROM ficha_atividade
LEFT JOIN usuario usuario_prof_ed_fis
	ON ficha_atividade.usuario_profissional_ed_fisica_id = usuario_prof_ed_fis.id
INNER JOIN usuario usuario_praticante
	ON ficha_atividade.usuario_praticante_id = usuario_praticante.id
INNER JOIN atividade_fisica_ficha
	ON ficha_atividade.id = atividade_fisica_ficha.ficha_atividade_id
INNER JOIN atividade_fisica
	ON atividade_fisica_ficha.atividade_fisica_id = atividade_fisica.id;

SELECT * FROM vw_ficha_atividade_resumo;

SELECT 
	ficha_resumo.id_praticante,
	ficha_resumo.nome_praticante,
	SUM(ficha_resumo.gasto_calorico_atividade_fisica) 
		AS gasto_calorico_estimado_por_execucao_fichas_vigente_por_hora,
	SUM(ficha_resumo.tempo_minimo_execucao_item_ficha_atividade) / 60 
		as Tempo_execucao_minimo_fichas_vigente_em_minutos
FROM vw_ficha_atividade_resumo AS ficha_resumo
WHERE CURDATE() between ficha_resumo.data_inicio_ficha_atividade AND ficha_resumo.data_fim_ficha_atividade
GROUP BY ficha_resumo.id_praticante, ficha_resumo.nome_praticante;
-- -----------------------------------------------------------------------------
-- Consulta: Resumo de Cardapio
-- -----------------------------------------------------------------------------
DROP VIEW IF EXISTS vw_cardapio_resumo;
CREATE VIEW vw_cardapio_resumo AS 
SELECT
	usuario_consumidor.id,
	usuario_consumidor.nome,
	cardapio.data_inicio,
	cardapio.data_fim,
	alimento.descricao,
	alimento.valor_calorico,
	alimento_cardapio.quantidade	
FROM cardapio
LEFT JOIN usuario as usuario_nutricionista
	ON cardapio.usuario_nutricionista_id = usuario_nutricionista.id
INNER JOIN usuario as usuario_consumidor
	ON cardapio.usuario_consumidor_id = usuario_consumidor.id
INNER JOIN alimento_cardapio
	ON cardapio.id = alimento_cardapio.cardapio_id
INNER JOIN alimento
	ON alimento_cardapio.alimento_id = alimento.id;

SELECT 
	cardapio_resumo.id,
	cardapio_resumo.nome,
	SUM(cardapio_resumo.valor_calorico * cardapio_resumo.quantidade)	AS consumo_diario_cardapio
FROM vw_cardapio_resumo AS cardapio_resumo
WHERE '2022-03-30' BETWEEN data_inicio AND data_fim
GROUP BY cardapio_resumo.id, cardapio_resumo.nome;


-- -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
-- PROCEDIMENTO ARMAZENADO - STORED PROCEDURE
-- -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
-- -----------------------------------------------------------------------------
-- Calculo de media de tempo mínimo em minutos para execucao de todas fichas no sistema
-- -----------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS sp_media_tempo_minimo_em_minuto_execucao_ficha_atividade;
DELIMITER |
CREATE PROCEDURE sp_media_tempo_minimo_em_minuto_execucao_ficha_atividade () 
BEGIN
	DECLARE tempo_total FLOAT;
	DECLARE quantidade_fichas FLOAT;
	DECLARE media_em_minutos FLOAT;
	
	SET tempo_total = (	SELECT 
									SUM(tempo_minimo_execucao_item_ficha_atividade) 
								FROM vw_ficha_atividade_resumo);
								
	SET quantidade_fichas = (	SELECT 
									COUNT(DISTINCT id_ficha) 
								FROM vw_ficha_atividade_resumo);
								
	SET media_em_minutos = round(tempo_total / quantidade_fichas, 4);
	
	SELECT media_em_minutos;
END
|
DELIMITER ;
-- -----------------------------------------------------------------------------
-- Chamada Stored Procedure
-- -----------------------------------------------------------------------------
CALL sp_media_tempo_minimo_em_minuto_execucao_ficha_atividade();

