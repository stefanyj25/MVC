<?php
class Conexion {

  public static function conectar(){
    try{

      $cn = new PDO("mysql:host=localhost;dbname=scriptweDB", "root","");

      return $cn;

    }catch (EXCEPTION $ex){
      die($ex->getMessage());
    }

  }
}
