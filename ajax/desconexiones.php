<?php
session_start();
require '../modelos/desconexiones.php';

$desconexion=new desconexiones();
$user_id=$_SESSION['idusuario'];

switch ($_GET['op']){
    case 'listar':
        $rspta=$desconexion->listar();
        $datos=array();
        
        while ($reg=$rspta->fetch_object()){
            $datos[]=array(
                "0"=>$reg->No_Contenedor,
                "1"=>$reg->Fecha_De_Desconexion,
                "2"=>$reg->Hora_De_Desconexio,
                "3"=>$reg->totalhoras,
                "4"=>$reg->idco,
                "5"=>$reg->Fecha_ingreso,
                "6"=>$reg->Hora_ingreso,
                "7"=>$reg->Descripcion_contenido,
                "8"=>$reg->Nombre_de_Piloto,
                "9"=>$reg->Cabezal,
                "10"=>$reg->Id_Ingreso,
                "11"=>'<button class="btn btn-warning btn-xs" onclick="mostrar('.$reg->Id_d.')"><i class="fa fa-pencil" data-toggle="tooltip" data-placement="top" title="Editar Monitoreo"></i></button>'.' '.'<button class="btn btn-danger btn-xs" onclick="dasactivar('.$reg->Id_d.')"><i class="fa fa-close" data-toggle="tooltip" data-placement="top" title="Anular Monitoreo"></i></button> '
                    
            );
        }
        $results=array( "sEcho"=>1,
            "iTotalRecords"=> count($datos),
            "iTotalDisplayRecords"=> count($datos),
            "aaData"=>$datos);
        echo json_encode($results);
        break;
        case 'listarconexiones':
            $rspta=$desconexion->listarconexiones();
            echo '<option value="0">Selecione...</option>';
            while ($reg=$rspta->fetch_object()){
                echo '<option value='.$reg->Id.'>'.$reg->Id.'-'.$reg->No_Contenedor.'</option>';
            }
            break;
        case 'mostrarconexion':
            $idcon=$_REQUEST['idconexion'];
            $rspta=$desconexion->datosconexion($idcon);
            while ($row= mysqli_fetch_array($rspta)){
                echo '<div class="form-group col-lg-3 col-md-3 col-xs-12">'
                . '<label>Fecha Conexion:</label><input type="text" class="form-control" id="fechac" value="'.$row['Fecha_Conexion'].'" disabled="true"></div>'
                . '<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Hora Conexion:</label><input type="text" id="horac" class="form-control" value="'.$row['Hora_De_Conexion'].'" disabled="true"></div>'
                . '<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Setpoint:</label><input type="text" class="form-control" value="'.$row['Setpoint'].'" disabled="true"></div>'
                . '<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Suministro:</label><input type="text" class="form-control" value="'.$row['Suministro'].'" disabled="true"></div>'
                . '<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Fecha Ingreso:</label><input type="text" id="fechai" class="form-control" value="'.$row['Fecha_ingreso'].'" disabled="true"></div>'
                . '<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Hora Ingreso:</label><input type="text" id="horai" class="form-control" value="'.$row['Hora_ingreso'].'" disabled="true"></div>'
                . '<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Cabezal:</label><input type="text" class="form-control" value="'.$row['Cabezal'].'" disabled="true"></div>'
                . '<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Piloto:</label><input type="text" class="form-control" value="'.$row['Nombre_de_Piloto'].'" disabled="true"></div>';
            }
            break;
}