create or replace noneditionable procedure ELIMINAR_PROVEEDOR(PROVEEDOR_ID_ IN NUMBER) is
begin
  DELETE FROM PV_PROVEEDORES P WHERE P.PROVEEDORES_ID = PROVEEDOR_ID_;
end ELIMINAR_PROVEEDOR;
/
