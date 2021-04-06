var tabla;

function init(){
    listar();
}
function listar(){
    tabla=$('#tbllistadoconexion').dataTable({
        "aProcessing":true,
        "aServerSide":true,
        buttons:[
                    'excelHtml5',
                    'pdf'
        ],
        "ajax":{
            url:'../ajax/conexiones.php?op=listar',    
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
init();