<?php
if (strlen(session_id())<1)
    session_start();
require '../modelos/reportes.php';
require('fpdf/fpdf.php');

$numerotir=$_GET['notir'];
$datostir=new reportes_g;

$dtir=$datostir->reportetir_n($numerotir);

$datos=$dtir->fetch_array(MYSQLI_ASSOC);

$pdf = new FPDF();
$pdf->AddPage("P",array(210,350));
$pdf->SetFont('Arial','B',15);
$pdf->SetTextColor(0,0,255);

$pdf->Image('image/ALOPSA.jpg',20,15,60);

$texto="TIR: ";
$pdf->SetXY(105, 20);
$pdf->SetTextColor(0,0,255);
$pdf->SetFont('Arial','B',15);
$pdf->MultiCell(50,20,$texto,1,"l");
$pdf->SetFont('Arial','B',13);
$pdf->SetXY(117,25);
$pdf->Cell(30,10,'GTTG 2 AC');

$texto1="Serie A"."\nNo: ".$datos['idtir'];
$pdf->SetXY(155, 20);
$pdf->SetFont('Arial','B',15);
$pdf->SetTextColor(255,0,0);
$pdf->MultiCell(45,10,$texto1,1,"C");

$pdf->SetTextColor(0,0,255);
$texto2="Contenedor No:  ".$datos['No_Contenedor'] ;
$pdf->SetXY(10,40);
$pdf->SetFont('Arial','B',9);
$pdf->MultiCell(95,15,$texto2,1,"L");

$texto3="Chassis No: " .$datos['chassis'] ;
$pdf->SetXY(105,40);
$pdf->SetFont('Arial','B',9);
$pdf->MultiCell(95,15,$texto3,1,"L");

$texto4="CHAS ". $datos['tipochassis'];
$pdf->SetXY(10,55);
$pdf->SetFont('Arial','B',10);
$pdf->MultiCell(60,10,$texto4,1,"L");

$texto5=$datos['refrigeracion']?'GENS':'REEF';
$pdf->SetXY(70,55);
$pdf->SetFont('Arial','B',10);
$pdf->MultiCell(70,10,$texto5,1,"L");

$texto6=$datos['descripcion'];
$pdf->SetXY(140,55);
$pdf->SetFont('Arial','B',10);
$pdf->MultiCell(60,10,$texto6,1,"C");

$texto7="Fecha     ".utf8_decode("Año     ")."Mes       "."Dia      "; 

$pdf->SetXY(10,65);
$pdf->SetFont('Arial','B',9);
$pdf->MultiCell(60,13,$texto7,1,"C");
$pdf->Ln();
$pdf->SetXY(12,68);
$pdf->cell(60,15,"",0,"C");
$pdf->SetXY(28,68);
$pdf->cell(60,15, date("Y",strtotime($datos['fecha'])),0,"C");
$pdf->SetXY(42,68);
$pdf->cell(60,15,date("m", strtotime($datos['fecha'])),0,"C");
$pdf->SetXY(53,68);
$pdf->cell(60,15,date("d", strtotime($datos['fecha'])),0,"C");


$texto8="Hora       "."Hora       "."Min       "."Gate in       "."Gate out       ";
$pdf->SetXY(70,65);
$pdf->SetFont('Arial','B',9);
$pdf->MultiCell(80,13,$texto8,1,"L");
$pdf->Ln();
$pdf->SetXY(72,68);
$pdf->cell(60,15,"",0,"C");
$pdf->SetXY(85,68);
$pdf->cell(60,15,date("H", strtotime($datos['hora'])),0,"C");
$pdf->SetXY(98,68);
$pdf->cell(60,15,date("i", strtotime($datos['hora'])),0,"C");
if ($datos['tipomov']=='Ingreso'){
$pdf->Image('image/check.png',115,73,3);
$pdf->Image('image/equis.png',133,73,4);
}elseif ($datos['tipomov']=='Salida'){
    $pdf->Image('image/equis.png',115,73,4);
    $pdf->Image('image/check.png',133,73,4);
}
if($datos['vacio']=='si'){$texto9="Vacio: SI";}else{$texto9='Vacio: NO';};
$pdf->SetXY(150,65);
$pdf->SetFont('Arial','B',9);
$pdf->MultiCell(50,13,$texto9,1,"L");
if ($datos['vacio']=='si'){
$pdf->Image('image/equis.png',170,69.6,6);
}else {
$pdf->Image('image/check.png',170,69,6);
}
$texto10="Nombre De Transportista:";
$pdf->SetXY(10,78);
$pdf->SetFont('Arial','B',9);
$pdf->MultiCell(50,13,'',1,"L");
$pdf->SetXY(10, 75);
$pdf->Cell(47,10,$texto10,0,'L');
$pdf->Ln();
$pdf->SetXY(12, 78);
$pdf->cell(48,15,$datos['Nombre_naviera'],0,"C");

