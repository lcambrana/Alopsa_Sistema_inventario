var tabla;

init();

function init(){
    listar();
    llenarlistaingreso();
}

function listar(){
    tabla=$('#tbllistaexportacion').dataTable({
        "aProcessing":true,
        "aServerSide":true,
        "bDestroy":true,
        "ajax":{
            url:'../ajax/exportacion.php?op=listar',
            type:'get',
            dataType: 'json',
            error:function(e){
                console.log(e.responseText);
                swal("Error : " + e.responseText);
            }
        },
        "iDisplayLength":10,
        "order":[[0,"asc"]]
    }).DataTable();
}
function mostrarmodal(){
    var idexpo=$('#idexportacion').val();
    if (idexpo==''){
        $('#titulo').html("Creacion de Exportacion");
    }else{
        $('#titulo').html("Modificacion de Exportacion No. " + idexpo);
    }
    $('#getmodalexpo').modal('show');
}
function llenarlistaingreso(){
    $.post('../ajax/exportacion.php?op=listaringreso', function(r){
        $("#contenedor").html(r);
        $("#contenedor").selectpicker('refresh');
    });
}
function mostraringresom(val){
    $.ajax({
        url:'../ajax/exportacion.php?op=mostrarcontenedor',
        data:{idingresoc:val},
        type: "get",
        datatype:"json",
        success:function(resp){
            $('#datoscont').html(resp);
        },
        error:function(e){
            swal(e);
        }
    })
}

$('#contenedor').change(function(){
    var idingreso=$('#contenedor').val();
    $('#idingresoc').val(idingreso);
    mostraringresom(idingreso);
})