create or replace noneditionable procedure ELIMINAR_HISTORIAL_PRECIOS_PRODUCTO(HISTORIAL_PRECO_PRODUCTOS_ID_ NUMBER) is
begin
  DELETE FROM PV_HISTORIAL_PRECIOS_PRODUCTO H
   WHERE H.HISTORIAL_PRECIOS_PRODUCTO_ID = HISTORIAL_PRECO_PRODUCTOS_ID_;
end;
/