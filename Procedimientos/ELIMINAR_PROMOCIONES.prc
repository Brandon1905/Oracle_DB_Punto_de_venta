create or replace noneditionable procedure ELIMINAR_PROMOCIONES(PROMOCIONES_ID_ NUMBER) is
begin
  DELETE FROM PV_PROMOCIONES P WHERE P.PROMOCIONES_ID = PROMOCIONES_ID_;
end;
/