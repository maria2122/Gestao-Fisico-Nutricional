from models import Alimento, Cardapio, AtividadeFisica,Usuario,FichaAtividadeFisica
from sqlite3 import connect


MECANISMO_BANCO_NOME = 'SQLITE' # Qual mecanismo de banco de dados será utilizado?
SQL_CRIA_ATIVIDADEFISICA = "INSERT into atividade_fisica (nome, descricao, gasto_calorico, ativo) values (?,?,?,?)"
SQL_BUSCA_ATIVIDADEFISICA = 'SELECT id, nome, descricao, gasto_calorico, ativo from atividade_fisica'
SQL_ATUALIZA_ATIVIDADEFISICA = 'UPDATE atividade_fisica SET nome=?, descricao=?, gasto_calorico=?, ativo=? where id=?'
SQL_DELETA_ATIVIDADEFISICA = 'delete from atividadefisica where codigo = ?'

SQL_DELETA_CARDAPIO='DELETE FROM cardapio WHERE id = ? '

class AtividadeFisicaDao:
    def __init__(self, db):
        self.__db = db

    def salvar(self, atividadefisica:AtividadeFisica):
        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao = connect(self.__db)
            cursor = conexao.cursor()
        else:
            cursor = self.__db.cursor()

        if (atividadefisica.codigo):
            cursor.execute(SQL_ATUALIZA_ATIVIDADEFISICA, (atividadefisica.nome, atividadefisica.descricao, atividadefisica.gasto_calorico, atividadefisica.ativo, atividadefisica.codigo))
        else:
            cursor.execute(SQL_CRIA_ATIVIDADEFISICA, (atividadefisica.nome, atividadefisica.descricao, atividadefisica.gasto_calorico, atividadefisica.ativo))
            #atividadefisica.codigo = cursor.lastrowid

        conexao.commit()
        
        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao.close()
            
        return atividadefisica

    def listar(self):
        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao = connect(self.__db)
            cursor = conexao.cursor()
        else:
            cursor = self.__db.cursor()

        cursor.execute(SQL_BUSCA_ATIVIDADEFISICA)
        atividadesfisicas = traduz_atividadesfisicas(cursor.fetchall())
        return atividadesfisicas

def traduz_atividadesfisicas(atividadesfisicas):
    def cria_atividade_com_tupla(tupla):
        return AtividadeFisica(tupla[1], tupla[2], tupla[3], tupla[4], codigo=tupla[0])
    return list(map(cria_atividade_com_tupla, atividadesfisicas))


class AlimentoDao:
    def __init__(self, db):
        self.__db = db

    def salvar(self, alimento:Alimento):
        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao = connect(self.__db)
            cursor = conexao.cursor()
        else:
            cursor = self.__db.cursor()

        #nome, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo,  codigo= None
        if(alimento.codigo):
            dados_alimento_atualizacao = [alimento.nome, alimento.descricao, alimento.valor_calorico, alimento.valor_gordura,
                                         alimento.valor_proteina, alimento.valor_carboidrato, alimento.ativo,alimento.codigo]
            SQL_ALTERA_ALIMENTO = "UPDATE alimento SET nome = ?,descricao = ?, valor_calorico = ?,valor_gordura = ?," \
            "valor_proteina = ?,valor_carboidrato = ?,ativo =?" \
            "WHERE id = ?"
            cursor.execute(SQL_ALTERA_ALIMENTO,dados_alimento_atualizacao)
        else:
            dados_alimento_insercao = [alimento.nome, alimento.descricao, alimento.valor_calorico, alimento.valor_gordura,
            alimento.valor_proteina, alimento.valor_carboidrato, alimento.ativo]
            SQL_CRIA_ALIMENTO = "INSERT INTO alimento(nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato," \
            " ativo) VALUES (?,?,?,?,?,?,?)"
            cursor.execute(SQL_CRIA_ALIMENTO, dados_alimento_insercao)

        conexao.commit()
        
        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao.close()

        return alimento

    def listar(self):
        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao = connect(self.__db)
            cursor = conexao.cursor()
        else:
            cursor = self.__db.cursor()

        SQL_BUSCA_ALIMENTOS = "SELECT id, nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo " \
        "FROM alimento" 
        cursor.execute(SQL_BUSCA_ALIMENTOS)
        alimentos =   traduz_alimentos(cursor.fetchall())
        
        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao.close()
            
        return alimentos    

