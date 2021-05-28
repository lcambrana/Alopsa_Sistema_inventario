<?php

require '../config/Conexion.php';

class exportacion{
    public function __construct() {
        
    }
    public function listar(){
        $sql="call mostrar_exportacion()";
        return ejecutarConsulta($sql);
    }
    public function listar_contenedores(){
        $sql="select * from ingreso_maestro where estado in('Ingresado','Asignado')";
        return ejecutarConsulta($sql);
    }
    public function datoscontenedor($id){
        $sql="CALL datosingreso($id)";
        return ejecutarConsulta($sql);
    }
}