from crypt import methods
from urllib import request
from dao import AlimentoDao
from models import Alimento

DB = ""


alimento_dao = AlimentoDao(DB)

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
