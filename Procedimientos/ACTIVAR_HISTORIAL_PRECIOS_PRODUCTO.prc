create or replace noneditionable procedure ACTIVAR_HISTORIAL_PRECIOS_PRODUCTO(historial_precios_producto_id_ IN NUMBER) is
begin
  update PV_HISTORIAL_PRECIOS_PRODUCTO
     set estado = 'A'
   where historial_precios_producto_id = historial_precios_producto_id_;
end ACTIVAR_HISTORIAL_PRECIOS_PRODUCTO;
/
