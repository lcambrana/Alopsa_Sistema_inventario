
<?php
if (strlen(session_id())<1)
    session_start();
require '../modelos/asignaciones.php';
$asgin=new asignaciones();
$id=isset($_POST['idasignacion'])? limpiarCadena($_POST['idasignacion']):"";
$idingreso= isset($_POST['contenedor'])? limpiarCadena($_POST['contenedor']):"";
$idf=isset($_POST['idf'])? limpiarCadena($_POST['idf']):"";
$bloque=isset($_POST['bloque'])? limpiarCadena($_POST['bloque']):"";
$bloquea=isset($_POST['idbloque'])? limpiarCadena($_POST['idbloque']):"";
$posiciona=isset($_POST['idposicion'])? limpiarCadena($_POST['idposicion']):"";
$posicion=isset($_POST['posiciones'])? limpiarCadena($_POST['posiciones']):"";
$observaciones=isset($_POST['observaciones'])? limpiarCadena($_POST['observaciones']):"";
$user_id=$_SESSION['idusuario'];

switch ($_GET['op']){
case 'guardaryeditar':
    if (empty($id)){
        $rspta=$asgin->insertar($observaciones,$bloque,$posicion,$idingreso,$idf,$user_id,$bloquea,$posiciona);
         echo $rspta ? 'Se ingreso la asignacion Exitosamente':'Error al realizar la asignacion';
    }else{
        $rspta=$asgin->actualizar($id, $observaciones, $bloque, $posicion, $idingreso, $idf, $bloquea, $posiciona);
         echo $rspta ? "Se ha actualizados correctamente" : "No se pudo actualizar los datos"; 
    }
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
            .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Licencia</label><input type="text" class="form-control" value="'.$row['Licencias'].'" disabled="true"></div>'
            .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Placas</label><input type="text" class="form-control" value="'.$row['Placas'].'" disabled="true"></div>'
            .'<div class="form-group col-lg-2 col-md-3 col-xs-12"><label>Codigo</label><input type="text" class="form-control" value="'.$row['Codigo_Piloto_Naviera'].'" disabled="true"></div>'
            .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Producto</label><input type="text" class="form-control" value="'.$row['producto'].'" disabled="true"></div>'
            .'<div class="form-group col-lg-3 col-md-3 col-xs-12"><label>Barco</label><input type="text" class="form-control" value="'.$row['Barco'].'" disabled="true"></div>'
            .'<div class="form-group col-lg-2 col-md-3 col-xs-12"><label>Posicion Actual:</label><input type="text" class="form-control" id="posicionac" name="posicionac" value="'.$row['noposicion'].'" disabled="true"> <input type="hidden" id="idposicion" name="idposicion" value="'.$row['Posicion'].'" ></div>'
            .'<div class="form-group col-1g-2 col-md-3 col-xs-12"><label>Bloque Actual:</label><input type="text" class="form-control" id="des_bloque" name="des_bloque" value="'.$row['Descripcion'].'" disabled="true"><input type="hidden" id="idbloque" name="idbloque" value="'.$row['Bloque'].'"><input type="hidden" id="idf" and name="idf" value="'.$row['Id_f'].'"></div>'
            .'';
    }
    break;
case 'validarposicion':
    require_once '../modelos/bloqueposicion.php';
    $bloquep=new bloqueposicion();
    $bloque=$_REQUEST['idbloque'];
    $posicion=$_REQUEST['idposicion'];
    $rspta=$bloquep->validarposicion($bloque,$posicion);
    echo json_encode($rspta);
    break;
case 'mostrarasig':
    $idasig=$_REQUEST['idasignacion'];
    $rspta=$asgin->mostrarasignacion($idasig);
    echo json_encode($rspta);
    break;
}