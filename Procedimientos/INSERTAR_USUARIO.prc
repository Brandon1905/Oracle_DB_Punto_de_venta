create or replace noneditionable procedure INSERTAR_USUARIO(usuario_    VARCHAR2,
                                                            rol_        VARCHAR2,
                                                            contraseņa_ VARCHAR2,
                                                            correo_     VARCHAR2) is
begin

  INSERT INTO PV_USUARIOS
    (USUARIO, ROL, CONTRASEŅA, CORREO, ESTADO)
  VALUES
    (usuario_, rol_, ENCRIPTADO(contraseņa_), correo_, 'A');

end INSERTAR_USUARIO;
/
