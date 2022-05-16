from models import Alimento
from models import AtividadeFisica

SQL_CRIA_ATIVIDADEFISICA = 'INSERT into atividadefisica (nome, descricao, gasto_calorico, ativo) values (%s,%s,%d,%d)'
SQL_BUSCA_ATIVIDADEFISICA = 'SELECT id, nome, descricao, gasto_calorico, ativo from atividade_fisica'
SQL_ATUALIZA_ATIVIDADEFISICA = 'UPDATE atividadefisica SET nome=%s, descricao=%s, gasto_calorico=%d, ativo=%d, where codigo=%s'
SQL_DELETA_ATIVIDADEFISICA = 'delete from atividadefisica where codigo = %s'

class AtividadeFisicaDao:
    def __init__(self, db):
        self.__db=db

    def salvar(self, atividadefisica:AtividadeFisica):
        cursor = self.__db.cursor()

        if (atividadefisica._id):
            cursor.execute(SQL_ATUALIZA_ATIVIDADEFISICA, (atividadefisica.nome, atividadefisica.descricao, atividadefisica.gasto_calorico, atividadefisica.ativo, atividadefisica.codigo))
        else:
            cursor.execute(SQL_CRIA_ATIVIDADEFISICA, (atividadefisica.nome, atividadefisica.descricao, atividadefisica.gasto_calorico, atividadefisica.ativo))
            cursor._id = cursor.lastrowid

        self.__db.commit()
        return atividadefisica

    def listar(self):
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
        self.__db.commit()
        return alimento

    def listar(self):
        cursor = self.__db.cursor()
        SQL_BUSCA_ALIMENTOS = "SELECT id, nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo" \
        "FROM alimento" 
        cursor.execute(SQL_BUSCA_ALIMENTOS)
        alimentos =   traduz_alimentos(cursor.fetchall())
        return alimentos    

def traduz_alimentos(alimentos):
    def cria_alimento_com_tupla(tupla):
        return Alimento(nome=tupla[1],descricao=tupla[2],valor_calorico=tupla[3],
        valor_gordura=tupla[4], valor_proteina=tupla[5], valor_carboidrato=tupla[6],
        ativo=tupla[7],codigo=tupla[0])

    return list(map(cria_alimento_com_tupla, alimentos))

