from models import Alimento
class AlimentoDao:
    def __init__(self, db):
        self.__db = db
