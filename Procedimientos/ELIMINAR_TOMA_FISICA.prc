create or replace noneditionable procedure ELIMINAR_TOMA_FISICA(TOMA_FISICA_ID_ NUMBER) is
begin
  DELETE FROM PV_TOMA_FISICA T WHERE T.TOMA_FISICA_ID = TOMA_FISICA_ID_;
end;
/