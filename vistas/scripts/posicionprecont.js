var tabla;

init();

function init(){
      listar();
      listacomboingreso();
}

function listar(){
    tabla=$('#tbllistaposicionc').dataTable().DataTable();
}
function mostrarmodal(){
    var idposcontenedor=$('#idposcont').val();
    
    if (idposcontenedor==""){
        $("#titulo").html("Asignar Contenedor en Patio");
    }else {
        $("#titulo").html("Modificacion de Contenedor en Patio");
    }
    $("#getmodalcpos").modal('toggle');
}
function listacomboingreso(){
    $.post("../ajax/posicionprecon.php?op=listaringreso",function(r){
         $("#contenedor").html(r);
        $("#contenedor").selectpicker('refresh');
    })
}