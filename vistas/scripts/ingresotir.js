var tabla;
var tabla2;
var  i =1;
init();

function init(){
      listar();
      listarcomboingreso();
      listartchasis();
      tabladanios();
      tipo_contenedores();
       $("#formulariotir").on("submit",function(e){
       guardaryeditar(e); 
    });
}

function listar(){
     tabla=$('#tbllistadotir').dataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'pdf'
        ],
        "ajax":{
                url:'../ajax/daniostir.php?op=listar',
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

function tabladanios(){
    tabla2=$('#tablafallastir').dataTable({
    }).DataTable();
}
function mostrarmodal(){
    var idtir=$('#idintir').val();
    
    if (idtir==""){
        $("#titulo").html("Agregar Dator TIR");
    }else{
        $('#titulo').html("Modificacion del TIR No."+idtir);
    }
    $('#getmodaltir').modal('toggle');
}
function listarcomboingreso(){
    $.post("../ajax/daniostir.php?op=listaringreso",function(r){
         $("#contenedor").html(r);
        $("#contenedor").selectpicker('refresh');
    });
}
function listartchasis(){
    $.post('../ajax/daniostir.php?op=listar_tchasis',function(r){
        $('#tipochasis').html(r);
        $('#tipochasis').selectpicker('refresh');
    })
}
function tipo_contenedores(){
    $.post('../ajax/daniostir.php?op=listar_tcontenedor',function(r){
        $('#tipocontenedor').html(r);
        $('#tipocontenedor').selectpicker('refresh');
    })
}

$("#contenedor").change(function(){
     var idingreso=$("#contenedor").val();
    mostraringreso(idingreso);
});
$("#ubicacion").change(function(){
    $('#select_esp').html("");
    var opcionu=$("#ubicacion").val();
    mostrardanios(opcionu);
});
$("#opcionesd").change(function(){
   var opcionfalla=$('#ubicacion').val();
   if (opcionfalla=='llantas'||opcionfalla=='marcham'){
       $.ajax({
       url:'../ajax/daniostir.php?op=crearselect',
       type: "get",
       datatype: "json",
       success:function(resp){
            $('#select_esp').html(resp);
       }
    });
   }else{
       $('#select_esp').html("");
   }
});
$('#agregar').click(function(){
    var ubicacion = document.getElementById("ubicacion");
    var ubic=ubicacion.options[ubicacion.selectedIndex].text;
    var opd=document.getElementById("opcionesd");
    var opciond =opd.options[opd.selectedIndex].text;
    var observacion = $('#observacionf').val();
    var pos =document.getElementById("posicion");
    var posi
    if ( $('#ubicacion').val()=='llantas' || $('#ubicacion').val()=='marcham'){
        posi=pos.options[pos.selectedIndex].text;
    }else {posi="No Aplica";};
    tabla2.row.add([i,ubic,opciond,'SI',posi,observacion,'<button type="button" name="remove" id="' + i + '" class="btn btn-danger btn_remove">Quitar</button>']).draw(false);
    i++;
    $('#ubicacion').val("");
    $('#ubicacion').selectpicker('refresh');
    $('#opcionesd').val("");
    $('#opcionesd').selectpicker('refresh');
    $("#observacionf").val("");
    $('#opcionesd').val(false).trigger("change");
    
    $("#tablafallastir").DataTable();
    
});

$(document).on('click','.btn_remove', function(){
       tabla2.row('.selected').remove().draw( false );  
       i=i-1;
});
 $('#tablafallastir tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }
        else {
            tabla2.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    } );
function mostraringreso(val){
    $.ajax({
       url:'../ajax/daniostir.php?op=mostraringreso',
       data:{iding:val},
       type: "get",
       datatype: "json",
       success:function(resp){
            $('#datosingreso').html(resp);
       }
    });
}
function mostrardanios(val){
    $.post("../ajax/daniostir.php?op=listardanios",{udanio:val} ,function(r){
        $("#opcionesd").html(r);
        $("#opcionesd").selectpicker('refresh');
    })
}
function guardaryeditar(e){
    e.preventDefault();
    $("#btnGuardar").prop("disabled",false);
    var formdata=new FormData($("#formulariotir")[0]);
     $.ajax({
       url: "../ajax/daniostir.php?op=guardaryeditar",
       type: "POST",
       data: formdata,
       contentType: false,
       processData: false,
       
       success: function(datos){
           var cadena=datos.substring(0,2);
           if (cadena>=0){
               enviadetallefallas(cadena)
           }else if (d=='Er'){
                swal({icon:'Error',title:'Error al Grabar',text:datos})
           }
   
          
       }
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
    $('#contenedor').val('');
    $('#contenedor').selectpicker('refresh');
    $('#tipochasis').val('');
    $('#tipochasis').selectpicker('refresh');
    $('#refrigeracion').val('');
    $('#refrigeracion').selectpicker('refresh');
    $('#tipocontenedor').val('');
    $('#tipocontenedor').selectpicker('refresh');
    $('#chassis').val('');
    $('#fecha').val(today);
    $('#hora').val(horaactual);
    eliminar_tabla();
    
    
}
function eliminar_tabla(){
  var elmtTable = document.getElementById('tablafallastir');
    var tableRows = elmtTable.getElementsByTagName('tr');
    var rowCount = tableRows.length;

    for (var x=rowCount-1; x>0; x--) {
       tabla2.row().remove().draw( false );
    }
}
function enviadetallefallas(val){
    var filas=[];
    $('#tablafallastir tbody tr').each(function(){
        var ubic=$(this).find('td').eq(1).text();
        var descripd=$(this).find('td').eq(2).text();
        var opcion=$(this).find('td').eq(3).text();
        var obser=$(this).find('td').eq(4).text();
        
        var fila={
          val,
          ubic,
          descripd,
          opcion,
          obser
        };
        filas.push(fila);
    });
   $.ajax({
       url:'../ajax/daniostir.php?op=enviardetalle',
       type:"POST",
       data:{datosfilas:JSON.stringify(filas)},
       success:function(data){
           console.log(data);
       }
   });
}