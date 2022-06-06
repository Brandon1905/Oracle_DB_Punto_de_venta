create or replace noneditionable procedure INACTIVAR_USUARIO(usuarios_id_ IN NUMBER) is
begin
  update PV_USUARIOS set estado = 'I' where usuarios_id_ = usuarios_id;
end INACTIVAR_USUARIO;
/