$pdf->SetXY(60,78);
$pdf->SetFont('Arial','B',9);
$pdf->MultiCell(70,13,'',1,"L");
$pdf->SetXY(60, 73);
$pdf->Cell(40,15,'Nombre de piloto: ',0,'L');
$pdf->SetXY(110, 73);
$pdf->Cell(20,15,'Licencia: ',0,'L');
$pdf->Ln();
$pdf->SetXY(62, 79);
$pdf->Cell(40,13,$datos['Nombre_de_Piloto'],0,'C');
$pdf->SetXY(112, 79);
$pdf->Cell(40,13,$datos['Licencias'],0,'C');


$pdf->SetXY(130,78);
$pdf->SetTextColor(0,0,255);
$pdf->SetFont('Arial','B',9);
$pdf->MultiCell(35,13,'',1,"C");
$pdf->SetXY(130, 74);
$pdf->Cell(30,13,"Placa:",0,'C');
$pdf->Ln();
$pdf->SetXY(135, 79);
$pdf->Cell(30,13,$datos['Placas'],0,'C');

$pdf->SetXY(165,78);
$pdf->SetTextColor(0,0,255);
$pdf->SetFont('Arial','B',9);
$pdf->MultiCell(35,13,'',1,"L");
$pdf->SetXY(165,74);
$pdf->Cell(30,13,'Destino:',0,'l');
$pdf->Ln();
$pdf->SetXY(170,79);
$pdf->Cell(30,13,$datos['Destino'],0,1);


$pdf->Image('image/izquierda.png',10,92,31);
$pdf->Image('image/derecha.png',43,92,31);
$pdf->Image('image/frente.png',75,92,13);
$pdf->Image('image/interior.png',89,92,28);
$pdf->Image('image/trasero.png',121,92,13);
$pdf->Image('image/techo.png',140,92,29);
$pdf->Image('image/chasis.png',170,92,30);

if ($datos['fallaizq']==1){
$pdf->Image('image/check.png',20,109,7);
}else {
 $pdf->Image('image/equis.png',20,109,7);
}
if ($datos['fallader']==1){
    $pdf->Image('image/check.png',55,109,7);
}else{
    $pdf->Image('image/equis.png',55,109,7);
}
if ($datos['fallafre']==1){
    $pdf->Image('image/check.png',78,109,7);
}else {
    $pdf->Image('image/equis.png',78,109,7);
}
if ($datos['fallainte']==1){
    $pdf->Image('image/check.png',98,109,7);
}else {
    $pdf->Image('image/equis.png',98,109,7);
}
if ($datos['fallatra']){
    $pdf->Image('image/check.png',124,109,7);    
}else {
    $pdf->Image('image/equis.png',124,109,7);
}
if ($datos['fallatec']==1){
    $pdf->Image('image/check.png',150,109,7);
}else {
    $pdf->Image('image/equis.png',150,109,7);
}
if ($datos['fallachas']==1){
    $pdf->Image('image/check.png',180,109,7);
} else {
    $pdf->Image('image/equis.png',180,109,7);
}

$pdf->SetXY(10,117);
$pdf->SetTextColor(0,0,255);
$pdf->SetFont('Arial','B',12);
$pdf->MultiCell(190,80,"",1,"L");
$pdf->SetXY(12,116);
$pdf->cell(60,15,"Contenedor",0,"C");

//detalle
$pdf->Ln(15);

$pdf->SetFont('Arial','B',8);
$pdf->SetFillColor(2,157,116);
$pdf->SetTextColor(240, 255, 240);


$pdf->Cell(40,12,'No Tir',1,0,'C',true);
$pdf->Cell(50,12,'Descripcion Fallas',1,0,'C',true);
$pdf->Cell(20,12,'Opcion',1,0,'C',true);
$pdf->Cell(20,12,'Posicion',1,0,'C',true);
$pdf->Cell(59.5,12,'Observaciones',1,0,'C',true);



$pdf->Ln();
$pdf->SetFont('Arial','',8);
$pdf->SetTextColor(0, 10, 0);

clearStoredResults();
    $rspta=$datostir->detalle_tir($numerotir);
    
    foreach ($rspta as $dettir){
        
        $pdf->Cell(40,7,$dettir['ubicacion'],1,0,'C');
        $pdf->Cell(50,7,$dettir['falla'],1,0,'C');
        if ($dettir['opcionfalla']==1){
        $pdf->Cell(20,7,"SI",1,0,'C');
        }
        $pdf->Cell(20,7,$dettir['Posicion'],1,0,'C');
        $pdf->Cell(59.5,7,$dettir['observacion'],1,0,'L');
        $pdf->Ln();
    }

$pdf->SetXY(10,197);
$pdf->SetTextColor(0,0,255);
$pdf->SetFont('Arial','B',10);
$pdf->MultiCell(190,20,'',1,"L");
$pdf->SetXY(12,193);
$pdf->cell(60,15,"Observaciones:",0,"C");
$pdf->Ln();
$pdf->SetXY(15, 198);
$pdf->SetFont('Arial','B',10);
$pdf->Cell(180,15,$datos['observaciones'],0,'L');

