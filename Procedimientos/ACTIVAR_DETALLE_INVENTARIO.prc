create or replace noneditionable procedure ACTIVAR_DETALLE_INVENTARIO(detalle_inventario_id_ IN NUMBER) is
begin
  update PV_DETALLE_INVENTARIO
     set estado = 'A'
   where detalle_inventario_id_ = detalle_inventario_id;
end ACTIVAR_DETALLE_INVENTARIO;
/
