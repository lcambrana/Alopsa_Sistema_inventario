var tabla;

$("#contenedor").change(function(){
    var idingreso=$("#contenedor").val();
    mostraringreso(idingreso);
});
function init(){
    listar();
    listarcomboingreso();
}
function listar(){
    tabla=$('#tbllistasignaciones').dataTable({
        "aProcessing":true,
        "aServerSide":true,
        buttons:[
                    'excelHtml5',
                    'pdf'
        ],
        "ajax":{
            url:'../ajax/asignaciones.php?op=listar',    
            type: 'get',
            dataType: 'json',
            error:function(e){
            console.log(e.responseText);
            }
        },
        "bDestroy":true,
        "iDisplayLength":10,
        "order":[[0,"asc"]]
    }).DataTable();
}
function mostrarmodal(){
    var idasig = $('#idasignacion').val();
    
    if(idasig==""){
        $("#titulo").html("Agregar Asignacion");
    }else{
        $("#titulo").html("Modificar Asignacion No."+idasig);
    }
    $("#getmodalasig").modal('toggle');
}
function listarcomboingreso(){
    $.post("../ajax/asignaciones.php?op=listaringresos",function(r){
        $("#contenedor").html(r);
        $("#contenedor").selectpicker('refresh');
    });
}
function mostraringreso(val){
    $.ajax({
        url:'../ajax/asignaciones.php?op=mostraringreso',
        data: {idingreso:val},
        type: "get",
        datatype: "json",
        success: function(resp){
            $('#datosingreso').html(resp);
        }
    });
}
init();