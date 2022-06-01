//Editar elementos da tabela
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
function editarCardapio(){

}
function editarAtividadeFisica(){

}
