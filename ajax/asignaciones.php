<?php
if (strlen(session_id())<1)
    session_start();
require '../modelos/asignaciones.php';
$asgin=new asignaciones();

$user_id=$_SESSION['idusuario'];

switch ($_GET['op']){
case 'guardaryeditar':
    break;
case 'listar':
    $rspta=$asgin->listarasignaciones();
    $datos_asig=array();
    
    while ($reg=$rspta->fetch_object()){
       $datos_asig[]=array(
          "0"=>$reg->Ord,
          "1"=>$reg->Nombre_de_Piloto,
          "2"=>$reg->Placas,
          "3"=>$reg->Codigo_Piloto_Naviera,
          "4"=>$reg->No_Contenedor,
          "5"=>$reg->Bloque,
           "6"=>$reg->Posicion,
           "7"=>$reg->producto,
           "8"=>$reg->Barco,
           "9"=>'<button class="btn btn-warning btn-xs" onclick="mostrar('.$reg->Id_a.')"><i class="fa fa-pencil" data-toggle="tooltip" data-placement="top" title="Editar Asignacion"></i></button>'.' '.'<button class="btn btn-danger btn-xs" onclick="dasactivar('.$reg->Id_a.')"><i class="fa fa-close" data-toggle="tooltip" data-placement="top" title="Anular Asignacion"></i></button> '
       ); 
    }
      $results=array(
            "sEcho"=>1,
            "iTotalRecords"=> count($datos_asig),
            "iTotalDisplayRecords"=> count($datos_asig),
            "aaData"=>$datos_asig
        );
        echo json_encode($results);
    break;
case 'listaringresos':
    $rspta=$asgin->listar_ingresos();
    echo '<option value="0">Selecione Ingreso</option>';
        while ($reg=$rspta->fetch_object()){
            echo '<option value='.$reg->Id_Ingreso.'>'.$reg->Id_Ingreso.'-'.$reg->No_Contenedor.'</option>';
        }
    break;
case 'mostraringreso':
    $idingreso=$_REQUEST['idingreso'];
    $rspta=$asgin->datosingreso($idingreso);
    while($row= mysqli_fetch_array($rspta)){
        echo '<div class="form-group col-lg-2 col-md-3 col-xs-12"><label>ORD</label><input type="text" class="form-control" id="ord" name="ord" value="'.$row['ord'].'" disabled="true"></div>'
            .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Piloto</label><input type="text" class="form-control" value="'.$row['Nombre_de_Piloto'].'" disabled="true"></div>'
            .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Licencia</label><input type="text" class="form-control" value="'.$row['Licencias'].'" disabled="true"></div>';
    }
    break;
}