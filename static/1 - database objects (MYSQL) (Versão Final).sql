-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION";

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dbgestaofisiconutricional
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbgestaofisiconutricional
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS "dbgestaofisiconutricional" DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE "dbgestaofisiconutricional" ;

-- -----------------------------------------------------
-- Table "dbgestaofisiconutricional"."alimento"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "dbgestaofisiconutricional"."alimento" (
  "id" INT NOT NULL AUTO_INCREMENT,
  "nome" VARCHAR(20) NOT NULL,
  "descricao" VARCHAR(100) NOT NULL,
  "valor_calorico" INT NOT NULL,
  "valor_gordura" INT NOT NULL,
  "valor_proteina" INT NOT NULL,
  "valor_carboidrato" INT NOT NULL,
  "ativo" TINYINT(1) NOT NULL,
  PRIMARY KEY ("id"))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table "dbgestaofisiconutricional"."usuario"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "dbgestaofisiconutricional"."usuario" (
  "id" INT NOT NULL AUTO_INCREMENT,
  "nome" VARCHAR(90) NULL,
  "login" VARCHAR(45) NULL,
  "senha" VARCHAR(45) NULL,
  "cliente" TINYINT NULL,
  "profissional_ed_fisica" TINYINT NULL,
  "nutricionista" TINYINT NULL,
  "administrador" TINYINT NULL,
  PRIMARY KEY ("id"))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table "dbgestaofisiconutricional"."cardapio"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "dbgestaofisiconutricional"."cardapio" (
  "id" INT NOT NULL AUTO_INCREMENT,
  "data_inicio" DATE NOT NULL,
  "data_fim" DATE NOT NULL,
  "usuario_consumidor_id" INT NOT NULL,
  PRIMARY KEY ("id", "usuario_consumidor_id"),
  INDEX "fk_cardapio_usuario1_idx" ("usuario_consumidor_id" ASC) VISIBLE,
  CONSTRAINT "fk_cardapio_usuario1"
    FOREIGN KEY ("usuario_consumidor_id")
    REFERENCES "dbgestaofisiconutricional"."usuario" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table "dbgestaofisiconutricional"."alimento_cardapio"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "dbgestaofisiconutricional"."alimento_cardapio" (
  "id" INT NOT NULL AUTO_INCREMENT,
  "alimento_id" INT NOT NULL,
  "cardapio_id" INT NOT NULL,
  "quantidade" DECIMAL(10,2) NOT NULL,
  PRIMARY KEY ("id"),
  INDEX "fk_alimento" ("alimento_id" ASC) VISIBLE,
  INDEX "fk_cardapio" ("cardapio_id" ASC) VISIBLE,
  CONSTRAINT "fk_alimento"
    FOREIGN KEY ("alimento_id")
    REFERENCES "dbgestaofisiconutricional"."alimento" ("id"),
  CONSTRAINT "fk_cardapio"
    FOREIGN KEY ("cardapio_id")
    REFERENCES "dbgestaofisiconutricional"."cardapio" ("id"))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table "dbgestaofisiconutricional"."atividade_fisica"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "dbgestaofisiconutricional"."atividade_fisica" (
  "id" INT NOT NULL AUTO_INCREMENT,
  "nome" VARCHAR(40) NOT NULL,
  "descricao" VARCHAR(100) NOT NULL,
  "gasto_calorico" INT NOT NULL,
  "ativo" TINYINT(1) NOT NULL,
  PRIMARY KEY ("id"))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table "dbgestaofisiconutricional"."ficha_atividade"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "dbgestaofisiconutricional"."ficha_atividade" (
  "id" INT NOT NULL AUTO_INCREMENT,
  "data_inicio" DATE NOT NULL,
  "data_fim" DATE NOT NULL,
  "usuario_praticante_id" INT NOT NULL,
  PRIMARY KEY ("id", "usuario_praticante_id"),
  INDEX "fk_ficha_atividade_usuario1_idx" ("usuario_praticante_id" ASC) VISIBLE,
  CONSTRAINT "fk_ficha_atividade_usuario1"
    FOREIGN KEY ("usuario_praticante_id")
    REFERENCES "dbgestaofisiconutricional"."usuario" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table "dbgestaofisiconutricional"."atividade_fisica_ficha"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "dbgestaofisiconutricional"."atividade_fisica_ficha" (
  "id" INT NOT NULL AUTO_INCREMENT,
  "atividade_fisica_id" INT NOT NULL,
  "ficha_atividade_id" INT NOT NULL,
  "serie" INT NULL,
  "repeticao" INT NULL,
  "tempo_descanso_segundos" INT NULL,
  PRIMARY KEY ("id", "atividade_fisica_id", "ficha_atividade_id"),
  INDEX "fk_atividade_fisica_has_ficha_atividade_ficha_atividade1_idx" ("ficha_atividade_id" ASC) VISIBLE,
  INDEX "fk_atividade_fisica_has_ficha_atividade_atividade_fisica1_idx" ("atividade_fisica_id" ASC) VISIBLE,
  CONSTRAINT "fk_atividade_fisica_has_ficha_atividade_atividade_fisica1"
    FOREIGN KEY ("atividade_fisica_id")
    REFERENCES "dbgestaofisiconutricional"."atividade_fisica" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_atividade_fisica_has_ficha_atividade_ficha_atividade1"
    FOREIGN KEY ("ficha_atividade_id")
    REFERENCES "dbgestaofisiconutricional"."ficha_atividade" ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
