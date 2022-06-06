create or replace noneditionable procedure INACTIVAR_FACTURA(factura_id_ IN NUMBER) is
begin
  update PV_FACTURA set estado = 'I' where factura_id_ = factura_id;
end INACTIVAR_FACTURA;
/
