<?php

require "../config/Conexion.php";

class bitacora{
    public function __construct() {
        
    }
    public function insertar_bitacora($accion,$fecha,$hora,$usuario,$descripcion,$tabla){
        $sql="insert into bitacora (accion,fecha,hora,usuario,descripcion,tabla) values ('$accion','$fecha','$hora','$usuario','$descripcion','$tabla')";
        return ejecutarConsulta($sql);
    }
}
