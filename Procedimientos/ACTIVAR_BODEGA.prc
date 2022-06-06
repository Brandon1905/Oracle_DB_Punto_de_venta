create or replace noneditionable procedure ACTIVAR_BODEGA(bodega_id_ IN NUMBER) is
begin
  update PV_BODEGA set estado = 'A' where bodega_id_ = bodega_id;
end ACTIVAR_BODEGA;
/
