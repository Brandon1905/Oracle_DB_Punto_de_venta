create or replace noneditionable procedure ELIMINAR_ABONOS(ABONOS_ID_ NUMBER) is
begin
  DELETE FROM PV_ABONOS A WHERE A.ABONOS_ID = ABONOS_ID_;
end;
/
