<?php
ob_start();
session_start();
date_default_timezone_set("America/Guatemala");

if (!isset($_SESSION['nombre'])){
    header("Location: login.html");
}else {
    
}