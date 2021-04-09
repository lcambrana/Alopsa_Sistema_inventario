var tabla;

init();

$("#contenedor").change(function(){
    var idconexion=$('#contenedor').val();
    mostrarconexion(idconexion);
})

function init(){
    listar();
    listarcombocone();
}
function listar(){
    tabla=$('#tbllisdesconexion').dataTable({
        "aProcessing":true,
        "aServerSide":true,
         buttons:[
             'excelHtml5',
             'pdf'
         ],
         "ajax":{
             url:'../ajax/desconexiones.php?op=listar',
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
    var iddesco = $("#iddesconexion").val();
    
    if (iddesco==""){
        $("#titulo").html("Agregar una Desconexion");
    }else{
         $("#titulo").html("Modificar Desconexion No. "+iddesco);
     }
     $('#getmodaldes').modal('show');
}
function cancelarform(){
    
}
function listarcombocone(){
     $.post("../ajax/desconexiones.php?op=listarconexiones",function(r){
        $("#contenedor").html(r);
        $("#contenedor").selectpicker('refresh');
    });
}
function mostrarconexion(val){
    $.ajax({
       url:'../ajax/desconexiones.php?op=mostrarconexion',
       data:{idconexion:val},
       type: "get", 
       datatype:"json",
       success: function(resp){
           $('#datoscone').html(resp);
           calcularhoras()
       }
    });
}
function calcularhoras(){
    if ($('#contenedor').val()>0){
    $('#fechahorai').val($("#fechac").val() + ' ' + $('#horac').val());
    $('#fechahoraf').val($("#fechadesc").val() + ' ' + $('#horadesc').val());
    var horaconexion=moment($('#fechahorai').val(),"YYYY-MM-DD HH:mm");
    var horadesconexion=moment($('#fechahoraf').val(),"YYYY-MM-DD HH:mm" );
    var totalfecha=horadesconexion.diff(horaconexion,'hours')
    var min=totalfecha*60;
    var mindef=horadesconexion.diff(horaconexion,'m')-min
    
    $("#totalhoras").val(totalfecha+':' + padDigitos(mindef,2));
    }else{$("#totalhoras").val('0');}
}
function padDigitos(numero, digitos) {
    return Array(Math.max(digitos - String(numero).length + 1, 0)).join(0) + numero;
}