create or replace noneditionable procedure ACTIVAR_DETALLE_FACTURA(detalle_factura_id_ IN NUMBER) is
begin
  update PV_DETALLE_FACTURA
     set estado = 'A'
   where detalle_factura_id_ = detalle_factura_id;
end ACTIVAR_DETALLE_FACTURA;
/
