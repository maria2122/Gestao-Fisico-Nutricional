from models import AtividadeFisica

SQL_CRIA_ATIVIDADEFISICA = 'INSERT into atividadefisica (nome, descricao, gasto_calorico, ativo) values (%s,%s,%d,%d)'
SQL_BUSCA_ATIVIDADEFISICA = 'SELECT codigo, nome, descricao, gasto_calorico, ativo from atividadefisica'
SQL_ATUALIZA_ATIVIDADEFISICA = 'UPDATE atividadefisica SET nome=%s, descricao=%s, gasto_calorico=%d, ativo=%d, where codigo=%s'
SQL_DELETA_ATIVIDADEFISICA = 'delete from atividadefisica where codigo = %s'

class AtividadeFisicaDao:
    def __init__(self, db):
        self.__db=db

    def salvar(self, atividadefisica):
        cursor = self.__db.connection.cursor()

        if (atividadefisica._id):
            cursor.execute(SQL_ATUALIZA_ATIVIDADEFISICA, (atividadefisica._nome, atividadefisica._descricao, atividadefisica._gasto_calorico, atividadefisica._ativo, atividadefisica._id))
        else:
            cursor.execute(SQL_CRIA_ATIVIDADEFISICA, (atividadefisica._nome, atividadefisica._descricao, atividadefisica._gasto_calorico, atividadefisica._ativo))
            cursor._id = cursor.lastrowid

        self.__db.connection.commit()
        return atividadesfisicas

    def listar(self):
        cursor = self._db.connection.cursor()
        cursor.execute(SQL_BUSCA_ATIVIDADEFISICA)
        atividade = traduz_atividade(cursor.fetchall())
        return atividadesfisicas

def traduz_atividadesfisicas(atividadesfisicas):
    def cria_atividade_com_tupla(tupla)
        return AtividadeFisica(tupla[1], tupla[2], tupla[3], tupla[4], codigo=tupla[0])
    return list(map(cria_atividade_com_tupla, atividadesfisicas))