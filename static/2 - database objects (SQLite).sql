CREATE TABLE "alimento" (
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

CREATE TABLE "cardapio" (
  "id" INTEGER,
  "data_inicio" TEXT NOT NULL,
  "data_fim" TEXT NOT NULL,
  PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "alimento_cardapio" (
  "id" INTEGER,
  "alimento_id" INTEGER NOT NULL,
  "cardapio_id" INTEGER NOT NULL,
  "quantidade" REAL NOT NULL,
  FOREIGN KEY(alimento_id) REFERENCES alimento(id),
  FOREIGN KEY(cardapio_id) REFERENCES cardapio(id),
  PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "atividade_fisica" (
  "id" INTEGER,
  "nome" TEXT NOT NULL,
  "descricao" TEXT NOT NULL,
  "gasto_calorico" INTEGER NOT NULL,
  "ativo" INTEGER NOT NULL,
  PRIMARY KEY("id" AUTOINCREMENT)
);