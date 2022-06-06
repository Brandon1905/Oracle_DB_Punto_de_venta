create or replace noneditionable procedure ACTIVAR_CODIGO_BARRAS_PRODUCTOS(codigo_barras_producto_id_ IN NUMBER) is
begin
  update PV_CODIGO_BARRAS_PRODUCTOS
     set estado = 'A'
   where codigo_barras_producto_id_ = codigo_barras_producto_id;
end ACTIVAR_CODIGO_BARRAS_PRODUCTOS;
/
