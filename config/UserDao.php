<?php

include 'Conexion.php';
include '../models/User.php';

class UserDao extends Conexion
{
  protected static $cnx;

  private static function getConexion()
  {
    self::$cnx = Conexion::conectar();
  }

  private static function desconectar()
  {
    self::$cnx = null;
  }

  public static function login ($user)
  {
    $query = ("SELECT id_user, name_user, email_user, pass_user, created_user
              FROM users
              WHERE email_user = :email_user");

            self::getConexion();

            $email_user = $user->getEmail_user();
            $resultado = self::$cnx->prepare($query);
            $resultado->bindParam(":email_user", $email_user);
            $resultado->execute();
            $row = $resultado->fetch(PDO::FETCH_ASSOC);

            if(password_verify('tuchis', $row['pass_user'])){
              return true;
            }else{
              echo "Password o email invalido";
            }
  }
}
