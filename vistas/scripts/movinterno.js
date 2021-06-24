var tabla;
var tabla;
init();

function init(){
    lista();
    listac();
    listarcomboingreso();
    listarcomboingresoc();
    
}
function lista(){
    tabla=$('#tbllista_movinterno').dataTable().DataTable();
}
function listac(){
    tabla=$('#tbllista_movinternoc').dataTable().DataTable();
}
function mostrarmodal(){
    var idmovinterno = $('#idmovinterno').val();
    if (idmovinterno==""){
        $('#titulo').html("Ingreso Movimientos Internos");
    }else{
        $('#titulo').html('Modificacion de Movimientos Internos No. ' + idmovinterno);
    }
    $('#getmodalmovinterno').modal('toggle');
}
function mostrarmodalc(){
    var idmovinterno = $('#idmovic').val();
    if (idmovinterno==""){
        $('#titulo').html("Ingreso Movimientos Internos Cabezales");
    }else{
        $('#titulo').html('Modificacion de Movimientos Internos Cabezales No. ' + idmovinterno);
    }
    $('#getmodalmovic').modal('toggle');
}
function listarcomboingreso(){
    $.post("../ajax/movinterno.php?op=listaringreso",function(r){
        $("#contenedor").html(r);
        $("#contenedor").selectpicker('refresh');
    });
}
function listarcomboingresoc(){
    $.post("../ajax/movinterno.php?op=listaringresoc",function(c){
        $("#contenedorc").html(c);
        $("#contenedorc").selectpicker('refresh');
    });
}
function cancelarform(){
    limpiar();
}
function limpiar(){
    var now = new Date();
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);
    var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
    var hora = now.getHours();
    var minuto =("0" + now.getMinutes()).slice(-2);
    var segundo = ("0" + now.getSeconds()).slice(-2);
    var horaactual = hora + ":" + minuto + ":" + segundo;
    $('#semana').val('');
    $('#anio').val(now.getFullYear());
    $('#fechamov').val(today);
    $('#Hingreso').val(horaactual);
    $('#contenedor').val('');
    $('#contenedor').selectpicker('refresh');
    $('#medida').val('');
    $('#bloque').val('');
    $('#cliente').val('');
    $('#actividad').val('');
    $('#patio').val('');
    $('#motivo').val('');
    listarcomboingreso();
    
}
function cancelarformc(){
    limpiarc();
}
function limpiarc(){
    var now = new Date();
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);
    var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
    var hora = now.getHours();
    var minuto =("0" + now.getMinutes()).slice(-2);
    var segundo = ("0" + now.getSeconds()).slice(-2);
    var horaactual = hora + ":" + minuto + ":" + segundo;
    $('#semanac').val('');
    $('#fechamovc').val(today);
    $('#Hingresoc').val(horaactual);
    $('#contenedorc').val('');
    $('#contenedorc').selectpicker('refresh');
    $('#clientec').val('');
    $('#actividadc').val('');
    $('#comentario').val('');
    listarcomboingresoc();
}

