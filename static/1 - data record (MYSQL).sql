--------------------------------------------------------------------------------
-- Alimento --------------------------------------------------------------------
--------------------------------------------------------------------------------
INSERT INTO alimento(id, nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo) 
VALUES (1,'Café com açúcar 50ml','Café com açúcar 50ml',33,0,0,0,1);

INSERT INTO alimento(id, nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo) 
VALUES (2, 'Café sem açúcar 40ml','Café sem açúcar 40ml',3,0,0,0,1);

INSERT INTO alimento(id, nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo) 
VALUES (3, 'Refrigerante de cola 350ml','Refrigerante de cola 350ml',137,0,0,0,1);

INSERT INTO alimento(id, nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo) 
VALUES (4, 'Cupim 100g','Cupim 100g',375,0,0,0,1);

INSERT INTO alimento(id, nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo) 
VALUES (5, 'Filé de frango 100g','Filé de frango 100g',101,0,0,0,1);

INSERT INTO alimento(id, nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo) 
VALUES (6, 'Filé-mignon 100g','Filé-mignon 100g',140,0,0,0,1);

--------------------------------------------------------------------------------
-- Cardapio --------------------------------------------------------------------
--------------------------------------------------------------------------------
INSERT INTO cardapio(id, data_inicio, data_fim) 
VALUES (1,'2022-03-21','2022-04-30');

-----------------------------------------------------------------------
-- Alimento_Cardapio --------------------------------------------------
-----------------------------------------------------------------------
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

--------------------------------------------------------------------------
-- Atividade_Fisica ------------------------------------------------------
--------------------------------------------------------------------------
INSERT INTO atividade_fisica(id, nome, descricao, gasto_calorico, ativo) 
VALUES (1,'Caminhada devagar 1Hr','Caminhada devagar por uma hora', 240, 1);

INSERT INTO atividade_fisica(id, nome, descricao, gasto_calorico, ativo) 
VALUES (2,'Caminhada rápida 1Hr','Caminhada rápida por uma hora', 520, 1);

INSERT INTO atividade_fisica(id, nome, descricao, gasto_calorico, ativo) 
VALUES (3,'Jogar futebol 1Hr','Jogar futebol por uma hora', 580, 1);

INSERT INTO atividade_fisica(id, nome, descricao, gasto_calorico, ativo) 
VALUES (4,'Subir escada 1Hr','Subir escada por uma hora', 1000, 1);

INSERT INTO atividade_fisica(id, nome, descricao, gasto_calorico, ativo) 
VALUES (5,'Dormir 1Hr','Dormir por uma hora', 60, 1);

INSERT INTO atividade_fisica(id, nome, descricao, gasto_calorico, ativo) 
VALUES (6,'Limpeza 1Hr','Limpeza de casa por uma hora', 60, 1);