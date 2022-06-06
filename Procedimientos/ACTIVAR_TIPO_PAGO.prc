create or replace noneditionable procedure ACTIVAR_TIPO_PAGO(tipo_pago_id_ IN NUMBER) is
begin
  update PV_TIPO_PAGO_DETALLE
     set estado = 'A'
   where tipo_pago_id_ = tipo_pago_id;
end ACTIVAR_TIPO_PAGO;
/
