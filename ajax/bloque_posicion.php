<?php

if (strlen(session_id())<1)
    session_start();

require '../modelos/bloqueposicion.php';

$bloqueposicion = new bloqueposicion();

switch ($_GET["op"]){
    case 'listar_bloques':
        $rspta=$bloqueposicion->listar_bloque();
        echo '<option value="0">Seleccione Bloque</option>';
        while ($reg=$rspta->fetch_object()){
            echo '<option value='.$reg->id_bloque.'>'.$reg->Descripcion.'</option>';
        }
        break;
    case 'listar_posicion':
        $id_bloque=$_REQUEST['idbloque'];
        $rspta=$bloqueposicion->listar_posicion($id_bloque);
        if ($rspta->num_rows>0){
        echo '<option value="0">Seleccione Posicion</option>';
        while ($reg=$rspta->fetch_object()){
            echo '<option value='.$reg->idposicion.'>'.$reg->noposicion.'</option>';
        }
        }else{
           echo'<option value="0">Sin Posicion</option>';
        }
        break;
    case 'listaposiciones':
        $id=$_REQUEST['idbloque'];
        $rspta=$bloqueposicion->listarposiciones($id);
        echo '<option value="0">seleccione Posicion</option>';
         while ($reg=$rspta->fetch_object()){
            echo '<option value='.$reg->idposicion.'>'.$reg->idbloque.'-'.$reg->noposicion.'</option>';
        }
        break;
}