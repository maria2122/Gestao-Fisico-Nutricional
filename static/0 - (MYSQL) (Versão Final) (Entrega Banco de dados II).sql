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

-- -----------------------------------------------------------------------------
-- Cardapio
-- -----------------------------------------------------------------------------
/*INSERT INTO cardapio(id, data_inicio, data_fim) 
VALUES (1, "2022-03-21", "2022-04-30",  **COLOCAR UM USUÁRIO);*/

-- -----------------------------------------------------------------------------
-- Alimento_Cardapio
-- -----------------------------------------------------------------------------
-- Café com açúcar 50ml
/* **EXECUTAR DEPOIS DE CRIAR AO MENOS UM CARDAPIO PARA LIGAR 
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (1,1,1,3);
-- Café sem açúcar 40ml
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (2,2,1,5);
-- Refrigerante de cola 350ml
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (3,3,1,5);
-- Cupim 100g
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (4,4,1,5);
-- Filé de frango 100g
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (5,5,1,5);
-- Filé-mignon 100g
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (6,6,1,5); */

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