$pdf->SetXY(10,217);
$pdf->SetTextColor(0,0,255);
$pdf->SetFont('Arial','B',10);
$pdf->MultiCell(60,80,"",1,"L");
$pdf->Ln();
$pdf->SetXY(10,217);
$pdf->cell(60,8,"REEFFER",1,0,'C');
$pdf->SetXY(10,220);
$pdf->cell(60,15,"Encendido",0,"C");
$pdf->SetXY(10,227);
$pdf->cell(60,15,"P.T.I.",0,"C");
$pdf->SetXY(10,234);
$pdf->cell(60,15,"Bateria(Marca)",0,"C");
$pdf->SetXY(10,241);
$pdf->cell(60,15,"Setting",0,"C");
$pdf->SetXY(10,248);
$pdf->cell(60,15,"Lectura",0,"C");
$pdf->SetXY(10,255);
$pdf->cell(60,15,"Genset",0,"C");
$pdf->SetXY(10,262);
$pdf->cell(60,15,"Horometro",0,"C");
$pdf->SetXY(10,269);
$pdf->cell(60,15,"Nivel de Combustivle",0,"C");
$pdf->SetXY(10,276);
$pdf->cell(60,15,"Humedad",0,"C");
$pdf->SetXY(10,283);
$pdf->cell(60,15,"Ventilacion",0,"C");

$pdf->SetXY(70,217);
$pdf->SetTextColor(0,0,255);
$pdf->SetFont('Arial','B',10);
$pdf->MultiCell(60,37,"",1,"L");
$pdf->Ln();
$pdf->SetXY(70,217);
$pdf->SetFillColor(51, 94, 255);
$pdf->SetTextColor(253, 253, 255);
$pdf->cell(60,8,"Mecanico Responsable",1,0,"C",true);
$pdf->SetTextColor(0, 0, 255);
$pdf->SetXY(71,225);
$pdf->cell(59,8,"Refer",'B,b');
$pdf->SetXY(71,233);
$pdf->cell(59,8,"Genset",'B,b');
$pdf->SetXY(71,240);
$pdf->cell(59,8,"Chasis: ".$datos['chassis'],'B,b');
$pdf->SetXY(71,245);
$pdf->cell(60,15,"Contenedor: ".$datos['No_Contenedor'] ,0,"C");
$pdf->Ln();

$pdf->SetXY(70,254);
$pdf->SetTextColor(0,0,255);
$pdf->SetFont('Arial','B',10);
$pdf->MultiCell(60,43,"",1,"L");
$pdf->SetXY(70,261);
$pdf->cell(60,9,"Sooking No.",'B,b');
$pdf->SetXY(70,270);
$pdf->cell(60,9,"Sello Sealock",'B,b');
$pdf->SetXY(70,279);
$pdf->cell(60,9,"Sello Botellita: ".$datos['sello_botella']  ,'B,b');
$pdf->SetXY(70, 286);
$pdf->Cell(60,9,'Tara: '.$datos['tara']);
$pdf->SetXY(130,217);
$pdf->SetTextColor(0,0,255);
$pdf->SetFont('Arial','B',9);
$pdf->MultiCell(36,53,"",1,"L");
$pdf->SetXY(130,240);
$pdf->cell(36,10,"Nombre Responsable",'T,t');
$pdf->SetXY(130,260);
$pdf->cell(36,10,"Firma Responsable",'T,t',0,'C');

$pdf->SetXY(166,217);
$pdf->SetTextColor(0,0,255);
$pdf->SetFont('Arial','B',9);
$pdf->MultiCell(34,53,"",1,"L");
$pdf->SetXY(166,217);
$pdf->SetFillColor(51, 94, 255);
$pdf->SetTextColor(253, 253, 255);
$pdf->cell(34,8,"Cliente",1,0,"C",true);
$pdf->SetXY(166,240);
$pdf->SetTextColor(0,0,255);
$pdf->cell(34,8,"Nombre Razon Social",'T,t');
$pdf->SetXY(166,260);
$pdf->cell(34,8,"Firma y Sello Recibo",'T,t');

$pdf->SetXY(130,270);
$pdf->SetTextColor(0,0,255);
$pdf->SetFont('Arial','B',9);
$pdf->MultiCell(70,27,"",1,"L");
$pdf->SetXY(130,270);
$pdf->SetFillColor(51, 94, 255);
$pdf->SetTextColor(253, 253, 255);
$pdf->cell(70,7,"Transporte",1,0,"C",true);

$pdf->SetXY(130,288);
$pdf->SetTextColor(0,0,255);
$pdf->cell(70,9,"Firma Piloto",'T,t',0,'C');

$texto14=utf8_decode("Queda bajo responabilidad del transportista, entregar el equipo aqui escrito y la carga que se transporta, en las mismas condiciones en que los recibio, en el destino espesificado, en el entendido que cualquier daño al mismo, a la carga que se transporta asi como daños a terceros ocasionados durante su transporte, corren todo bajo su total responsabilidad");
$pdf->SetXY(10,297);
$pdf->SetTextColor(0,0,255);
$pdf->SetFont('Arial','B',9);
$pdf->MultiCell(190,5,$texto14,1,"J");
$pdf->SetTitle("Reporte Tir No.".$numerotir );

$pdf->SetDisplayMode('fullwidth','single');
$pdf->OutPut();
?>