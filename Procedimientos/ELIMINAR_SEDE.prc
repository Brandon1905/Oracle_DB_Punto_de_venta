create or replace noneditionable procedure ELIMINAR_SEDE(SEDE_ID_ IN NUMBER) is
begin
  DELETE FROM PV_SEDE S WHERE S.SEDE_ID = SEDE_ID_;
end ELIMINAR_SEDE;
/
