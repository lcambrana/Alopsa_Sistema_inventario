<?php

require '../config/Conexion.php';

class desconexiones{
    public function __construct() {
        
    }
    public function insertar($fechadesco,$horadesco,$totalhoras,$observaciones,$idingreso,$idf,$idusuario,$idconexion){
        $sql="CALL Insertar_desconexion('$fechadesco','$horadesco','$totalhoras','$observaciones',$idf,$idingreso,$idusuario,$idconexion)";
        return ejecutarConsulta($sql);
    }
    public function actualizar($iddesc,$fechadesco,$horadesco,$totalhoras,$observaciones,$idingreso,$idf,$idconexion){
        $sql="CALL actualizar_desconexion($iddesc,'$fechadesco','$horadesco','$totalhoras','$observaciones',$idingreso,$idf,$idconexion)";
        return ejecutarConsulta($sql);
    }
    public function listar(){
        $sql="CALL mostrar_desconexion()";
        return ejecutarConsulta($sql);
    }
    public function listarconexiones(){
        $sql="select a.Id,b.No_Contenedor from conexion a inner join ingreso_maestro b on a.Id_ingreso=b.Id_Ingreso where a.Estado='Activo' and b.Estado='Ingresado'";
        return ejecutarConsulta($sql);
    }
    public function datosconexion($id){
        $sql="CALL datosconexion($id)";
        return ejecutarConsulta($sql);
    }
    public function mostrardesc($id){
        $sql="select * from desconexion where id_d=$id";
        return ejecutarConsultaSimpleFila($sql);
    }
    public function desactivar($id){
            $sql="update desconexion set estado='Inactivo' where Id_d='$id'";
            return ejecutarConsulta($sql);
    }
}