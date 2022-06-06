create or replace noneditionable procedure ACTIVAR_INVENTARIO(inventario_id_ IN NUMBER) is
begin
  update PV_INVENTARIO
     set estado = 'A'
   where inventario_id_ = inventario_id;
end ACTIVAR_INVENTARIO;
/
