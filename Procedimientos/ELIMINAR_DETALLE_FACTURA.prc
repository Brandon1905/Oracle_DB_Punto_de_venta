create or replace noneditionable procedure ELIMINAR_DETALLE_FACTURA(DETALLE_FACTURA_ID_ NUMBER) is
begin
  DELETE FROM PV_DETALLE_FACTURA D
   WHERE D.DETALLE_FACTURA_ID = DETALLE_FACTURA_ID_;
end;
/
