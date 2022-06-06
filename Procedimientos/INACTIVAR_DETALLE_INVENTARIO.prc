create or replace noneditionable procedure INACTIVAR_DETALLE_INVENTARIO(detalle_inventario_id_ IN NUMBER) is
begin
  update PV_DETALLE_INVENTARIO
     set estado = 'I'
   where detalle_inventario_id_ = detalle_inventario_id;
end INACTIVAR_DETALLE_INVENTARIO;
/
