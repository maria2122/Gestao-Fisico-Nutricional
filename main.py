from dao import AtividadeFisicaDao
from models import AtividadeFisica
from crypt import methods
from urllib import request
from dao import AlimentoDao
from models import Alimento

atividadefisica_dao = AtividadeFisicaDao(DB)
alimento_dao = AlimentoDao(DB)
DB = ""

@app.route('/atividadefisica')
def atividade():
    lista = atividadefisica_dao.listar()
    if 'usuario_logado' not in session or session['usuario_logado'] == None:
        return redirect('/login?proxima=')
    else:
        return render_template('atividadefisica.html', atividadesfisicas=lista)

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
    return render_template('atividadefisica.html', atividadesfisicas=lista)

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

    atividadefisica_editada = AtividadeFisica(codigo=id, nome=nome, descricao=descricao, descricao=descricao, 
                                              gasto_calorico=gasto_calorico, ativo=ativo)

    atividadefisica_dao.salvar(atividadefisica_editada)
    lista = atividadefisica_dao.listar()

    return render_template('atividadefisica.html', atividadesfisicas=lista)


@app.route('/alimento')
def alimento():
    lista = alimento_dao.listar()
    return render_template('alimento.html', alimentos = lista)

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
    return render_template('alimento.html', alimentos = lista)

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

    return render_template('alimento.html', alimentos=lista)

