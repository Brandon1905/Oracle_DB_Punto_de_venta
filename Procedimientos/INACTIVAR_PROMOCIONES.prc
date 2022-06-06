create or replace noneditionable procedure INACTIVAR_PROMOCIONES(promociones_id_ IN NUMBER) is
begin
  update PV_PROMOCIONES
     set estado = 'I'
   where promociones_id_ = promociones_id;
end INACTIVAR_PROMOCIONES;
/
