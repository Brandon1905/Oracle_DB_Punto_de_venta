create or replace noneditionable procedure INACTIVAR_HISTORIAL_PRECIOS_PRODUCTO(historial_precios_producto_id_ IN NUMBER) is
begin
  update PV_HISTORIAL_PRECIOS_PRODUCTO
     set estado = 'I'
   where historial_precios_producto_id = historial_precios_producto_id_;
end INACTIVAR_HISTORIAL_PRECIOS_PRODUCTO;
/
