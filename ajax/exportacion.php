<?php

session_start();
require '../modelos/exportacion.php';

$exportacion_c=new exportacion();

$user_id=$_SESSION['idusuario'];

switch ($_GET['op']){
    case 'listar':
        $rspta=$exportacion_c->listar();
        $datos=array();
            while ($reg=$rspta->fetch_object()){
                $datos[]=array(
                    "0"=>$reg->fecha,
                    "1"=>$reg->hora,
                    "2"=>$reg->No_Contenedor,
                    "3"=>$reg->Nombre_de_Piloto,
                    "4"=>$reg->Licencias,
                    "5"=>$reg->Barco,
                    "6"=>'<button class="btn btn-warning btn-xs" onclick="mostrar('.$reg->Id_e.')"><i class="fa fa-pencil" data-toggle="tooltip" data-placement="top" title="Editar Exportacion"></i></button>'.' '.'<button class="btn btn-danger btn-xs" onclick="dasactivar('.$reg->Id_e.')"><i class="fa fa-close" data-toggle="tooltip" data-placement="top" title="Anular Exportacion"></i></button> '
                );
            }
            $r=array( "sEcho"=>1,
                "iTotalRecords"=>count($datos),
                "iTotalDisplayRecords"=>count($datos),
                "aaData"=>$datos
                );
                echo json_encode($r);
        break;
    case 'listaringreso':
        $rspta=$exportacion_c->listar_contenedores();
        echo '<option value="0">Seleccione...</option>';
            while ($reg=$rspta->fetch_object()){
                echo '<option value='.$reg->Id_Ingreso.'>'.$reg->Id_Ingreso.'-'.$reg->No_Contenedor.'</option>';
            }
        break;
    case 'mostrarcontenedor':
        $idconte=$_REQUEST['idingresoc'];
        $rspta=$exportacion_c->datoscontenedor($idconte);
         while ($row= mysqli_fetch_array($rspta)){
             echo '<div class="form-group col-lg-2 col-md-3 col-xs-12"><label>Tara:</label><input type="text" class="form-control" id="tara" name="tara" value="'.$row['tara'].'" disabled="true"></div>'
                .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Transportista</label><input type="text" class="form-control" value="'.$row['Transporte'].'" disabled="true"><input type="hidden" id="naviera" name="naviera" value="'.$row['Transporte'].'" > </div>'
                .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Piloto</label><input type="text" class="form-control" value="'.$row['Nombre_de_Piloto'].'" disabled="true"></div>'
                .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Licencia</label><input type="text" class="form-control" value="'.$row['Licencias'].'" disabled="true"></div>'
                .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Placas</label><input type="text" class="form-control" value="'.$row['Placas'].'" disabled="true"></div>'
                .'<div class="form-group col-lg-2 col-md-3 col-xs-12"><label>Codigo</label><input type="text" class="form-control" value="'.$row['Codigo_Piloto_Naviera'].'" disabled="true"></div>'
                .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Destino</label><input type="text" class="form-control"  value="'.$row['Destino'].'" disabled="true"><input type="hidden" id="destino" name="destino" value="'.$row['Destino'].'"><input type="hidden" id="idf" name="idf" value="'.$row['Id_f'].'"></div>' 
                .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Barco</label><input type="text" class="form-control" value="'.$row['Barco'].'" disabled="true"></div>';

         }
         
        break;
}