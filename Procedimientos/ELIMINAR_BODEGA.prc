create or replace noneditionable procedure ELIMINAR_BODEGA(BODEGA_ID_ NUMBER) is
begin
  DELETE FROM PV_BODEGA B WHERE B.BODEGA_ID = BODEGA_ID_;
end;
/
