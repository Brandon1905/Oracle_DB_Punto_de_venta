create or replace noneditionable procedure ELIMINAR_USUARIO(USUARIO_ID_ IN NUMBER) is
begin

  DELETE FROM PV_USUARIOS U WHERE U.USUARIOS_ID = USUARIO_ID_;

end ELIMINAR_USUARIO;
/