def traduz_alimentos(alimentos):
    def cria_alimento_com_tupla(tupla):
        return Alimento(nome=tupla[1],descricao=tupla[2],valor_calorico=tupla[3],
        valor_gordura=tupla[4], valor_proteina=tupla[5], valor_carboidrato=tupla[6],
        ativo=tupla[7],codigo=tupla[0])

    return list(map(cria_alimento_com_tupla, alimentos))


class CardapioDao:
    def __init__(self, db):
        self.__db = db

    def salvar(self, cardapio:Cardapio):
        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao = connect(self.__db)
            cursor = conexao.cursor()
        else:
            cursor = self.__db.cursor()

        if(cardapio.codigo):
            dados_cardapio_atualizacao = [cardapio.data_inicio, cardapio.data_fim, cardapio.codigo]
            SQL_ATUALIZA_CARDAPIO='UPDATE cardapio SET data_inicio = ?, data_fim = ? WHERE id = ? '
            cursor.execute(SQL_ATUALIZA_CARDAPIO, dados_cardapio_atualizacao)
        else:
            dados_cardapio_insercao = [cardapio.data_inicio, cardapio.data_fim]
            SQL_CRIA_CARDAPIO='INSERT INTO cardapio (data_inicio, data_fim) VALUES (?, ?) '
            cursor.execute(SQL_CRIA_CARDAPIO, dados_cardapio_insercao)
            
        conexao.commit()

        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao.close()

        return cardapio
    
    def listar(self):
        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao = connect(self.__db)
            cursor = conexao.cursor()
        else:
            cursor = self.__db.cursor()
        
        SQL_BUSCA_CARDAPIO='SELECT id, data_inicio, data_fim ' \
        'FROM cardapio '
        cursor.execute(SQL_BUSCA_CARDAPIO)
        cardapios = traduz_cardapio(cursor.fetchall())

        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao.close()

        return cardapios
        

def traduz_cardapio(cardapios):
    def cria_cardapio_com_tupla(tupla):
        return Cardapio(data_inicio=tupla[1], data_fim=tupla[2], codigo=tupla[0])
    
    return list(map(cria_cardapio_com_tupla, cardapios))

class UsuarioDao:
    def __init__(self, db):
        self.__db = db
    
    def salvar(self, usuario:Usuario):
        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao = connect(self.__db)
            cursor = conexao.cursor()
        else:
            cursor = self.__db.cursor()
        #nome, login, senha, cliente, profissional_ed_fisica, nutricionista, administrador, codigo=None
        if(usuario.codigo):
            dados_usuario_atualizacao = [usuario.nome, usuario.login, usuario.senha, usuario.cliente, usuario.profissional_ed_fisica, 
                                        usuario.nutricionista, usuario.administrador, usuario.codigo]
            SQL_ATUALIZA_USUARIO='UPDATE usuario SET nome = ?, login = ?, senha = ?, cliente = ?, profissional_ed_fisica = ?, nutricionista = ?, administrador = ? WHERE id = ? '
            cursor.execute(SQL_ATUALIZA_USUARIO, dados_usuario_atualizacao)
        else:
            dados_usuario_insercao = [usuario.nome, usuario.login, usuario.senha, usuario.cliente, usuario.profissional_ed_fisica, 
                                      usuario.nutricionista, usuario.administrador]
            SQL_CRIA_USUARIO='INSERT INTO usuario (nome, login, senha, cliente, profissional_ed_fisica, nutricionista, administrador) VALUES (?, ?, ?, ?, ?, ?, ?) '
            cursor.execute(SQL_CRIA_USUARIO, dados_usuario_insercao)
        
        conexao.commit()

        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao.close()
        
        return usuario
    def listar(self):
        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao = connect(self.__db)
            cursor = conexao.cursor()
        else:
            cursor = self.__db.cursor()
        
        SQL_BUSCA_USUARIO='SELECT id, nome, login, senha, cliente, profissional_ed_fisica, nutricionista, administrador ' \
        'FROM usuario '
        cursor.execute(SQL_BUSCA_USUARIO)
        usuarios = traduz_usuario(cursor.fetchall())

        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao.close()

        return usuarios

