create or replace noneditionable procedure ACTIVAR_PROMOCIONES(promociones_id_ IN NUMBER) is
begin
  update PV_PROMOCIONES
     set estado = 'A'
   where promociones_id_ = promociones_id;
end ACTIVAR_PROMOCIONES;
/
