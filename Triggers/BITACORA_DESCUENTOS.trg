create or replace noneditionable trigger BITACORA_DESCUENTOS
  after insert or update or delete
  on pv_descuentos 
  for each row
declare
  -- local variables here
begin 
   
CASE
    WHEN INSERTING THEN

     INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('INSERTO' , USER, SYSDATE, 'PV_DESCUENTOS','',
' -ID descuento: ' || :NEW.descuentos_id || ' -ID familia: ' || :NEW.pv_familia_id || ' -ID proveedor: ' || :NEW.pv_proveedor_id 
|| ' -ID producto: ' || :NEW.pv_productos_id || ' -ID inventario: ' || :NEW.pv_inventario_id || ' -Descuento: ' || :NEW.descuento
|| ' -Fecha de ingreso: ' || :NEW.fecha_ingreso || ' -Fecha de vencimiento: ' || :NEW.fecha_vencimiento || ' -Estado: ' || :NEW.estado);

      
    WHEN UPDATING THEN
    
  INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('MODIFICO' , USER, SYSDATE, 'PV_DESCUENTOS',
' -ID descuento: ' || :OLD.descuentos_id || ' -ID familia: ' || :OLD.pv_familia_id || ' -ID proveedor: ' || :OLD.pv_proveedor_id 
|| ' -ID producto: ' || :OLD.pv_productos_id || ' -ID inventario: ' || :OLD.pv_inventario_id || ' -Descuento: ' || :OLD.descuento
|| ' -Fecha de ingreso: ' || :OLD.fecha_ingreso || ' -Fecha de vencimiento: ' || :OLD.fecha_vencimiento || ' -Estado: ' || :OLD.estado,

' -ID descuento: ' || :NEW.descuentos_id || ' -ID familia: ' || :NEW.pv_familia_id || ' -ID proveedor: ' || :NEW.pv_proveedor_id 
|| ' -ID producto: ' || :NEW.pv_productos_id || ' -ID inventario: ' || :NEW.pv_inventario_id || ' -Descuento: ' || :NEW.descuento
|| ' -Fecha de ingreso: ' || :NEW.fecha_ingreso || ' -Fecha de vencimiento: ' || :NEW.fecha_vencimiento || ' -Estado: ' || :NEW.estado);

    WHEN DELETING THEN

  INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('ELIMINO' , USER, SYSDATE, 'PV_DESCUENTOS',
' -ID descuento: ' || :OLD.descuentos_id || ' -ID familia: ' || :OLD.pv_familia_id || ' -ID proveedor: ' || :OLD.pv_proveedor_id 
|| ' -ID producto: ' || :OLD.pv_productos_id || ' -ID inventario: ' || :OLD.pv_inventario_id || ' -Descuento: ' || :OLD.descuento
|| ' -Fecha de ingreso: ' || :OLD.fecha_ingreso || ' -Fecha de vencimiento: ' || :OLD.fecha_vencimiento || ' -Estado: ' || :OLD.estado,
      '');
       
  END CASE;
  
end BITACORA_DESCUENTOS;
/
