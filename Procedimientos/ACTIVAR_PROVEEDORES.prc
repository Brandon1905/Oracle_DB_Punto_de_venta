create or replace noneditionable procedure ACTIVAR_PROVEEDORES(proveedores_id_ IN NUMBER) is
begin
  update PV_PROVEEDORES
     set estado = 'A'
   where proveedores_id_ = proveedores_id;
end ACTIVAR_PROVEEDORES;
/
