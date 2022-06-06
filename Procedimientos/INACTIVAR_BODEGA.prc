create or replace noneditionable procedure INACTIVAR_BODEGA(bodega_id_ IN NUMBER) is
begin
  update PV_BODEGA set estado = 'I' where bodega_id_ = bodega_id;
end INACTIVAR_BODEGA;
/
