var tabla;

$("#contenedor").change(function(){
    var idingreso=$("#contenedor").val();
    mostraringreso(idingreso);
  
});
$("#posiciones").change(function(){
    var idbloque=$('#bloque').val();
   var idposicion=$('#posiciones').val();
   
   validarposicion(idposicion,idbloque);
});
function init(){
    listar();
    listarcomboingreso();
    $("#formularioasig").on("submit",function(e){
       guardaryeditar(e);
    });
}
$("#bloque").change(function(){
    var idbloque=$('#bloque').val();
    listar_posicion(idbloque);
})
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
    var bloque;
    listar_bloque();
    $.ajax({
        url:'../ajax/asignaciones.php?op=mostraringreso',
        data: {idingreso:val},
        type: "get",
        datatype: "json",
        success: function(resp){
            $('#datosingreso').html(resp);
            
            bloque=$('#idbloque').val();
            posicion=$('#posicionac').val();
            
            $('#bloque').val(bloque);
            $('#bloque').selectpicker('refresh');
            $("#bloque").val(true).trigger("change");
        }
         
    });
        
   
}
function listar_bloque(){
    $.post("../ajax/bloque_posicion.php?op=listar_bloques",function(r){
        $("#bloque").html(r);
        $("#bloque").selectpicker('refresh');
    });
}
function listar_posicion(val){
     $.post("../ajax/bloque_posicion.php?op=listaposiciones",{idbloque:val},function(r){
        $("#posiciones").html(r);
        $("#posiciones").selectpicker('refresh');   
        $('#bloque').val(val);
        $('#bloque').selectpicker('refresh');
    });
    
}
function cancelarform(){
    listarcomboingreso();
    listar_bloque();
    $("#contenedor").val("");
    $("#contenedor").val(false).trigger("change");
    $("#observaciones").val("");
    
}
function validarposicion(valpos,valblo){
 $.post("../ajax/asignaciones.php?op=validarposicion",{idposicion:valpos,idbloque:valblo},
 function(data,status){
     datos=JSON.parse(data);
     if(datos.estado=='Asignado'){
         swal({
             title:"Posicion",
             icon:"warning",
             text:"La Posicion que esta asignado ya se encuentra en Uso. ingreso No. "+datos.id_ingreso+" Contenedor "+datos.contenedor
         })
         $('#mposi').val('asignado');
     }else{
         $('#mposi').val('sinasignar');
     }
 })   
}
function guardaryeditar(e){
    e.preventDefault();
    $('#btnGuardar').prop('disabled',false);
    var formdatos = new FormData($('#formularioasig')[0]);
    if ($('#contenedor').val()=='0'){
          swal({title: "Dato Importante", text:"Debe de Seleccionar el contenedor para continuar"});
    }else if($('#mposi').val()=='asignado'){
        swal({title: "Dato Importante", text:"No se puede Grabar porque la Posicion esta en Uso"});
    }
    else if ($('#mposi').val()=='sinasignar'){
        $.ajax({
               url: "../ajax/asignaciones.php?op=guardaryeditar",
           type: "POST",
           data: formdatos,
           contentType: false,
           processData: false,
           
           success: function(datos){
            var d= datos.substring(0,2);
            if (d=='Se'){
                swal({
                    icon:'success',title: 'Asignacion',text:datos
                    });
                    tabla.ajax.reload();
                     $('#getmodalasig').modal('toggle');
                   
            }else if (d=='Er'){
                swal({icon:'error',title:'Error al Grabar',text:datos})
            }
            
           
           
       }
      });
    }
}
init();