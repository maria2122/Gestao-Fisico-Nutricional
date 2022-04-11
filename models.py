# O Código é igual ao ID
class AtividadeFisica:
    def __init__(self, codigo=None, nome, descricao, gasto_calorico, tipo, ativo):
        self._codigo = codigo
        self._nome = nome
        self._descricao = descricao
        self._gasto_calorico = gasto_calorico
        self._tipo = tipo
        self._ativo = ativo

    @property
    def codigo(self):
        return self.__codigo

    @property
    def nome(self):
        return self.__nome
    @nome.setter
    def nome(self, nome):
        self.__nome = nome

    @property
    def descricao(self):
        return self.__descricao
    @descricao.setter
    def descricao(self, descricao):
        self.__descricao = descricao
    
    @property
    def gasto_calorico(self):
        return self.__gasto_calorico
    @gasto_calorico.setter
    def gasto_calorico(self, gasto_calorico):
        self.__gasto_calorico = gasto_calorico

    @property
    def tipo(self):
        return self.__tipo
    @tipo.setter
    def tipo(self, tipo):
        self.__tipo = tipo

    @property
    def ativo(self):
        return self.__ativo
    @ativo.setter
    def ativo(self, ativo):
        self.__ativo = ativo