<?php

require '../config/Conexion.php';

class monitoreo_c{
    
    public function __construct() {
        
    }
    public function listar(){
        $sql="CALL listar_Monitoreo";
        return ejecutarConsulta($sql);
    }
}