create or replace noneditionable procedure ELIMINAR_PAGOS(PAGOS_ID_ NUMBER) is
begin
  DELETE FROM PV_PAGOS P WHERE P.PAGOS_ID = PAGOS_ID_;
end;
/
