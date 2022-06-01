function editarAlimentoTabela() {
    var id = this.parentNode.parentNode.id;
    var nome = document.getElementById(id).getElementsByTagName('td')[0].innerHTML;
    var calorias = document.getElementById(id).getElementsByTagName('td')[1].innerHTML;
    var proteina = document.getElementById(id).getElementsByTagName('td')[2].innerHTML;
    var carboidrato = document.getElementById(id).getElementsByTagName('td')[3].innerHTML;
    var gordura = document.getElementById(id).getElementsByTagName('td')[4].innerHTML;
    
    var form = document.getElementById('form-editar-alimento');
    form.nome.value = nome;
    form.calorias.value = calorias;
    form.proteina.value = proteina;
    form.carboidrato.value = carboidrato;
    form.gordura.value = gordura;
    
    form.id.value = id;
    
    document.getElementById('form').style.display = 'block';
}

function preencheForm() {
    var form = document.getElementById('form-editar-alimento');
    form.nome.value = this.parentNode.parentNode.getElementsByTagName('td')[0].innerHTML;
    form.calorias.value = this.parentNode.parentNode.getElementsByTagName('td')[1].innerHTML;
    form.proteina.value = this.parentNode.parentNode.getElementsByTagName('td')[2].innerHTML;
    form.carboidrato.value = this.parentNode.parentNode.getElementsByTagName('td')[3].innerHTML;
    form.gordura.value = this.parentNode.parentNode.getElementsByTagName('td')[4].innerHTML;
    
    form.id.value = this.parentNode.parentNode.id;
}