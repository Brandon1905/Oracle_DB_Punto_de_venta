create or replace noneditionable procedure ELIMINAR_FACTURA(FACTURA_ID_ NUMBER) is
begin
  DELETE FROM PV_FACTURA F WHERE F.FACTURA_ID = FACTURA_ID_;
end;
/
