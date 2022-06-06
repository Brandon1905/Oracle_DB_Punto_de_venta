create or replace noneditionable procedure ELIMINAR_BITACORA(BITACORA_ID_ NUMBER) is
begin
  DELETE FROM PV_BITACORA B WHERE B.BITACORA_ID = BITACORA_ID_;
end;
/