def traduz_usuario(usuarios):
    def cria_usuario_com_tupla(tupla):
        return Usuario(nome=tupla[1],login=tupla[2],senha=tupla[3],cliente=tupla[4],
        profissional_ed_fisica=tupla[5],nutricionista=tupla[6],administrador=tupla[7],codigo=tupla[0])  
    return list(map(cria_usuario_com_tupla, usuarios))

class FichaAtividadeFisicaDao:
    def __init__(self, db):
        self.__db = db
    
    def salvar(self, ficha_atividade:FichaAtividadeFisica):
        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao = connect(self.__db)
            cursor = conexao.cursor()
        else:
            cursor = self.__db.cursor()
        #codigo_usuario, data_inicio, data_fim, codigo=None 
        if(ficha_atividade.codigo):
            dados_ficha_atividade_atualizacao = [ficha_atividade.codigo_usuario, ficha_atividade.data_inicio, ficha_atividade.data_fim, ficha_atividade.codigo]
            SQL_ATUALIZA_FICHA_ATIVIDADE='UPDATE ficha_atividade SET codigo_usuario = ?, data_inicio = ?, data_fim = ? WHERE id = ? '
            cursor.execute(SQL_ATUALIZA_FICHA_ATIVIDADE, dados_ficha_atividade_atualizacao)
        else:
            dados_ficha_atividade_insercao = [ficha_atividade.codigo_usuario, ficha_atividade.data_inicio, ficha_atividade.data_fim]
            SQL_CRIA_FICHA_ATIVIDADE='INSERT INTO ficha_atividade (codigo_usuario, data_inicio, data_fim) VALUES (?, ?, ?) '
            cursor.execute(SQL_CRIA_FICHA_ATIVIDADE, dados_ficha_atividade_insercao)
        
        conexao.commit()

        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao.close()
        
        return ficha_atividade

    def listar(self):
        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao = connect(self.__db)
            cursor = conexao.cursor()
        else:
            cursor = self.__db.cursor()
        
        SQL_BUSCA_FICHA_ATIVIDADE='SELECT id, codigo_usuario, data_inicio, data_fim ' \
        'FROM ficha_atividade '
        cursor.execute(SQL_BUSCA_FICHA_ATIVIDADE)
        fichas_atividade = traduz_ficha_atividade(cursor.fetchall())

        if MECANISMO_BANCO_NOME == 'SQLITE':
            conexao.close()

        return fichas_atividade

def traduz_ficha_atividade(fichas_atividade):
    def cria_ficha_atividade_com_tupla(tupla):
        return FichaAtividade(codigo_usuario=tupla[1],data_inicio=tupla[2],data_fim=tupla[3],codigo=tupla[0])  
    return list(map(cria_ficha_atividade_com_tupla, fichas_atividade))
    

# Operacao: InsereDados Ou CriaBD
def load_banco_de_dados(Conexao, Operacao):
    if MECANISMO_BANCO_NOME == 'SQLITE':
        conexao = connect(Conexao)
        cursor = conexao.cursor()
        if Operacao == 'CriaBD':
            arquivo = open('static/2 - database objects (SQLite).sql', 'r+')
        elif Operacao == 'InsereDados':
            arquivo = open('static/2 - data record (SQLite).sql', 'r+')
    else:
        cursor = Conexao.cursor()
        if Operacao == 'CriaBD':
            arquivo = open('static/1 - database objects (MYSQL).sql', 'r+')
        elif Operacao == 'InsereDados':
            arquivo = open('static/1 - data record (MYSQL).sql', 'r+')
        
    todos_comandos = arquivo.read()
    todos_comandos_separados = todos_comandos.split(';')
    for comando in todos_comandos_separados:
        cursor.execute(comando)

    conexao.commit()

    if MECANISMO_BANCO_NOME == 'SQLITE':
        conexao.close()