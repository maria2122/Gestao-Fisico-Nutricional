from ast import Return

class Usuario:
    def __init__(self, nome, login, senha, cliente, profissional_ed_fisica, nutricionista, administrador, codigo=None):
        #Atributos Privados
        self.__codigo = codigo
        self.__nome = nome
        self.__login= login
        self.__senha=senha
        self.__cliente=cliente
        self.__profissional_ed_fisica=profissional_ed_fisica
        self.__nutricionista=nutricionista
        self.__admninstrador=administrador
    
    @property
    def codigo(self):
        return self.__codigo

    # Properts e Setters 
    def nome

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

# O Código é igual ao ID
class AtividadeFisica:
    def __init__(self, nome, descricao, gasto_calorico, ativo, codigo=None):
        self.__codigo = codigo
        self.__nome = nome
        self.__descricao = descricao
        self.__gasto_calorico = gasto_calorico
        self.__ativo = ativo

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
    def ativo(self):
        return self.__ativo
    @ativo.setter
    def ativo(self, ativo):
        self.__ativo = ativo

class Cardapio:
    def __init__(self, data_inicio, data_fim, codigo=None):
        # Atributos Privados
        self.__codigo=codigo
        self.__data_inicio=data_inicio
        self.__data_fim=data_fim

    # O atributo código apenas obtê-lo não alterá-lo
    @property
    def codigo(self):
        return self.__codigo

    # Properts e Setters
    # data_inicio
    @property
    def data_inicio(self):
        return self.__data_inicio
    @data_inicio.setter
    def data_inicio(self, data_inicio):
        self.__data_inicio=data_inicio
    # data_fim
    @property
    def data_fim(self):
        return self.__data_fim
    @data_fim.setter
    def data_fim(self, data_fim):
        self.__data_fim=data_fim
    
class FichaAtividade:
    def __init__(self, data_inicio, data_fim,usuario, codigo=None):
        # Atributos Privados
        self.__codigo=codigo
        self.__data_inicio=data_inicio
        self.__data_fim=data_fim
        self.__usuario=usuario

    # O atributo código apenas obtê-lo não alterá-lo
    @property
    def codigo(self):
        return self.__codigo

    # Properts e Setters
    # data_inicio
    @property
    def data_inicio(self):
        return self.__data_inicio
    @data_inicio.setter
    def data_inicio(self, data_inicio):
        self.__data_inicio=data_inicio
    # data_fim
    @property
    def data_fim(self):
        return self.__data_fim
    @data_fim.setter
    def data_fim(self, data_fim):
        self.__data_fim=data_fim
    # usuario
    @property
    def usuario(self):
        return self.__usuario
    @usuario.setter
    def usuario(self, usuario):
        self.__usuario=usuario