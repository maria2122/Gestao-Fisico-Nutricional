from dao import AtividadeFisicaDao, AlimentoDao, CardapioDao, load_banco_de_dados
from models import AtividadeFisica, Alimento, Cardapio
from flask import Flask, render_template, request, session, redirect


app = Flask(__name__)
app.secret_key = 'teste'

DB = "dbgestaofisiconutricional.db"
atividadefisica_dao = AtividadeFisicaDao(DB)
alimento_dao = AlimentoDao(DB)
cardapio_dao = CardapioDao(DB)

load_banco_de_dados(DB, 'CriaBD')
load_banco_de_dados(DB, 'InsereDados')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login')
def login():
    return render_template('login.html')
    
@app.route('/atividadefisica')
def atividadefisica():
    lista = atividadefisica_dao.listar()
    # if 'usuario_logado' not in session or session['usuario_logado'] == None:
    #     return redirect('/login?proxima=')
    # else:
    return render_template('AtividadeFisica.html', atividadesfisicas=lista)

@app.route('/criar_atividadefisica', methods = ['POST', ])
def criar_atividadefisica():
    
    codigo          = request.form['codigo']
    nome            = request.form['nome']
    descricao       = request.form['descricao']
    gasto_calorico  = request.form['gasto_calorico']
    ativo           = request.form['ativo']

    novo_atividadefisica = AtividadeFisica(codigo='', nome=nome, descricao=descricao, gasto_calorico=gasto_calorico, ativo=ativo)

    atividadefisica_dao.salvar(novo_atividadefisica)
    lista = atividadefisica_dao.listar()
    return render_template('AtividadeFisica.html', atividadesfisicas=lista)

app.route('/alterar_atividadefisica', methods=['POST', ])
def alterar_atividadefisica():
    codigo          = request.form['codigo-alteracao']
    nome            = request.form['nome-alteracao']
    descricao       = request.form['descricao-alteracao']
    gasto_calorico  = request.form['gasto_calorico-alteracao']
    ativo           = request.form['ativo-alteracao']
    if request.form.get('atividadefisica-alteracao') == None:
        atividadefisica = False
    else:
        atividadefisica = True

    atividadefisica_editada = AtividadeFisica(codigo=id, nome=nome, descricao=descricao,
                                              gasto_calorico=gasto_calorico, ativo=ativo)

    atividadefisica_dao.salvar(atividadefisica_editada)
    lista = atividadefisica_dao.listar()

    return render_template('AtividadeFisica.html', atividadesfisicas=lista)


@app.route('/alimento')
def alimento():
    lista = alimento_dao.listar()
    return render_template('alimento.html')

@app.route('/cria_alimento', methods = ['POST', ])
def cria_alimento():
#nome, descricao, valor_calorico, valor_gordura, valor_proteina, valor_carboidrato, ativo,  codigo= None)
    nome = request.form['nome']
    descricao = request.form['descricao']
    valor_calorico = request.form['valor_calorico']
    valor_gordura = request.form['valor_gordura']
    valor_proteina = request.form['valor_proteina']
    valor_carboidrato = request.form['valor_carboidrato']
    ativo = request.form['ativo']
    novo_alimento = Alimento(nome, descricao, valor_calorico, valor_gordura, valor_proteina,
    valor_carboidrato, ativo)

    alimento_dao.salvar(novo_alimento)
    lista = alimento_dao.listar()
    return render_template('alimento.html')

@app.route('/alterar_alimento', methods=['POST', ])
def alterar_alimento():
    id = request.form['id-alteracao']
    nome = request.form['nome-alteracao']
    descricao = request.form['descricao-alteracao']
    valor_calorico = request.form['valor_calorico-alteracao']
    valor_gordura = request.form['valor_gordura-alteracao']
    valor_proteina = request.form['valor_proteina-alteracao']
    valor_carboidrato = request.form['valor_carboidrato-alteracao']
    ativo = request.form['ativo-alteracao']
    alimento_editado = Alimento(nome=nome, descricao=descricao, valor_calorico=valor_calorico, valor_gordura=valor_gordura, valor_proteina=valor_proteina,
    valor_carboidrato= valor_carboidrato, ativo=ativo, codigo=id)

    alimento_dao.salvar(alimento_editado)
    lista = alimento_dao.listar()

    return render_template('alimento.html')

@app.route('/cardapio')
def cardapio():
    lista = cardapio_dao.listar()
    return render_template('Cardapio.html', cardapios=lista)

@app.route('/cria_cardapio', methods = ['POST', ])
def cria_cardapio():
    data_inicio = request.form['data_inicio']
    data_fim = request.form['data_fim']
    novo_cardapio = Cardapio(data_inicio=data_inicio, data_fim=data_fim)

    cardapio_dao.salvar(novo_cardapio)
    lista = cardapio_dao.listar()
    return render_template('Cardapio.html', cardapios=lista)

@app.route('/alterar_cardapio', methods=['POST', ])
def alterar_cardapio():
    id = request.form['id-alteracao']
    data_inicio = request.form['data_inicio']
    data_fim = request.form['data_fim']
    cardapio_atualizado = Cardapio(data_inicio=data_inicio, data_fim=data_fim, codigo=id)
    cardapio_dao.salvar(cardapio_atualizado)
    lista = cardapio_dao.listar()

    return render_template('Cardapio.html', cardapios=lista)

if __name__ == '__main__':
    app.run(debug=True)

