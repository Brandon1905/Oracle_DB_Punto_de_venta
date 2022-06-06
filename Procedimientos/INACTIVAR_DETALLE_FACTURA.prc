create or replace noneditionable procedure INACTIVAR_DETALLE_FACTURA(detalle_factura_id_ IN NUMBER) is
begin
  update PV_DETALLE_FACTURA
     set estado = 'I'
   where detalle_factura_id_ = detalle_factura_id;
end INACTIVAR_DETALLE_FACTURA;
/
