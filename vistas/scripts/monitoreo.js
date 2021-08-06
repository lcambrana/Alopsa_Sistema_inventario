var tabla;
$(document).ready(function() {
    var url = window.location;
    // Will only work if string in href matches with location
    $('.treeview-menu li a[href="' + url + '"]').parent().addClass('active');
    // Will also work for relative and absolute hrefs
    $('.treeview-menu li a').filter(function() {
        return this.href == url;
    }).parent().parent().parent().addClass('active');


});
function init(){
    listar();
    listarcomboingreso();
    $("#formulariom").on("submit",function(e){
       guardaryeditar(e);
    });
    $("#formularioautorizacion").on("submit",function(e){
       validarusuario(e); 
    });
}
//lista todo los monitoreos en la tabla
function listar(){
    tabla=$('#tbllistadoingresos').dataTable({
        "aProcessing":true,
        "aServerSide":true,
         buttons:[
             'excelHtml5',
             'pdf'
         ],
         "ajax":{
             url:'../ajax/monitoreo.php?op=listar',
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

function mostrarform(){
    var idm = $("#idmonitoreo").val();
    
    if(idm==""){
         $("#titulo").html("Agregar Monitoreo");
    }else{
        $("#titulo").html("Modificar Monitoreo No. "+idm);
    }
    $('#getmodalm').modal('toggle');
}
$("#contenedor").change(function(){
    var idingreso=$("#contenedor").val();
    mostraringreso(idingreso);
});
function listarcomboingreso(){
    $.post("../ajax/monitoreo.php?op=listaringreso",function(r){
        $("#contenedor").html(r);
        $("#contenedor").selectpicker('refresh');
    });
}
function mostraringreso(val){
    
    $.ajax({
       url:'../ajax/monitoreo.php?op=mostraringreso',
       data:{id_ingreso:val},
       type: "get",
       datatype:"json",
       success: function(resp){
           $('#datosingreso').html(resp);
       }
    });
}
function cancelarform(){
    limpiar();
}
function guardaryeditar(e){
    e.preventDefault();    
    $("#btnGuardar").prop('disabled',false);
    var formdata= new FormData($('#formulariom')[0]);
    if ($("#contenedor").val()=='0'){
        
        swal({title: "Dato Importante", text:"Debe de Seleccionar el contenedor para continuar"});
    }else{
        
       $.ajax({
           url: "../ajax/monitoreo.php?op=guardaryeditar",
           type: "POST",
           data: formdata,
           contentType: false,
           processData: false,
           
           success: function(datos){
            var d= datos.substring(0,2);
            if (d=='Se'){
                swal({
                    icon:'success',title: 'Monitoreo',text:datos
                    });
                    limpiar();
                    tabla.ajax.reload();
                     $('#getmodalm').modal('toggle');
                   
            }else if (d=='Er'){
                swal({icon:'Error',title:'Error al Grabar',text:datos})
            }else{
                swal(datos);
            }
            
           
           
       }
        });
        
    }
        
}
function limpiar(){
    var now = new Date();
    var dia = ("0" + now.getDate()).slice(-2);
    var mes = ("0" + (now.getMonth() + 1)).slice(-2);
    var today = now.getFullYear()+"-"+(mes)+"-"+dia;
    var hora = now.getHours();
    var minuto =("0" + now.getMinutes()).slice(-2);
    var segundo = ("0" + now.getSeconds()).slice(-2);
    var horaactual = hora + ":" + minuto + ":" + segundo;
    listarcomboingreso();
    $("#horamonitoreo").val(horaactual);
    $("#fecham").val(today);
    //$("#contenedor").val(false).trigger("change");
    $("#idingreso").val("");
    $("#retorno").val("");
    $("#setpoint").val("");
    $("#suministro").val("");
    $("#mecanico").val("");
    $("#observaciones").val("");
    $("#idmonitoreo").val("");
    $("#titulo").html("");
	mostraringreso(0);
    
}
function mostrar(id){
    $.post("../ajax/monitoreo.php?op=mostrardatos",{idmon:id},
            function(data,status){
                data=JSON.parse(data);
                $("#idmonitoreo").val(data.Id_m);
                $("#horamonitoreo").val(data.Hora_De_Monitoreo);
                $("#fecham").val(data.Fecha_Del_Monitoreo);
                $("#retorno").val(data.Retorno);
                $("#setpoint").val(data.Set_Point);
                $("#suministro").val(data.Suministro);
                $("#mecanico").val(data.Nombre_Del_Mecanico);
                $("#observaciones").val(data.Observaciones);
                $("#contenedor").val(data.id_ingreso);
                $("#contenedor").selectpicker('refresh');
                mostraringreso(data.id_ingreso);
                mostrarform();
            }
    );
}
function dasactivar(id_monitoreo){
    $("#getmodalau_m").modal('show');
    $("#id_monitoreo").val(id_monitoreo);
    
}

function validarusuario(e){
    e.preventDefault();
    $("#btnGuardar2").prop("disabled",false);
    var usuario=$("#usuario").val();
    var password=$("#password").val();
    if ($("#usuario").val()==""){
        swal({ title: "Parametro Requerido", text:"Debe de Ingresar su usuario para anular el ingreso"});
    }else if ($("#password").val()=="") {
         swal({title:"Parametro Requerido",text:'Debe de Ingresar su contraseña para continuar'});
    }else{
        $.post("../ajax/usuario.php?op=validaranulacion",{"logina":usuario,"clavea":password},
        function(data){
            if (data!="null"){
                var idanular=$("#id_monitoreo").val();
                desactivar_m(idanular,);
            }else{
                swal({title:'Anulacion Cancelada',title:"No cuenta con el acceso para anular el ingreso"})
            }
        }
        );
    }
}
function desactivar_m(val){
    swal({
        title: "Anulacion de Registro",
        text: "¿Esta seguro de desactivar el Monitoreo seleccionado?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
            .then((willDelete) =>{
                if (willDelete){
                $.post("../ajax/monitoreo.php?op=desactivar", {id_m : val}, function(e){
				swal({title:e});
                                $('#getmodalau_m').modal('toggle');
				tabla.ajax.reload();
			});
                    } else {
                    swal("Se ha cancelado la accion")
                }
            });
    
}
init();