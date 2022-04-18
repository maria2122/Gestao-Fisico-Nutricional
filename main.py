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