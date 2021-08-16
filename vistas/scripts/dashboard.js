init();

function init(){
    contador_ingresos();
    contador_tirs();
    contador_conexion();
    contador_movinternos();
    contador_tircerrados();
    mostrardatos_linec();
}

function contador_ingresos(){
    $.post('../ajax/dashboard.php?op=cantidad_ingreso_maestros',
    function(data){
       dc=JSON.parse(data);
       $('#cantidadingresos').html(dc);
    });
}
function contador_tirs(){
    $.post('../ajax/dashboard.php?op=cantidad_tirs',
            function(data){
                d=JSON.parse(data);
                $('#cantidadtir').html(d);
            }
     );
}
function contador_conexion(){
    $.post('../ajax/dashboard.php?op=Cantidad_conexion',
        function(data){
            d=JSON.parse(data);
            $('#cantidadConexion').html(d);
        }
    );
}
function contador_movinternos(){
    $.post('../ajax/dashboard.php?op=cantidad_movinterno',
    function(data){
        d=JSON.parse(data);
        $('#cantidadmovint').html(d);
    });
}
function contador_tircerrados(){
    $.post('../ajax/dashboard.php?op=cantida_tirscerrado',
    function(data){ 
        d=JSON.parse(data);
        $('#cantidadtircer').html(d);
    }
    );
}
function mostrardatos_linec(){
   var weekdays = ["Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom"];
   
   $.post("../ajax/dashboard.php?op=grafica_linea",function(data){
       datos=JSON.parse(data);
       Morris.Line({
                element: 'line-chart',
                data:      
                  datos,
                lineColors: ['#f5901a', '#fc8710', '#FF6541', '#A4ADD3', '#766B56'],
                xkey: 'period',
                ykeys: ['total'],
                labels: ['Total'],
                xLabels: 'day',
                xLabelFormat: function(d) {
                  return weekdays[d.getDay()];
                },
                resize: true
              });
       
   });

}