from re import A
from dao import AtividadeFisicaDao, AlimentoDao, CardapioDao, FichaAtividadeFisicaDao,UsuarioDao, load_banco_de_dados
from models import AtividadeFisica, Alimento, Cardapio, FichaAtividadeFisica, Usuario
from flask import Flask, render_template, request, session, redirect


app = Flask(__name__)
app.secret_key = "teste"

DB = "dbgestaofisiconutricional.db"
atividadefisica_dao = AtividadeFisicaDao(DB)
alimento_dao = AlimentoDao(DB)
cardapio_dao = CardapioDao(DB)
ficha_atividade_fisica_dao = FichaAtividadeFisicaDao(DB)
usuario_dao = UsuarioDao(DB)
load_banco_de_dados(DB, "CriaBD")
load_banco_de_dados(DB, "InsereDados")

user =None
@app.route("/")
def index():
    return render_template("index.html")

@app.route("/ADM")
def ADM():
    return render_template("ADM.html")
    
@app.route("/login")
def login():
    return render_template("login.html")

@app.route("/Cadastro_user")
def Cadastro_user():
    lista = usuario_dao.listar()
    return render_template("Cadastro_user.html", usuarios=lista)

@app.route("/atividadefisica")
def atividadefisica():
    lista = atividadefisica_dao.listar()
    # if "usuario_logado" not in session or session["usuario_logado"] == None:
    #     return redirect("/login?proxima=")
    # else:
    return render_template("AtividadeFisica.html", atividadesfisicas=lista)

@app.route("/criar_atividadefisica", methods = ["POST", ])
def criar_atividadefisica():
    nome            = request.form["nome"]
    descricao       = request.form["descricao"]
    gasto_calorico  = request.form["gasto_calorico"]
    ativo           = request.form["ativo"]
    if request.form.get("ativo") == None:
        ativo = False
    else:
        ativo = True
    novo_atividadefisica = AtividadeFisica(nome=nome, descricao=descricao, gasto_calorico=gasto_calorico, ativo=ativo)
    atividadefisica_dao.salvar(novo_atividadefisica)
    lista = atividadefisica_dao.listar()
    return render_template("AtividadeFisica.html", atividadesfisicas=lista)

@app.route("/alterar_atividadefisica", methods=["POST", ])
def alterar_atividadefisica():
    codigo          = request.form["codigo"]
    nome            = request.form["nome"]
    descricao       = request.form["descricao"]
    gasto_calorico  = request.form["gasto_calorico"]
    if request.form.get("ativo") == None:
        ativo = False
    else:
        ativo = True

    atividadefisica_editada = AtividadeFisica(nome=nome, descricao=descricao,
                                              gasto_calorico=gasto_calorico, ativo=ativo, codigo=codigo)

    atividadefisica_dao.salvar(atividadefisica_editada)
    lista = atividadefisica_dao.listar()

    return render_template("AtividadeFisica.html", atividadesfisicas=lista)

@app.route("/alimento")
def alimento():
    lista = alimento_dao.listar()
    return render_template("Alimento.html", alimentos=lista)

@app.route("/criar_alimento", methods = ["POST", ])
def criar_alimento():
#nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo,  codigo= None)
    nome = request.form["nome"]
    descricao = request.form["descricao"]
    valor_calorico = request.form["valor_calorico"]
    valor_gordura = request.form["valor_gordura"]
    valor_proteina = request.form["valor_proteina"]
    valor_carboidrato = request.form["valor_carboidrato"]
    if request.form.get("ativo") == None:
        ativo = False
    else:
        ativo = True

    novo_alimento = Alimento(nome, descricao, valor_calorico, valor_gordura, valor_proteina,
    valor_carboidrato, ativo)

    alimento_dao.salvar(novo_alimento)
    lista = alimento_dao.listar()
    return render_template("Alimento.html", alimentos=lista)

@app.route("/alterar_alimento", methods=["POST", ])
def alterar_alimento():
    codigo = request.form["codigo"]
    nome = request.form["nome"]
    descricao = request.form["descricao"]
    valor_calorico = request.form["valor_calorico"]
    valor_gordura = request.form["valor_gordura"]
    valor_proteina = request.form["valor_proteina"]
    valor_carboidrato = request.form["valor_carboidrato"]
    if request.form.get("ativo") == None:
        ativo = False
    else:
        ativo = True

    alimento_editado = Alimento(nome=nome, descricao=descricao, valor_calorico=valor_calorico, valor_gordura=valor_gordura, valor_proteina=valor_proteina,
    valor_carboidrato= valor_carboidrato, ativo=ativo, codigo=codigo)

    alimento_dao.salvar(alimento_editado)
    lista = alimento_dao.listar()

    return render_template("Alimento.html", alimentos=lista)

