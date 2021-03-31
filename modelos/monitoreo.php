<?php

require '../config/Conexion.php';

class monitoreo_c{
    
    public function __construct() {
        
    }
    public function listar(){
        $sql="CALL listar_Monitoreo";
        return ejecutarConsulta($sql);
    }
    public function listar_ingreso(){
        $sql="select Id_Ingreso,No_Contenedor from ingreso_maestro where Estado='ingresado'";
        return ejecutarConsulta($sql);
    }
    public function datosingreso($ingreso){
        $sql="call datosingreso('$ingreso')";
        return ejecutarConsulta($sql);
    }
}