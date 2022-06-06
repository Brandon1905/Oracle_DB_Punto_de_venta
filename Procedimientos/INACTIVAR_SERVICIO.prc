create or replace noneditionable procedure INACTIVAR_SERVICIO(servicio_id_ IN NUMBER) is
begin
  update PV_SERVICIO set estado = 'I' where servicio_id_ = servicio_id;
end INACTIVAR_SERVICIO;
/
