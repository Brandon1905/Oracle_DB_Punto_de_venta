create or replace noneditionable trigger BITACORA_PROMOCIONES
  after insert or update or delete
  on pv_promociones 
  for each row
declare
  -- local variables here
begin
    
CASE
    WHEN INSERTING THEN

     INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('INSERTO' , USER, SYSDATE, 'PV_PROMOCIONES','',
'-ID promociones: ' || :NEW.promociones_id || ' -ID producto: ' || :NEW.pv_producto_id || ' -ID sede: ' || :NEW.pv_sede_id 
|| ' -Cantidad de productos: ' || :NEW.cantidad_productos || ' -Descripcion: ' || :NEW.descripcion 
|| ' -Cantidad de acciones: ' || :NEW.cantidad_acciones || ' -Productos N X 0: ' || :NEW.PRODUCTOS_NN_X_N || ' -Productos 0 X N: ' || :NEW.PRODUCTOS_N_X_NN || ' -Estado: ' || :NEW.estado
|| ' -TIPO: ' || :NEW.TIPO || ' -FECHA LIMITE: ' || :NEW.FECHA_LIMITE_PROMOCION);

      
    WHEN UPDATING THEN

  INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('MODIFICO' , USER, SYSDATE, 'PV_PROMOCIONES',
'-ID promociones: ' || :OLD.promociones_id || ' -ID producto: ' || :OLD.pv_producto_id || ' -ID sede: ' || :OLD.pv_sede_id 
|| ' -Cantidad de productos: ' || :OLD.cantidad_productos || ' -Descripcion: ' || :OLD.descripcion 
|| ' -Cantidad de acciones: ' || :OLD.cantidad_acciones || ' -Productos N X 0: ' || :OLD.PRODUCTOS_NN_X_N || ' -Productos 0 X N: ' || :OLD.PRODUCTOS_N_X_NN || ' -Estado: ' || :OLD.estado
|| ' -TIPO: ' || :OLD.TIPO || ' -FECHA LIMITE: ' || :OLD.FECHA_LIMITE_PROMOCION,
      
'-ID promociones: ' || :NEW.promociones_id || ' -ID producto: ' || :NEW.pv_producto_id || ' -ID sede: ' || :NEW.pv_sede_id 
|| ' -Cantidad de productos: ' || :NEW.cantidad_productos || ' -Descripcion: ' || :NEW.descripcion 
|| ' -Cantidad de acciones: ' || :NEW.cantidad_acciones || ' -Productos N X 0: ' || :NEW.PRODUCTOS_NN_X_N || ' -Productos 0 X N: ' || :NEW.PRODUCTOS_N_X_NN || ' -Estado: ' || :NEW.estado
|| ' -TIPO: ' || :NEW.TIPO || ' -FECHA LIMITE: ' || :NEW.FECHA_LIMITE_PROMOCION); 
       
    WHEN DELETING THEN

  INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('ELIMINO' , USER, SYSDATE, 'PV_PROMOCIONES',
'-ID promociones: ' || :OLD.promociones_id || ' -ID producto: ' || :OLD.pv_producto_id || ' -ID sede: ' || :OLD.pv_sede_id 
|| ' -Cantidad de productos: ' || :OLD.cantidad_productos || ' -Descripcion: ' || :OLD.descripcion 
|| ' -Cantidad de acciones: ' || :OLD.cantidad_acciones || ' -Productos N X 0: ' || :OLD.PRODUCTOS_NN_X_N || ' -Productos 0 X N: ' || :OLD.PRODUCTOS_N_X_NN || ' -Estado: ' || :OLD.estado
|| ' -TIPO: ' || :OLD.TIPO || ' -FECHA LIMITE: ' || :OLD.FECHA_LIMITE_PROMOCION,
      '');
       
  END CASE;
end BITACORA_PROMOCIONES;
/
