<?php

require '../config/Conexion.php';

class movinterno{
    public function __construct(){
        
    }
    public function listar_ingreso(){
        $sql="select Id_Ingreso,No_Contenedor from ingreso_maestro where estado in('Ingresado','Exportado')";
        return ejecutarConsulta($sql);
    }
    public function listar_ingresoc(){
        $sql="select Id_Ingreso,No_Contenedor from ingreso_maestro where estado in('Ingresado','Exportado')";
        return ejecutarConsulta($sql);
    }
}