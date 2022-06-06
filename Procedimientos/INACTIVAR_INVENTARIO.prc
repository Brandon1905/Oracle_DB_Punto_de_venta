create or replace noneditionable procedure INACTIVAR_INVENTARIO(inventario_id_ IN NUMBER) is
begin
  update PV_INVENTARIO
     set estado = 'I'
   where inventario_id_ = inventario_id;
end INACTIVAR_INVENTARIO;
/
