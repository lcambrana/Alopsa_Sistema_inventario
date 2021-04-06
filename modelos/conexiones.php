<?php

require '../config/Conexion.php';

class conexiones_c{
    public function __construct() {
        
    }
    
    public function listar(){
        $sql="CALL mostrar_conexiones()";
        return ejecutarConsulta($sql);
    }
}