@app.route("/cardapio")
def cardapio():
    lista = cardapio_dao.listar()
    return render_template("Cardapio.html", cardapios=lista)

@app.route("/cria_cardapio", methods = ["POST", ])
def cria_cardapio():
    data_inicio = request.form["data_inicio"]
    data_fim = request.form["data_fim"]
    novo_cardapio = Cardapio(data_inicio=data_inicio, data_fim=data_fim)

    cardapio_dao.salvar(novo_cardapio)
    lista = cardapio_dao.listar()
    return render_template("Cardapio.html", cardapios=lista)

@app.route("/alterar_cardapio", methods=["POST", ])
def alterar_cardapio():
    codigo = request.form["codigo"]
    data_inicio = request.form["data_inicio"]
    data_fim = request.form["data_fim"]
    cardapio_atualizado = Cardapio(data_inicio=data_inicio, data_fim=data_fim, codigo=codigo)
    cardapio_dao.salvar(cardapio_atualizado)
    lista = cardapio_dao.listar()

    return render_template("Cardapio.html", cardapios=lista)

@app.route("/ficha_atividade_fisica")
def ficha_atividade_fisica():
    lista = ficha_atividade_fisica_dao.listar()
    return render_template("FichaAtividadeFisica.html", ficha_atividade_fisicas=lista)

@app.route("/criar_ficha_atividade_fisica", methods = ["POST", ])
def criar_ficha_atividade_fisica():
    data_inicio = request.form["data_inicio"]
    data_fim = request.form["data_fim"]
    usuario = request.form["usuario"]
    nova_ficha_atividade_fisica = FichaAtividadeFisica(data_inicio=data_inicio, data_fim=data_fim, usuario=usuario)

    ficha_atividade_fisica_dao.salvar(nova_ficha_atividade_fisica)
    lista = ficha_atividade_fisica_dao.listar()
    return render_template("FichaAtividadeFisica.html", ficha_atividade_fisicas=lista)    

@app.route("/alterar_ficha_atividade_fisica", methods=["POST", ])
def alterar_ficha_atividade_fisica():
    codigo = request.form["codigo"]
    data_inicio = request.form["data_inicio"]
    data_fim = request.form["data_fim"]
    usuario = request.form["usuario"]

    ficha_atividade_fisica_atualizada = FichaAtividadeFisica(data_inicio=data_inicio, data_fim=data_fim, usuario=usuario, codigo=codigo)
    ficha_atividade_fisica_dao.salvar(ficha_atividade_fisica_atualizada)
    lista = ficha_atividade_fisica_dao.listar()

    return render_template("FichaAtividadeFisica.html", ficha_atividade_fisicas=lista)

@app.route("/usuario")
def usuario():
    lista = usuario_dao.listar()
    return render_template("Usuario.html",usuarios=lista)

@app.route("/criar_usuario", methods = ["POST", ])
def criar_usuario():
    nome = request.form["nome"]
    login = request.form["login"]
    senha = request.form["senha"]
    if request.form.get("cliente") == None:
        cliente = False
    else:
        cliente = True
    if request.form.get("profissional_ed_fisica") == None:
        profissional_ed_fisica = False
    else:
        profissional_ed_fisica = True
    if request.form.get("nutricionista") == None:
        nutricionista = False
    else:
        nutricionista = True
    if request.form.get("administrador") == None:
        administrador = False
    else:
        administrador = True
    
    novo_usuario = Usuario(nome=nome, login=login, senha=senha,cliente=cliente, profissional_ed_fisica=profissional_ed_fisica, nutricionista=nutricionista, administrador=administrador)

    usuario_dao.salvar(novo_usuario)
    lista = usuario_dao.listar()
    return render_template("Usuario.html", usuarios=lista)

@app.route("/alterar_usuario", methods=["POST", ])
def alterar_usuario():
    codigo = request.form["codigo"]
    nome = request.form["nome"]
    login = request.form["login"]
    senha = request.form["senha"]
    if request.form.get("cliente") == None:
        cliente = False
    else:
        cliente = True
    if request.form.get("profissional_ed_fisica") == None:
        profissional_ed_fisica = False
    else:
        profissional_ed_fisica = True
    if request.form.get("nutricionista") == None:
        nutricionista = False
    else:
        nutricionista = True
    if request.form.get("administrador") == None:
        administrador = False
    else:
        administrador = True
    
    usuario_atualizado = Usuario(nome=nome, login=login, senha=senha,cliente=cliente, profissional_ed_fisica=profissional_ed_fisica, nutricionista=nutricionista, administrador=administrador, codigo=codigo)

    usuario_dao.salvar(usuario_atualizado)
    lista = usuario_dao.listar()

    return render_template("Usuario.html", usuarios=lista) 


if __name__ == "__main__":
    app.run(debug=True)

