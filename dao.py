from models import Alimento
class AlimentoDao:
    def __init__(self, db):
        self.__db = db
    def salvar(self, alimento:Alimento):
        cursor = self.__db.cursor()
        #nome, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo,  codigo= None
        if(alimento.codigo):
            dados_alimento_atualizacao = [alimento.nome,alimento.descricao, alimento.valor_calorico, alimento.valor_gordura,
                                         alimento.valor_proteina, alimento.valor_carboidrato, alimento.ativo,alimento.codigo]
            SQL_ALTERA_ALIMENTO = "UPDATE alimento SET nome = ?,descricao = ?, valor_calorico = ?,valor_gordura = ?," \
            "valor_proteina = ?,valor_carboidrato = ?,ativo =?" \
            "WHERE id = ?"
            cursor.execute(SQL_ALTERA_ALIMENTO,dados_alimento_atualizacao)
       
              