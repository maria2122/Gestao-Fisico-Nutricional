SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS dbgestaofisiconutricional;
create DATABASE dbgestaofisiconutricional;
use dbgestaofisiconutricional;

CREATE TABLE "alimento" (
  "id" int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  "nome" varchar(20) NOT NULL,
  "descricao" varchar(100) NOT NULL,
  "valor_calorico" int(10) NOT NULL,
  "valor_gordura" int(10) NOT NULL,
  "valor_proteina" int(10) NOT NULL,
  "valor_carboidrato" int(10) NOT NULL,
  "ativo" tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE "cardapio" (
  "id" int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  "data_inicio" date NOT NULL,
  "data_fim" date NOT NULL,
  CONSTRAINT "fk_usuario_cardapio" FOREIGN KEY ("usuario_consumidor_id") REFERENCES "usuario" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE "alimento_cardapio" (
  "id" int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  "alimento_id" int(11) NOT NULL,
  "cardapio_id" int(11) NOT NULL,
  "quantidade" decimal(10, 2) NOT NULL,
  CONSTRAINT "fk_alimento" FOREIGN KEY(alimento_id) REFERENCES alimento(id),
  CONSTRAINT "fk_cardapio" FOREIGN KEY(cardapio_id) REFERENCES cardapio(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE "atividade_fisica" (
  "id" int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  "nome" varchar(40) NOT NULL,
  "descricao" varchar(100) NOT NULL,
  "gasto_calorico" int(10) NOT NULL,
  "ativo" tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS "ficha_atividade" (
  "id" INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  "data_inicio" DATE NOT NULL,
  "data_fim" DATE NOT NULL,
  "usuario_praticante_id" INT NOT NULL,
  CONSTRAINT "fk_ficha_atividade_usuario" FOREIGN KEY ("usuario_praticante_id") REFERENCES "usuario" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS "atividade_fisica_ficha" (
  "id" INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  "atividade_fisica_id" INT NOT NULL,
  "ficha_atividade_id" INT NOT NULL,
  "serie" INT NULL,
  "repeticao" INT NULL,
  "tempo_descanso_segundos" INT NULL,
  CONSTRAINT "fk_atividade_fisica_ficha_atividade_atividade_fisica" FOREIGN KEY ("atividade_fisica_id") REFERENCES "atividade_fisica" ("id"),
  CONSTRAINT "fk_atividade_fisica_ficha_atividade_ficha_atividade" FOREIGN KEY ("ficha_atividade_id") REFERENCES "ficha_atividade" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;