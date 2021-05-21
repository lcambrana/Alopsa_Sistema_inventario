<?php

if (strlen(session_id())<1)
    session_start();

require '../modelos/posicion_contenedor_predio.php';
date_default_timezone_set("America/Guatemala");
$posicion_conte=new posicion_cont_predio();
$idposcontpre=isset($_POST['idposcont'])? limpiarCadena($_POST['idposcont']):"";
$fecha=isset($_POST['fechai'])? limpiarCadena($_POST['fechai']):'';
$hora= isset(($_POST['hora']))? limpiarCadena($_POST['hora']):'';
$contenedor=isset($_POST['idingreso'])? limpiarCadena($_POST['idingreso']):'';
$idf=isset($_POST['idf'])? limpiarCadena($_POST['idf']):"";
$idpatio=isset($_POST['patio'])? limpiarCadena($_POST['patio']):"";
$idarea= isset($_POST['areap'])? limpiarCadena($_POST['areap']):'';
$idbloque= isset($_POST['bloque'])? limpiarCadena($_POST['bloque']):'';
$idfila= isset($_POST['fila'])? limpiarCadena($_POST['fila']):'';
$altura= isset($_POST['noaltura'])? limpiarCadena($_POST['noaltura']):'';
$observaciones=isset($_POST['observaciones'])? limpiarCadena($_POST['observaciones']):'';
$idaltura= isset($_POST['idaltura'])? limpiarCadena($_POST['idaltura']):'';
$user_id=$_SESSION['idusuario'];

switch ($_GET['op']){
    case 'guardareditar':
        if (empty($idposcontpre)){
            $rspta=$posicion_conte->insertar($fecha,$hora,$idpatio,$idarea,$idbloque,$idfila,$altura,$user_id,$contenedor,$idf,$observaciones,$idaltura);
            echo $rspta ? 'Se asigno el contenedor en la patio correcto':'Error al realizar la asignacion del contenedor';
        }else{
            
        }
        break;
    case 'listaringreso':
        $rspta=$posicion_conte->listar_ingresos_conte();
        echo '<option value="0">Selecione Ingreso</option>';
        while ($reg=$rspta->fetch_object()){
            echo '<option value='.$reg->Id_Ingreso.'>'.$reg->Id_Ingreso.'-'.$reg->No_Contenedor.'</option>';
        }
     break;
    case 'listapatio':
        $rspta=$posicion_conte->listar_patio();
        echo '<option value="0">Selecione Ingreso</option>';
        while ($reg=$rspta->fetch_object()){
            echo '<option value='.$reg->id_patio.'>'.$reg->id_patio.'-'.$reg->patio_desc.'</option>';
        }
        break;
    case 'listararea':
        $idpatio=$_REQUEST['id_patio'];
        $rspta=$posicion_conte->listar_area($idpatio);
        echo '<option value="0">Seleccione Area</option>';
        while ($reg=$rspta->fetch_object()){
             echo '<option value='.$reg->id_area.'>'.$reg->id_patio.'-'.$reg->area.'</option>';
        }    
        
        break;
    case 'listarbloque':
        $idarea=$_REQUEST['id_area'];
        $rspta=$posicion_conte->listar_bloque($idarea);
        echo '<option value="0">Seleccione Bloque</option>';
        while ($reg=$rspta->fetch_object()){
             echo '<option value='.$reg->id_bloque.'>'.$reg->area.'-'.$reg->Descripcion.'</option>';
        }    
        
        break;
    case 'listarfila':
        $idbloque=$_REQUEST['id_bloque'];
        $rspta=$posicion_conte->listar_fila($idbloque);
        echo '<option value="0">Seleccione Fila</option>';
        while ($reg=$rspta->fetch_object()){
             echo '<option value='.$reg->idfila.'>'.$reg->Descripcion.'-'.$reg->fila.'</option>';
        } 
        break;
    case 'alturafila':
        $idfila=$_REQUEST['id_fila'];
        $rspta=$posicion_conte->numero_altura($idfila);
        while ($row= mysqli_fetch_array($rspta)){
            echo '<div class="form-group col-lg-2 col-md-3 col-xs-12"><label id="altura" name="altura">Altura:</label><input type="text" class="form-control" name="noaltura" id="noaltura" value="'.$row['altura'].'"><input type="hidden" id="idaltura" name="idaltura" value="'.$row['id_altura'].'" ></div>';
        }
        break;
    case 'mostraringreso':
        $id_ingreso=$_REQUEST['idingreso'];
        $rspta=$posicion_conte->datosingresoco($id_ingreso);
        while ($row= mysqli_fetch_array($rspta)){
            echo '<div class="form-group col-lg-2 col-md-3 col-xs-12"><label>Tara:</label><input type="text" class="form-control" id="tara" name="tara" value="'.$row['tara'].'" disabled="true"></div>'
                .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Transportista</label><input type="text" class="form-control" value="'.$row['Transporte'].'" disabled="true"><input type="hidden" id="naviera" name="naviera" value="'.$row['Transporte'].'" > </div>'
                .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Piloto</label><input type="text" class="form-control" value="'.$row['Nombre_de_Piloto'].'" disabled="true"></div>'
                .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Licencia</label><input type="text" class="form-control" value="'.$row['Licencias'].'" disabled="true"></div>'
                .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Placas</label><input type="text" class="form-control" value="'.$row['Placas'].'" disabled="true"></div>'
                .'<div class="form-group col-lg-2 col-md-3 col-xs-12"><label>Codigo</label><input type="text" class="form-control" value="'.$row['Codigo_Piloto_Naviera'].'" disabled="true"></div>'
                .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Destino</label><input type="text" class="form-control"  value="'.$row['Destino'].'" disabled="true"><input type="hidden" id="destino" name="destino" value="'.$row['Destino'].'"><input type="hidden" id="idf" name="idf" value="'.$row['Id_f'].'"></div>';

        }
        break;
    case 'listarpos':
        $rspta=$posicion_conte->listar_cont_pos();
        $datos=Array();
        while ($reg=$rspta->fetch_object()){
            $datos[]=array(
                '0'=>$reg->contenedor,
                '1'=>$reg->patio,
                '2'=>$reg->area,
                '3'=>$reg->bloque,
                '4'=>$reg->fila,
                '5'=>$reg->altura,
                '6'=>$reg->observaciones,
                '7'=>'<button class="btn btn-warning btn-xs" onclick="mostrar('.$reg->id_conte_posi.')"><i class="fa fa-pencil" data-toggle="tooltip" data-placement="top" title="Editar Monitoreo"></i></button>'.' '.'<button class="btn btn-danger btn-xs" onclick="dasactivar('.$reg->id_conte_posi.')"><i class="fa fa-close" data-toggle="tooltip" data-placement="top" title="Anular Monitoreo"></i></button> '
            );
        }
        $results=array(
            "sEcho"=>1,
            "iTotalRecords"=> count($datos),
            "iTotalDisplayRecords"=> count($datos),
            "aaData"=>$datos
        );
        echo json_encode($results);
        break;
    case 'mostrar':
        $id_poscon=$_REQUEST['idposcont'];
        $rspta=$posicion_conte->mostrar($id_poscon);
        echo json_encode($rspta);
        break;
}

?>