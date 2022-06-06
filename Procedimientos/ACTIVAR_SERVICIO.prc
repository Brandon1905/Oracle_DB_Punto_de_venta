create or replace noneditionable procedure ACTIVAR_SERVICIO(servicio_id_ IN NUMBER) is
begin
  update PV_SERVICIO set estado = 'A' where servicio_id_ = servicio_id;
end ACTIVAR_SERVICIO;
/
