class Alimento:
    def __init__(self, nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo,  codigo= None):
        #Atributos Privados
        self.__codigo = codigo
        self.__nome = nome
        self.__descricao = descricao
        self.__valor_calorico = valor_calorico
        self.__valor_gordura = valor_gordura 
        self.__valor_proteina = valor_proteina
        self.__valor_carboidrato = valor_carboidrato
        self.__ativo = ativo
    
    #O atributo código apenas obtê-lo não alterá-lo.
    @property
    def codigo(self):
        return self.__codigo

    #Properts e Setters
    #NOME
    @property
    def nome(self):
        return self.__nome
    @nome.setter
    def nome(self, nome):
        self.__nome = nome
    #DESCRIÇÃO
    @property
    def descricao(self):
        return self.__descricao
    @descricao.setter
    def nome(self, descricao):
        self.__descricao = descricao
    #VALOR_CALORICO
    @property
    def valor_calorico(self):
        return self.__valor_calorico
    @valor_calorico.setter
    def valor_calorico(self, valor_calorico):
        self.__valor_calorico = valor_calorico
    #VALOR_GORDURA
    @property
    def valor_gordura(self):
        return self.__valor_gordura
    @valor_gordura.setter
    def valor_gordura(self, valor_gordura):
        self.__valor_gordura = valor_gordura
    #VALOR_PROTEINA
    @property
    def valor_proteina(self):
        return self.__valor_proteina
    @valor_proteina.setter
    def valor_proteina(self, valor_proteina):
        self.__valor_proteina = valor_proteina
    #VALOR_CARBOIDRATO
    @property
    def valor_carboidrato(self):
        return self.__valor_carboidrato
    @valor_carboidrato.setter
    def valor_carboidrato(self, valor_carboidrato):
        self.__valor_carboidrato = valor_carboidrato
    #ATIVO
    @property
    def ativo(self):
        return self.__ativo
    @ativo.setter
    def ativo(self, ativo):
        self.__ativo = ativo

    


