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
}