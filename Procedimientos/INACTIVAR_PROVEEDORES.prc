create or replace noneditionable procedure INACTIVAR_PROVEEDORES(proveedores_id_ IN NUMBER) is
begin
  update PV_PROVEEDORES
     set estado = 'I'
   where proveedores_id_ = proveedores_id;
end INACTIVAR_PROVEEDORES;
/
