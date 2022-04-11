

from dao import AtividadeFisicaDao
from models import AtividadeFisica

atividadefisica_dao = AtividadeFisicaDao(DB)

@app.route('/atividadefisica')
def atividade():
    lista = atividadefisica_dao.listar()
    if 'usuario_logado' not in session or session['usuario_logado'] == None:
        return redirect('/login?proxima=')
    else:
        return render_template('atividadefisica.html', atividadesfisicas=lista)


@app.route('/criar_atividadefisica', methods = ['POST', ])
def criar_atividadefisica():
    
    nome            = request.form['nome']
    descricao       = request.form['descricao']
    gasto_calorico  = request.form['gasto_calorico']
    tipo            = request.form['tipo']
    ativo           = request.form['ativo']

    novo_atividadefisica = AtividadeFisica(nome=nome, cliente=False, fornecedor=False, funcionario=True, endereco=endereco,
                                   cpf=cpf, cnpj='', login=login, ativo=True, telefone=telefone, celular=celular, 
                                   email=email, datacadastro='', codigo='')

    funcionario_dao.salvar(novo_funcionario)
    lista = funcionario_dao.listar()
    return render_template('funcionario.html', funcionarios=lista)
