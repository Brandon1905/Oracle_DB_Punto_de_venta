create or replace noneditionable procedure ELIMINAR_ROBO_DA�O(ROBO_DA�O_ID_ NUMBER) is
begin
  DELETE FROM PV_ROBO_DA�O R WHERE R.ROBO_DA�O_ID = ROBO_DA�O_ID_;
end;
/
