create or replace noneditionable procedure INACTIVAR_TIPO_PAGO(tipo_pago_id_ IN NUMBER) is
begin
  update PV_TIPO_PAGO_DETALLE
     set estado = 'I'
   where tipo_pago_id_ = tipo_pago_id;
end INACTIVAR_TIPO_PAGO;
/
