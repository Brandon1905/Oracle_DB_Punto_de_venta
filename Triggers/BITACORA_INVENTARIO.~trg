create or replace noneditionable trigger BITACORA_INVENTARIO
  after insert or update or delete
  on pv_detalle_inventario 
  for each row
declare
  -- local variables here
begin

CASE  
   WHEN INSERTING THEN
     
  INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('INSERTO' , USER, SYSDATE, 'INVENTARIO','',
      '-ID inventario: ' || :NEW.DETALLE_INVENTARIO_ID || ' -ID producto: ' || :NEW.PV_PRODUCTO_ID || ' -ID inventario: ' || :NEW.PV_INVENTARIO_ID || ' -Cantidad: ' || 
      :NEW.CANTIDAD || ' -Porciento utilidad: ' || :NEW.PORCIENTO_UTILIDAD || ' -Porciento maximo: ' || :NEW.PORCIENTO_MÁXIMO || ' -Estado: ' || :NEW.ESTADO);
      
    WHEN UPDATING THEN
    
  INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('MODIFICO' , USER, SYSDATE, 'INVENTARIO',
      '-ID inventario: ' || :OLD.DETALLE_INVENTARIO_ID || ' -ID producto: ' || :OLD.PV_PRODUCTO_ID || ' -ID inventario: ' || :OLD.PV_INVENTARIO_ID || ' -Cantidad: ' || 
      :OLD.CANTIDAD || ' -Porciento utilidad: ' || :OLD.PORCIENTO_UTILIDAD || ' -Porciento maximo: ' || :OLD.PORCIENTO_MÁXIMO || ' -Estado: ' || :OLD.ESTADO,
        
      '-ID inventario: ' || :NEW.DETALLE_INVENTARIO_ID || ' -ID producto: ' || :NEW.PV_PRODUCTO_ID || ' -ID inventario: ' || :NEW.PV_INVENTARIO_ID || ' -Cantidad: ' || 
      :NEW.CANTIDAD || ' -Porciento utilidad: ' || :NEW.PORCIENTO_UTILIDAD || ' -Porciento maximo: ' || :NEW.PORCIENTO_MÁXIMO || ' -Estado: ' || :NEW.ESTADO);
      
    WHEN DELETING THEN
     
  INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('ELIMINO' , USER, SYSDATE, 'INVENTARIO','-ID inventario: ' || :OLD.DETALLE_INVENTARIO_ID || ' -ID producto: ' || :OLD.PV_PRODUCTO_ID || ' -ID inventario: ' || :OLD.PV_INVENTARIO_ID || ' -Cantidad: ' || 
      :OLD.CANTIDAD || ' -Porciento utilidad: ' || :OLD.PORCIENTO_UTILIDAD || ' -Porciento maximo: ' || :OLD.PORCIENTO_MÁXIMO || ' -Estado: ' || :OLD.ESTADO, '');
      
  END CASE;
  
  
end BITACORA_INVENTARIO;
/
