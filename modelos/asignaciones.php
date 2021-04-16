<?php

require '../config/Conexion.php';

class asignaciones{
    
    public function __construct(){
        
    }
    public function insertar($observaciones,$bloque,$posicion,$idingreso,$idf,$idusuario){
       $sw=true;
        $sql1="update posicion set estado='Sin Asignar',id_ingreso=0 where idposicion=$posicion and idbloque=$bloque";
        ejecutarConsulta($sql1) or $sw=false;
        if ($sw==true){
        $sql="Call insertar_asign('$observaciones',$bloque,$posicion,$idingreso,$idf,$idusuario)";
        return ejecutarConsulta($sql);
        }else { return false;}
    }
    public function listarasignaciones(){
        $sql="CALL listar_asignaciones()";
        return ejecutarConsulta($sql);
    }
    public function listar_ingresos(){
        $sql="select Id_Ingreso, No_Contenedor from ingreso_maestro where estado='Ingresado'";
        return ejecutarConsulta($sql);
    }
    public function datosingreso($id) {
        $sql="CALL datosingreso_asig('$id')";
        return ejecutarConsulta($sql);
    }
}