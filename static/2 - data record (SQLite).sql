--------------------------------------------------------------------------------
-- Alimento --------------------------------------------------------------------
--------------------------------------------------------------------------------
DELETE FROM alimento;
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
-- Usuario ---------------------------------------------------------------------
-- -----------------------------------------------------------------------------
DELETE FROM usuario;
INSERT INTO usuario(id, nome, login, senha, cliente, profissional_ed_fisica, nutricionista, administrador)
VALUES(1,"Marcio Augusto dos Santos","marcio.augusto","123", 1, 1, 1, 1);

INSERT INTO usuario(id, nome, login, senha, cliente, profissional_ed_fisica, nutricionista, administrador)
VALUES(2,"Vanessa Cristina Pallos","vanessa.cristina","123", 0, 0, 1, 0);

INSERT INTO usuario(id, nome, login, senha, cliente, profissional_ed_fisica, nutricionista, administrador)
VALUES(3,"Elizabeth Madeira","elizabeth.madeira","123", 0, 1, 0, 0);

INSERT INTO usuario(id, nome, login, senha, cliente, profissional_ed_fisica, nutricionista, administrador)
VALUES(4,"Antonio Carlos Silva","antonio.carlos","123", 1, 0, 0, 0);

INSERT INTO usuario(id, nome, login, senha, cliente, profissional_ed_fisica, nutricionista, administrador)
VALUES(5,"Marcelo Fassbinder","marcelo.fassbinder","5656", 0, 0, 0, 1);



-- -----------------------------------------------------------------------------
-- Cardapio
-- -----------------------------------------------------------------------------
-- Usuário 4 - Cliente (em todos os cardápios)
DELETE FROM cardapio;
INSERT INTO cardapio(id, data_inicio, data_fim, usuario_consumidor_id) 
VALUES (1, "2022-03-21", "2022-04-21",  4);

INSERT INTO cardapio(id, data_inicio, data_fim, usuario_consumidor_id) 
VALUES (2, "2022-04-21", "2022-05-21",  4);

INSERT INTO cardapio(id, data_inicio, data_fim, usuario_consumidor_id) 
VALUES (3, "2022-05-21", "2022-06-21",  4);

INSERT INTO cardapio(id, data_inicio, data_fim, usuario_consumidor_id) 
VALUES (4, "2022-06-21", "2022-07-21",  4);


-----------------------------------------------------------------------
-- Alimento_Cardapio --------------------------------------------------
-----------------------------------------------------------------------
DELETE FROM alimento_cardapio;
-- Café com açúcar 50ml
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
VALUES (6,6,1,5);

-- -----------------------------------------------------------------------------
-- Alimento_Cardapio -- Cardinalidade N:N(tbls Alimento:Cardapio)
-- -----------------------------------------------------------------------------
-- Café com açúcar 50ml
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (7,1,1,3);
-- Café sem açúcar 40ml
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (8,2,1,5);
-- Refrigerante de cola 350ml
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (9,3,2,5);
-- Cupim 100g
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (10,4,3,5);
-- Filé de frango 100g
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (11,5,3,5);
-- Filé-mignon 100g
INSERT INTO alimento_cardapio(id, alimento_id, cardapio_id, quantidade) 
VALUES (12,6,4,5);

--------------------------------------------------------------------------
-- Atividade_Fisica ------------------------------------------------------
--------------------------------------------------------------------------
DELETE FROM atividade_fisica;
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

-- -----------------------------------------------------------------------------
-- Ficha_Atividade - Usuário 4 Cliente que seguirá o mesmo período do cardápio
-- -----------------------------------------------------------------------------
DELETE FROM ficha_atividade;
INSERT INTO ficha_atividade(id, data_inicio, data_fim, usuario_praticante_id)
VALUES (1, "2022-03-21", "2022-04-21",  4);

INSERT INTO ficha_atividade(id, data_inicio, data_fim, usuario_praticante_id)
VALUES (2, "2022-04-21", "2022-05-21",  4);

INSERT INTO ficha_atividade(id, data_inicio, data_fim, usuario_praticante_id)
VALUES (3, "2022-05-21", "2022-06-21",  4);

INSERT INTO ficha_atividade(id, data_inicio, data_fim, usuario_praticante_id)
VALUES (4, "2022-06-21", "2022-07-21",  4);


-- -----------------------------------------------------------------------------
-- Atividade_Fisica_Ficha -- Cardinalidade N:N(tbls Atividade_Fisica:Ficha)
-- -----------------------------------------------------------------------------
DELETE FROM atividade_fisica_ficha;
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

