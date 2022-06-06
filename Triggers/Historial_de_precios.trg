create or replace noneditionable trigger Historial_de_precios
  after update
  on pv_producto
  for each row
declare
  -- local variables here
begin
   IF :OLD.COSTO <> :NEW.COSTO THEN

      INSERT INTO PV_HISTORIAL_PRECIOS_PRODUCTO(PV_PRODUCTO_ID,PRECIO_ANTERIOR,PRECIO_NUEVO,ESTADO,FECHA_CAMBIO)
      VALUES(:NEW.PRODUCTO_ID,:OLD.COSTO,:NEW.COSTO,'A',SYSDATE);

  END IF;

end Historial_de_precios;
--? Cuando ingrese un producto con un precio de costo diferente al actual, es necesario 
--incluir automáticamente este cambio de precio al historial de precios.
/
