create or replace noneditionable procedure ELIMINAR_PRODUCTO(PRODUCTO_ID_ NUMBER) is
begin
  DELETE FROM PV_PRODUCTO P WHERE P.PRODUCTO_ID = PRODUCTO_ID_;
end;
/
