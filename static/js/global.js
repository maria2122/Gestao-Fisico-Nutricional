//Funções que carregam os dados da tabela para o formulário

function carregaDadosDaTabelaParaFormAlimento(td){
    //muda value do botão
    document.getElementById("btnAlimento").value = "Alterar";
    //muda o action do formulário para alterar_alimento
    document.getElementById("formAlimento").action = "/alterar_alimento";
    // Torna o campo label input do código visível
    document.getElementById("label").hidden = false;  
    document.getElementById("codigo").hidden = false;
    
    //armazena linhas da tabela em uma variável
    const selecaodaLinha = td.parentElement.parentElement;
      
    //Carrega o conteudo da linha  da tabela para o formulário.
    document.getElementById("codigo").value = selecaodaLinha.cells[0].innerHTML;
    document.getElementById("nome").value = selecaodaLinha.cells[1].innerHTML;
    document.getElementById("descricao").value = selecaodaLinha.cells[2].innerHTML;
    document.getElementById("valor_calorico").value = selecaodaLinha.cells[3].innerHTML;
    document.getElementById("valor_gordura").value = selecaodaLinha.cells[4].innerHTML;
    document.getElementById("valor_proteina").value = selecaodaLinha.cells[5].innerHTML;
    document.getElementById("valor_carboidrato").value = selecaodaLinha.cells[6].innerHTML;
    document.getElementById("ativo").value = selecaodaLinha.cells[7].innerHTML;
    
    
}
function carregaDadosDaTabelaParaFormCardapio(td){
    //muda value do botão
    document.getElementById("btnCardapio").value = "Alterar";
    //muda o action do formulário para alterar_cardapio
    document.getElementById("formCardapio").action = "/alterar_cardapio";
    // Torna o campo label input do código visível
    document.getElementById("label").hidden = false;
    document.getElementById("codigo").hidden = false;

    //armazena linhas da tabela em uma variável
    const selecaodaLinha = td.parentElement.parentElement;

    document.getElementById("codigo").value = selecaodaLinha.cells[0].innerHTML;
    document.getElementById("data_inicio").value = selecaodaLinha.cells[1].innerHTML;
    document.getElementById("data_fim").value = selecaodaLinha.cells[2].innerHTML;
}
function carregaDadosDaTabelaParaFormAtividadeFisica(td){
    //muda value do botão
    document.getElementById("btnAtividadeFisica").value = "Alterar";
    //muda action do formulário para alterar_atividade_fisica
    document.getElementById("formAtividadeFisica").action = "/alterar_atividadefisica";
    // Torna o campo label input do código visível
    document.getElementById("label").hidden = false;
    document.getElementById("codigo").hidden = false;

    //armazena linhas da tabela em uma variável
    const selecaodaLinha = td.parentElement.parentElement;

    ////Carrega o conteudo da linha  da tabela para o formulário.
    document.getElementById("codigo").value = selecaodaLinha.cells[0].innerHTML;
    document.getElementById("nome").value = selecaodaLinha.cells[1].innerHTML;
    document.getElementById("descricao").value = selecaodaLinha.cells[2].innerHTML;
    document.getElementById("gasto_calorico").value = selecaodaLinha.cells[3].innerHTML;
    document.getElementById("ativo").setAttribute("checked","true");
    document.getElementById("ativo").value = selecaodaLinha.cells[4].innerHTML;
}
function carregaDadosDaTabelaParaFormUsuario(td){
    //muda value do botão
    document.getElementById("btnUsuario").value = "Alterar";
    //muda action do formulário para alterar_usuario
    document.getElementById("formUsuario").action = "/alterar_usuario";
    // Torna o campo label input do código visível
    document.getElementById("label").hidden = false;
    document.getElementById("codigo").hidden = false;
    //Torna campo e label senha invisível
    document.getElementById("labelSenha").hidden = true;
    document.getElementById("senha").hidden = true;
    //armazena linhas da tabela em uma variável
    const selecaodaLinha = td.parentElement.parentElement;

    ////Carrega o conteudo da linha  da tabela para o formulário.
    document.getElementById("codigo").value = selecaodaLinha.cells[0].innerHTML;
    document.getElementById("nome").value = selecaodaLinha.cells[1].innerHTML;
    document.getElementById("login").value = selecaodaLinha.cells[2].innerHTML;
    document.getElementById("cliente").setAttribute("checked","true");
    document.getElementById("cliente").value = selecaodaLinha.cells[4].innerHTML;
    document.getElementById("profissional_ed_fisica").setAttribute("checked","true");
    document.getElementById("profissional_ed_fisica").value = selecaodaLinha.cells[5].innerHTML;
    document.getElementById("nutricionista").setAttribute("checked","true");
    document.getElementById("nutricionista").value = selecaodaLinha.cells[6].innerHTML;
    document.getElementById("administrador").setAttribute("checked","true");
    document.getElementById("administrador").value = selecaodaLinha.cells[7].innerHTML;
}

function carregaDadosDaTabelaParaFormFichaAtividadeFisica(td){
    //muda value do botão
    document.getElementById("btnFichaAtividadeFisica").value = "Alterar";
    //muda action do formulário para alterar_ficha_atividade_fisica
    document.getElementById("formFichaAtividadeFisica").action = "/alterar_ficha_atividade_fisica";
    // Torna o campo label input do código visível
    document.getElementById("label").hidden = false;
    document.getElementById("codigo").hidden = false;

    //armazena linhas da tabela em uma variável
    const selecaodaLinha = td.parentElement.parentElement;

    ////Carrega o conteudo da linha  da tabela para o formulário.
    document.getElementById("codigo").value = selecaodaLinha.cells[0].innerHTML;
    document.getElementById("data_inicio").value = selecaodaLinha.cells[1].innerHTML;
    document.getElementById("data_fim").value = selecaodaLinha.cells[2].innerHTML;
    document.getElementById("usuario").value = selecaodaLinha.cells[3].innerHTML;
    
}

