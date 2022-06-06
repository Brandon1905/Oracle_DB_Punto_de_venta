create or replace noneditionable procedure ELIMINAR_ROBO_DAÑO(ROBO_DAÑO_ID_ NUMBER) is
begin
  DELETE FROM PV_ROBO_DAÑO R WHERE R.ROBO_DAÑO_ID = ROBO_DAÑO_ID_;
end;
/
