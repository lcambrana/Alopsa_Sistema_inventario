<?php

if (strlen(session_id())<1)
    session_start();

require '../modelos/posicion_contenedor_predio.php';
date_default_timezone_set("America/Guatemala");
$posicion_conte=new posicion_cont_predio();

switch ($_GET['op']){
    case 'listaringreso':
        $rspta=$posicion_conte->listar_ingresos_conte();
        echo '<option value="0">Selecione Ingreso</option>';
        while ($reg=$rspta->fetch_object()){
            echo '<option value='.$reg->Id_Ingreso.'>'.$reg->Id_Ingreso.'-'.$reg->No_Contenedor.'</option>';
        }
     break;
}

?>