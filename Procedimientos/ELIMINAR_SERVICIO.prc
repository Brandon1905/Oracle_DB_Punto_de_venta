create or replace noneditionable procedure ELIMINAR_SERVICIO(SERVICIO_ID_ IN NUMBER) is
begin

  DELETE FROM PV_SERVICIO S WHERE S.SERVICIO_ID = SERVICIO_ID_;

end ELIMINAR_SERVICIO;
/
