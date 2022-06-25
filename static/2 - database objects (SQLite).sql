DROP TABLE IF EXISTS alimento;
DROP TABLE IF EXISTS cardapio;
DROP TABLE IF EXISTS alimento_cardapio;
DROP TABLE IF EXISTS atividade_fisica;
DROP TABLE IF EXISTS ficha_atividade;
DROP TABLE IF EXISTS atividade_fisica_ficha;

CREATE TABLE IF NOT EXISTS "alimento" (
  "id" INTEGER,
  "nome" TEXT NOT NULL,
  "descricao" TEXT NOT NULL,
  "valor_calorico" INTEGER NOT NULL,
  "valor_gordura" INTEGER NOT NULL,
  "valor_proteina" INTEGER NOT NULL,
  "valor_carboidrato" INTEGER NOT NULL,
  "ativo" INTEGER NOT NULL,
  PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "usuario" (
  "id" INTEGER NOT NULL,
  "nome" TEXT NULL,
  "login" TEXT NULL,
  "senha" TEXT NULL,
  "cliente" INTEGER NULL,
  "profissional_ed_fisica" INTEGER NULL,
  "nutricionista" INTEGER NULL,
  "administrador" INTEGER NULL,
  PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "cardapio" (
  "id" INTEGER,
  "data_inicio" TEXT NOT NULL,
  "data_fim" TEXT NOT NULL,
  "usuario_consumidor_id" INTEGER NULL,
  PRIMARY KEY("id" AUTOINCREMENT),
  FOREIGN KEY ("usuario_consumidor_id") REFERENCES "usuario" ("id")
);

CREATE TABLE IF NOT EXISTS "alimento_cardapio" (
  "id" INTEGER,
  "alimento_id" INTEGER NOT NULL,
  "cardapio_id" INTEGER NOT NULL,
  "quantidade" REAL NOT NULL,
  PRIMARY KEY("id" AUTOINCREMENT),
  FOREIGN KEY(alimento_id) REFERENCES alimento(id),
  FOREIGN KEY(cardapio_id) REFERENCES cardapio(id)
);

CREATE TABLE IF NOT EXISTS "atividade_fisica" (
  "id" INTEGER,
  "nome" TEXT NOT NULL,
  "descricao" TEXT NOT NULL,
  "gasto_calorico" INTEGER NOT NULL,
  "ativo" INTEGER NOT NULL,
  PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "ficha_atividade" (
  "id" INTEGER NOT NULL,
  "data_inicio" DATE NOT NULL,
  "data_fim" DATE NOT NULL,
  "usuario_praticante_id" INTEGER NOT NULL,
  PRIMARY KEY("id" AUTOINCREMENT),
  FOREIGN KEY ("usuario_praticante_id") REFERENCES "usuario" ("id")
);

CREATE TABLE IF NOT EXISTS "atividade_fisica_ficha" (
  "id" INTEGER NOT NULL,
  "atividade_fisica_id" INTEGER NOT NULL,
  "ficha_atividade_id" INTEGER NOT NULL,
  "serie" INTEGER NULL,
  "repeticao" INTEGER NULL,
  "tempo_descanso_segundos" INTEGER NULL,
  PRIMARY KEY("id" AUTOINCREMENT),
  FOREIGN KEY ("atividade_fisica_id") REFERENCES "atividade_fisica" ("id"),
  FOREIGN KEY ("ficha_atividade_id") REFERENCES "ficha_atividade" ("id")
);

