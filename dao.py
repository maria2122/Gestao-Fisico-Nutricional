
from main import atividade

SQL_CRIA_ATIVIDADEFISICA = 'INSERT into atividade (nome, descricao, gasto_calorico, tipo, ativo) values (%s,%s,%d,%)'
SQL_BUSCA_ATIVIDADEFISICA = 'SELECT id, nome, descricao, gasto_calorico, tipo, ativo from atividade'
SQL_ATUALIZA_ATIVIDADEFISICA = 'UPDATE atividade SET nome=%s, descricao=%s, gasto_calorico=%d, tipo=, ativo=, where id=%s'
SQL_DELETA_ATIVIDADEFISICA = 'delete from atividade where id = %s'


class AtividadeFisicaDao:
    def __init__(self, db):
        self.__db=db

    def salvar(self, atividade):
        cursor = self.__db.connection.cursor()

        if (atividade._id):
            cursor.execute(SQL_ATUALIZA_ATIVIDADEFISICA, (atividade._nome, atividade._descricao, atividade._gasto_calorico, atividade._tipo, atividade._ativo, atividade._id))
        else:
            cursor.execute(SQL_CRIA_ATIVIDADEFISICA, (atividade._nome, atividade._descricao, atividade._gasto_calorico, atividade._tipo, atividade._ativo))
            cursor._id = cursor.lastrowid

        self.__db.connection.commit()
        return atividade

    def listar(self):
        cursor = self._db.connection.cursor()
        cursor.execute(SQL_BUSCA_ATIVIDADEFISICA)
        atividade = traduz_atividade(cursor.fetchall())
        return atividade

def traduz_atividade(atividade):
    def cria_atividade_com_tupla(tupla)
        return AtividadeFisica(tupla[1], tupla[2], tupla[3], tupla[4], tupla[5], id=tupla[0])
    return list(map(cria_atividade_com_tupla, atividade))



create table AtividadeFisica (
  id int not null auto_increment primary key,
  nome string(30) not null,
  descricao string(50),
  gasto_calorico int(30),
  tipo type(),
  ativo bool()
);