//Funções que carregam os dados da tabela para o formulário
function carregaDadosDaTabelaParaFormAlimento(td){
    //muda value do botão
    document.getElementById("btnAlimento").value = "Alterar";
    //muda o action do formulário para alterar_alimento
    document.getElementById("formAlimento").action = "/alterar_alimento";
    //armazena linhas da tabela em uma variável
    const selecaodaLinha = td.parentElement.parentElement;
    // Torna o campo código visível
    document.getElementById("label").hidden = false;  
    document.getElementById("codigo").hidden = false;
      
    //Carrega o conteudo da linha  da tabela para o formulário.
    document.getElementById("codigo").value = selecaodaLinha.cells[0].innerHTML;
    document.getElementById("nome").value = selecaodaLinha.cells[1].innerHTML;
    document.getElementById("descricao").value = selecaodaLinha.cells[2].innerHTML;
    document.getElementById("valor_calorico").value = selecaodaLinha.cells[3].innerHTML;
    document.getElementById("valor_gordura").value = selecaodaLinha.cells[4].innerHTML;
    document.getElementById("valor_proteina").value = selecaodaLinha.cells[5].innerHTML;
    document.getElementById("valor_carboidrato").value = selecaodaLinha.cells[6].innerHTML;
    document.getElementById("ativo").setAttribute('checked', 'true');
}
function carregaDadosDaTabelaParaFormCardapio(td){
    document.getElementById("formCardapio").action = "/alterar_cardapio";
    const selecaodaLinha = td.parentElement.parentElement;
    document.getElementById("codigo").value = selecaodaLinha.cells[0].innerHTML;
    document.getElementById("data_inicio").value = selecaodaLinha.cells[1].innerHTML;
    document.getElementById("data_fim").value = selecaodaLinha.cells[2].innerHTML;
}
function carregaDadosDaTabelaParaFormAtividadeFisica(td){
    document.getElementById("formAtividadeFisica").action = "/alterar_atividade_fisica";
    const selecaodaLinha = td.parentElement.parentElement;
    document.getElementById("codigo").value = selecaodaLinha.cells[0].innerHTML;
    document.getElementById("nome").value = selecaodaLinha.cells[1].innerHTML;
    document.getElementById("descricao").value = selecaodaLinha.cells[2].innerHTML;
    document.getElementById("gasto_calorico").value = selecaodaLinha.cells[3].innerHTML;
    document.getElementById("ativo").value = selecaodaLinha.cells[4].innerHTML;
}


