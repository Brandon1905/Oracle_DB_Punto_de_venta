create or replace noneditionable procedure ELIMINAR_TIPO_PAGO_DETALLE(TIPO_PAGO_DETALLE_ID_ NUMBER) is
begin
  DELETE FROM PV_TIPO_PAGO_DETALLE T
   WHERE T.TIPO_PAGO_ID = TIPO_PAGO_DETALLE_ID_;
end;
/