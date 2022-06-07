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
    document.getElementById("ativo").setAttribute('checked', 'true');
    document.getElementById("ativo").value=selecaodaLinha.cells[7].innerHTML;
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


