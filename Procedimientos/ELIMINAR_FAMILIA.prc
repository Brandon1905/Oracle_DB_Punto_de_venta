create or replace noneditionable procedure ELIMINAR_FAMILIA(FAMILIA_ID_ IN NUMBER) is
begin

  DELETE FROM PV_FAMILIA F WHERE F.FAMILIA_ID = FAMILIA_ID_;

end ELIMINAR_FAMILIA;
/
