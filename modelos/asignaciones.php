<?php

require '../config/Conexion.php';

class asignaciones{
    
    public function __construct(){
        
    }
    public function insertar($observaciones,$bloque,$posicion,$idingreso,$idf,$idusuario,$bloqueac,$posicioac){
       $sw=true;
      
        $sql1="update posicion set estado='Sin Asignar',id_ingreso=0 where idposicion=$posicioac and idbloque=$bloqueac";
        ejecutarConsulta($sql1) or $sw=false;
        if ($sw==true){     
            $sw2=true;
            $sql="Call insertar_asign('$observaciones',$bloque,$posicion,$idingreso,$idf,$idusuario)";
            ejecutarConsulta($sql) or $sw2=false;
           if ($sw2==true){
               $sql2="update ingreso_maestro set Bloque=$bloque,Posicion=$posicion where Id_Ingreso=$idingreso";
               ejecutarConsulta($sql2);
               return $sw2;
           }else {
            return $sw2  ;
           }
        }else { return false;}
    }
    public function actualizar($id,$observaciones,$bloque,$posicion,$idingreso,$idf,$bloqueac,$posicioac) {
        $sw=true;
        $sql1="update posicion set estado='Sin Asignar',id_ingreso=0 where idposicion=$posicioac and idbloque=$bloqueac";
        ejecutarConsulta($sql1) or $sw=false;
        
        if ($sw==true){
            $sw1=true;
            $sql2="CALL actualizar_asign($id,'$observaciones',$bloque,$posicion,$idingreso,$idf)";
            ejecutarConsulta($sql2) or $sw1=false;
            if ($sw1==true){
                $sql3="update ingreso_maestro set Bloque=$bloque,Posicion=$posicion where Id_Ingreso=$idingreso";
                ejecutarConsulta($sql3) or $sw1=false;
                return $sw1;
            }else{
                return $sw1;
            }
        }else{
            return false;
        }
        
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
    public function mostrarasignacion($id) {
        $sql="CALL mostrar_asignacion('$id')";
        return ejecutarConsultaSimpleFila($sql);
    }
}