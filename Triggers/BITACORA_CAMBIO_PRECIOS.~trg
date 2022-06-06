create or replace noneditionable trigger BITACORA_CAMBIO_PRECIOS
  after insert or update or delete
  on pv_producto 
  for each row
declare
  -- local variables here
begin
  
  
CASE
    WHEN INSERTING THEN

     INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('INSERTO' , USER, SYSDATE, 'PRODUCTO','',
      '-ID producto: '||:NEW.PRODUCTO_ID ||' -Producto: ' ||:NEW.NOMBRE ||' -Precio: ' || :NEW.COSTO);

      
    WHEN UPDATING THEN
     
    IF :OLD.COSTO <> :NEW.COSTO THEN
    
  INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('MODIFICO' , USER, SYSDATE, 'PRODUCTO',
      '-ID producto: '||:OLD.PRODUCTO_ID ||' -Producto: ' ||:OLD.NOMBRE ||' -Precio: ' || :OLD.COSTO,
      '-ID producto: '||:NEW.PRODUCTO_ID ||' -Producto: ' ||:NEW.NOMBRE ||' -Precio: ' || :NEW.COSTO);


  END IF;  
       
    WHEN DELETING THEN

  INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('ELIMINO' , USER, SYSDATE, 'PRODUCTO',
      '-ID producto: '||:OLD.PRODUCTO_ID ||' -Producto: ' ||:OLD.NOMBRE ||' -Precio: ' || :OLD.COSTO,
      '');
       
  END CASE;
  
end BITACORA_CAMBIO_PRECIOS;
/
