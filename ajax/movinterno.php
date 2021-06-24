<?php

if (strlen(session_id())<1)
    session_start();

require '../modelos/movinterno.php';

date_default_timezone_set("America/Guatemala");

$minter=new movinterno;


switch ($_GET['op']){
    case 'listaringreso':
       $rspta=$minter->listar_ingreso();
        echo '<option value="0">Seleccione Ingreso</option>';
        while ($reg=$rspta->fetch_object()){
            echo '<option value='.$reg->Id_Ingreso.'>'.$reg->Id_Ingreso.'-'.$reg->No_Contenedor.'</option>';
        }
        break;
    case 'listaringresoc':
       $rspta=$minter->listar_ingresoc();
        echo '<option value="0">Seleccione Ingreso</option>';
        while ($reg=$rspta->fetch_object()){
            echo '<option value='.$reg->Id_Ingreso.'>'.$reg->Id_Ingreso.'-'.$reg->No_Contenedor.'</option>';
        }
        break;
}