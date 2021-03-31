<?php
if (strlen(session_id())<1)
    session_start();

require '../modelos/monitoreo.php';
$monitoreo=new monitoreo_c;
$user_id=$_SESSION['idusuario'];

switch ($_GET['op']){
    
    case 'listar':
        $rspta=$monitoreo->listar();
        $datosm=array();
        
        while ($reg=$rspta->fetch_object()){
            $datosm[]=array(
                "0"=>$reg->No_Contenedor,
                "1"=>$reg->Hora_De_Monitoreo,
                "2"=>$reg->Producto,
                "3"=>$reg->Set_Point,
                "4"=>$reg->Retorno,
                "5"=>$reg->Bloque,
                "6"=>$reg->Posicion,
                "7"=>$reg->Barco,
                "8"=>$reg->Fecha_Del_Monitoreo,
                "9"=>'<button class="btn btn-warning btn-xs" onclick="mostrar('.$reg->Id_m.')"><i class="fa fa-pencil" data-toggle="tooltip" data-placement="top" title="Editar Ingreso"></i></button>'.' '.'<button class="btn btn-danger btn-xs" onclick="dasactivar('.$reg->Id_m.')"><i class="fa fa-close" data-toggle="tooltip" data-placement="top" title="Anular Ingreso"></i></button> '
            );
        }
        $results=array(
            "sEcho"=>1,
            "iTotalRecords"=> count($datosm),
            "iTotalDisplayRecords"=> count($datosm),
            "aaData"=>$datosm
        );
        echo json_encode($results);
        break;
    case 'listaringreso':
        $rspta=$monitoreo->listar_ingreso();
        echo '<option value="0">Selecione Ingreso</option>';
        while ($reg=$rspta->fetch_object()){
            echo '<option value='.$reg->Id_Ingreso.'>'.$reg->Id_Ingreso.'-'.$reg->No_Contenedor.'</option>';
        }
        break;
    case 'mostraringreso':
        $idingreso=$_REQUEST['idingreso'];
        $rspta=$monitoreo->datosingreso($idingreso);
        while ($row = mysqli_fetch_array($rspta)){
        echo '<div class="form-group col-lg-2 col-md-3 col-xs-12">'
            . '<label>ORD:</label><input type="text" class="form-control " value="'.$row['Ord'].'" disabled="true">'
            . '</div><div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Producto:</label><input type="text" class="form-control" value="'.$row['producto'].'" disabled="true"></div>'
            . '<div class="form-group col-lg-2 col-md-3 col-xs-12"><label>Bloque:</label><input type="text" class="form-control" value="'.$row['Descripcion'].'" disabled="true"></div>'
            . '<div class="form-group col-lg-2 col-md-3 col-xs-12"><label>Posicion:</label><input type="text" class="form-control" value="'.$row['noposicion'].'" disabled="true"></div>'
            . '<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Barco:</label><input type="text" class="form-control" value="'.$row['Barco'].'" disabled="true"></div>'
            . '<input type="hidden" id="id_f" name="id_f" value="'.$row['Id_f'].'">';
        }
        break;
}