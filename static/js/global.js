//Funções que carregam os dados da tabela para o formulário
function carregaDadosDaTabelaParaFormAlimento(td){
    selecaodaLinha = td.parentElement.parentElement;
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
    selecaodaLinha = td.parentElement.parentElement;
    document.getElementById("codigo").value = selecaodaLinha.cells[0].innerHTML;
    document.getElementById("data_inicio").value = selecaodaLinha.cells[1].innerHTML;
    document.getElementById("data_fim").value = selecaodaLinha.cells[2].innerHTML;
}
function carregaDadosDaTabelaParaFormAtividadeFisica(td){
    selecaodaLinha = td.parentElement.parentElement;
    document.getElementById("codigo").value = selecaodaLinha.cells[0].innerHTML;
    document.getElementById("nome").value = selecaodaLinha.cells[1].innerHTML;
    document.getElementById("descricao").value = selecaodaLinha.cells[2].innerHTML;
    document.getElementById("gasto_calorico").value = selecaodaLinha.cells[3].innerHTML;
    document.getElementById("ativo").value = selecaodaLinha.cells[4].innerHTML;
}