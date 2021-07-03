<?php
if (strlen(session_id())<1)
    session_start();
require '../modelos/movinterno.php';
require '../modelos/bitacora.php';
date_default_timezone_set("America/Guatemala");

$minter=new movinterno;
$bitacora=new bitacora();
$idmovinterc= isset($_POST['idmovic'])? limpiarCadena($_POST['idmovic']):'';
$semana= isset($_POST['semanac'])? limpiarCadena($_POST['semanac']):'';
$fecha= isset($_POST['fechamovc'])? limpiarCadena($_POST['fechamovc']):'';
$hora= isset($_POST['hingresoc'])? limpiarCadena($_POST['hingresoc']):'';
$contenedor=isset($_POST['contenedorc'])? limpiarCadena($_POST['contenedorc']):'';
$cliente= isset($_POST['clientec'])? limpiarCadena($_POST['clientec']):'';
$acti= isset($_POST['actividadc'])? limpiarCadena($_POST['actividadc']):'';
$comen= isset($_POST['comentarioc'])? limpiarCadena($_POST['comentarioc']):'';
$user_id=$_SESSION['idusuario'];
switch ($_GET['op']){
    case 'guardareditar':
        if (empty($idmovinterc)){
            $rspta= $minter->insertarc($semana,$fecha,$hora,$contenedor,$cliente,$acti,$comen,$user_id);
            if ($rspta==true){
                 $hoy = date("Y/m/d");
                $hora_actual=date("H:i:s");
                $bitacora->insertar_bitacora('Inserta', $hoy, $hora_actual,$_SESSION['nombre'] ,'Creacion de Nueva Posicion Contenedor','contenedor_posicion_patio');
           }
            echo $rspta ? 'Se asigno el contenedor en la patio correcto':'Error al realizar la asignacion del contenedor';
        }else {
            $rspta=$minter->actualizarc($idmovinterc,$semana,$fecha,$hora,$contenedor,$cliente,$acti,$comen);
           if ($rspta==true){
                $hoy = date("Y/m/d");
                $hora_actual=date("H:i:s");
                $bitacora->insertar_bitacora('Actualizar', $hoy, $hora_actual,$_SESSION['nombre'] ,'Se ha actualizado el registro numero '.$idmovinterc,'contenedor_posicion_patio');
            }
            echo $rspta ? 'Se ha Actualizado las posicion del contenedor satisfactoriamente':'Error: Se ha generado un error al grabar la Posicion';
 
        }
        break;

    case 'listar':
        $rspta=$minter->listar_movinterno_cabezal();
        $datos=Array();
        $opcion='';
        while ($reg=$rspta->fetch_object()){
            if ($reg->estado=='activo'){
                $opcion='<button class="btn btn-danger btn-xs" onclick="dasactivarc('.$reg->id.')"><i class="fa fa-close" data-toggle="tooltip" data-placement="top" title="Anular"></i></button> ';
            }else {
                $opcion = '<button class="btn btn-success btn-xs" onclick="activarc('.$reg->id.')"><i class="fa fa-check" data-toggle="tooltip" data-placement="top" title="Activar Ingreso"></i></button>';
            }
            
            $datos[]=array(
                '0'=>$reg->id,
                '1'=>$reg->semana,
                '2'=>$reg->fecha_mov,
                '3'=>$reg->hora_ingreso,
                '4'=>$reg->No_Contenedor,
                '5'=>$reg->cliente,
                '6'=>$reg->actividad,
                '7'=>$reg->Movinter_c,
                '8'=>'<button class="btn btn-warning btn-xs" onclick="mostrarc('.$reg->id.')"><i class="fa fa-pencil" data-toggle="tooltip" data-placement="top" title="Editar Monitoreo"></i></button>'.' '. $opcion
                
            );
        }
        $resultado=array(
            "sEcho"=>1,
            "iTotalRecords"=> count($datos),
            "iTotalDisplayRecords"=> count($datos),
            "aaData"=>$datos
        );
        echo json_encode($resultado);
        break;
    case 'mostrar':
        $id_movinterno=$_REQUEST['idmovinternoc'];
        $rspta=$minter->mostrarc($id_movinterno);
        echo json_encode($rspta);
        break;
    case 'desactivar':
        $id_movintc=$_REQUEST['idmovinterc'];
        $rspta=$minter->desactivarc($id_movintc);
        echo $rspta ? "Se ha desactivados correctamente el movimiento Interno Cabezal" : "No se pudo desactivar el registro";        
        break;
    case 'activar':
        $id_movintc=$_REQUEST['idmovinterc'];
        $rspta=$minter->activarc($id_movintc);
         echo $rspta ? "Movimiento Interno Activado correctamente" : "No se pudo activar el movimiento interno";
        break;
}