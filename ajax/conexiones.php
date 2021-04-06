<?php

if (strlen(session_id())<1)
    session_start();

require '../modelos/conexiones.php';
$conexionc=new conexiones_c;

switch ($_GET['op']){
    case 'listar':
        $rspta=$conexionc->listar();
        $datosc=array();
        
        while ($reg=$rspta->fetch_object()){
            $datosc[]=array(
                "0"=>$reg->No_Contenedor,
                "1"=>$reg->Fecha_Conexion,
                "2"=>$reg->Hora_De_Conexion,
                "3"=>$reg->Setpoint,
                "4"=>$reg->Suministro,
                "5"=>$reg->Retorno,
                "6"=>$reg->Id_Ingreso,
                "7"=>$reg->Cabezal,
                "8"=>$reg->Nombre_de_Piloto,
                "9"=>'<button class="btn btn-warning btn-xs" onclick="mostrar('.$reg->Id.')"><i class="fa fa-pencil" data-toggle="tooltip" data-placement="top" title="Editar Monitoreo"></i></button>'.' '.'<button class="btn btn-danger btn-xs" onclick="dasactivar('.$reg->Id.')"><i class="fa fa-close" data-toggle="tooltip" data-placement="top" title="Anular Monitoreo"></i></button> '
            );
        }
        $results=array(
             "sEcho"=>1,
            "iTotalRecords"=> count($datosc),
            "iTotalDisplayRecords"=> count($datosc),
            "aaData"=>$datosc
        );
        echo json_encode($results);
        break;
}