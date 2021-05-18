<?php

require '../config/Conexion.php';

class posicion_cont_predio{
    public function __construct() {
        
    }
    public function listar_ingresos_conte(){
         $sql="select Id_Ingreso,No_Contenedor from ingreso_maestro where estado='Ingresado'";
        return ejecutarConsulta($sql);
    }
}
