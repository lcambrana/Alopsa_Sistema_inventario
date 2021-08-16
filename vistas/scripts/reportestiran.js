var tabla;
init();

$(document).ready(function() {
    var url = window.location;
       $('.treeview-menu li a[href="' + url + '"]').parent().addClass('active');
       $('.treeview-menu li a').filter(function() {
        return this.href == url;
    }).parent().parent().parent().addClass('active');
});

function init(){
    listardatostiran();
}

function listardatostiran(){
    var fechain=$('#fechainicial').val();
    var fechafi=$('#fechafinal').val();
   tabla=$('#tbllistadortir').dataTable({
       "aProcessing": true,
       "aServerSide": true,
     
       "ajax":{
           url:'../ajax/reportes.php?op=listatirsanu',
           type: 'POST',
           data: {fechai:fechain,fechaf:fechafi},
           dataType:'json',
           error:function(e){
                    swal(e.responseText);
                }
       },
       "bDestroy":true,
       "iDisplayLength":10,
       "order":[[0,"asc"]]
   }).DataTable();
}
function mostrarre(){
    listardatostiran();
}

function exportar(){
    var fechain=$('#fechainicial').val();
    var fechafi=$('#fechafinal').val();
    window.location.href = "../exportar_re/exportaranu.php" + "?fechainicial=" + fechain + "&fechafinal=" + fechafi + "&tipo=" + 'tirs'
}