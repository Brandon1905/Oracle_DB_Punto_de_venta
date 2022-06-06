create or replace noneditionable procedure ACTIVAR_FACTURA(factura_id_ IN NUMBER) is
begin
  update PV_FACTURA set estado = 'A' where factura_id_ = factura_id;
end ACTIVAR_FACTURA;
/
