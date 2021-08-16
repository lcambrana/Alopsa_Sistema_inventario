<?php

require '../config/Conexion.php';

class conexiones_c{
    public function __construct() {
        
    }
    public function insertar($fechac,$horacon,$setpoint,$suministro,$retorno,$idingreso,$idf,$idusuario,$temperatura,$tipoconexion,$mecanico){
        $sql="CALL insertar_conexion('$fechac','$horacon',$setpoint,$suministro,$retorno,$idingreso,$idf,'$idusuario','$temperatura','$tipoconexion','$mecanico')";
        return ejecutarConsulta($sql);
    }
    public function editar($idcon,$fechac,$horacon,$setpoint,$suministro,$retorno,$idingreso,$idf,$temperatura,$tipoconexion,$mecanico){
         $sql="CALL actualizar_conexion($idcon,'$fechac','$horacon',$setpoint,$suministro,$retorno,$idingreso,$idf,'$temperatura','$tipoconexion','$mecanico')";
        return ejecutarConsulta($sql);
    }
    public function listar(){
        $sql="CALL mostrar_conexiones()";
        return ejecutarConsulta($sql);
    }
    public function datosingreso($ingreso){
        $sql="call datosingreso_c('$ingreso')";
        return ejecutarConsulta($sql);
    }
    public function mostrarco($id){
        $sql="CALL mostrar_dato_conexion($id)";
        return ejecutarConsultaSimpleFila($sql);
    }
    public function desactivar($id){
        $sql="update conexion set Estado='Inactivo' where Id=$id";
        return ejecutarConsulta($sql);
    }
    public function listar_ingreso(){
        //$sql="select Id_Ingreso,No_Contenedor from ingreso_maestro where estado in('Ingresado','Asignado') ";
        $sql="SELECT cpp.id_ingre_m as Id_Ingreso,im.No_Contenedor from contenedor_posicion_patio cpp " .
              " INNER JOIN ingreso_maestro im on im.Id_Ingreso=cpp.id_ingre_m " .
              " WHERE cpp.estado='Ingresado' ";
        return ejecutarConsulta($sql);
    }
}