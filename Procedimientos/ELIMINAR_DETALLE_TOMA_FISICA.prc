create or replace noneditionable procedure ELIMINAR_DETALLE_TOMA_FISICA(DETALLE_TOMA_FISICA_ID_ NUMBER) is
begin
  DELETE FROM PV_DETALLE_TOMA_FISICA D
   WHERE D.DETALLE_TOMA_FISICA_ID = DETALLE_TOMA_FISICA_ID_;
end;
/