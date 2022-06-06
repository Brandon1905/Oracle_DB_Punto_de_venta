create or replace noneditionable procedure ACTIVAR_USUARIO(usuarios_id_ IN NUMBER) is
begin
  update PV_USUARIOS set estado = 'A' where usuarios_id_ = usuarios_id;
end ACTIVAR_USUARIO;
/
