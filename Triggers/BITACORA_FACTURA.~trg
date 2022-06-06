create or replace noneditionable trigger BITACORA_FACTURA
  after insert or update or delete
  on pv_factura 
  for each row
declare
  -- local variables here
  --anterior varchar(10000);
      
begin

CASE
    WHEN INSERTING THEN
     
  INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('INSERTO' , USER, SYSDATE, 'FACTURA','','-ID FACTURA: ' || :NEW.FACTURA_ID || ' -ID cliente: ' || :NEW.PV_CLIENTE_ID || ' -ID servicio ' ||  :NEW.PV_SERVICIO_ID
      || ' -ID proveedor: ' ||  :NEW.PV_PROVEEDOR_ID || ' -Fecha de la factura: ' ||  :NEW.FECHA || ' -Total: ' || :NEW.TOTAL || ' -Subtotal: ' || :NEW.SUB_TOTAL || ' -Desceuntos: ' || :NEW.DESCUENTO || ' -Impuestos: ' || :NEW.IMPUESTO
       || ' -ID Usuario: ' ||  :NEW.PV_USUARIO_ID || ' -Fecha de cancelacion: ' || :NEW.FECHA_CANCELACION || ' -Fecha de vencimiento: ' || :NEW.FECHA_VENCIMIENTO || ' -Estado de la factura: ' || :NEW.ESTADO_FACTURA || ' -Tipo de factura: ' || :NEW.TIPO_FACTURA
        || ' -Estado: ' ||  :NEW.ESTADO || ' -ID sede: ' ||  :NEW.PV_SEDE_ID || '-ID USUARIO: ' || :NEW.PV_USUARIO_ID);
      
    WHEN UPDATING THEN
    
  INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('MODIFICO' , USER, SYSDATE, 'FACTURA','-ID FACTURA: ' || :OLD.FACTURA_ID || ' -ID cliente: ' || :OLD.PV_CLIENTE_ID || ' -ID servicio ' ||  :OLD.PV_SERVICIO_ID
      || ' -ID proveedor: ' ||  :OLD.PV_PROVEEDOR_ID || ' -Fecha de la factura: ' ||  :OLD.FECHA || ' -Total: ' || :OLD.TOTAL || ' -Subtotal: ' || :OLD.SUB_TOTAL || ' -Desceuntos: ' || :OLD.DESCUENTO || ' -Impuestos: ' || :OLD.IMPUESTO
       || ' -ID Usuario: ' ||  :OLD.PV_USUARIO_ID || ' -Fecha de cancelacion: ' || :OLD.FECHA_CANCELACION || ' -Fecha de vencimiento: ' || :OLD.FECHA_VENCIMIENTO || ' -Estado de la factura: ' || :OLD.ESTADO_FACTURA || ' -Tipo de factura: ' || :OLD.TIPO_FACTURA
        || ' -Estado: ' ||  :OLD.ESTADO || ' -ID sede: ' ||  :OLD.PV_SEDE_ID || '-ID USUARIO: ' || :OLD.PV_USUARIO_ID,
        
        '-ID FACTURA: ' || :NEW.FACTURA_ID || ' -ID cliente: ' || :NEW.PV_CLIENTE_ID || ' -ID servicio ' ||  :NEW.PV_SERVICIO_ID
      || ' -ID proveedor: ' ||  :NEW.PV_PROVEEDOR_ID || ' -Fecha de la factura: ' ||  :NEW.FECHA || ' -Total: ' || :NEW.TOTAL || ' -Subtotal: ' || :NEW.SUB_TOTAL || ' -Desceuntos: ' || :NEW.DESCUENTO || ' -Impuestos: ' || :NEW.IMPUESTO
       || ' -ID Usuario: ' ||  :NEW.PV_USUARIO_ID || ' -Fecha de cancelacion: ' || :NEW.FECHA_CANCELACION || ' -Fecha de vencimiento: ' || :NEW.FECHA_VENCIMIENTO || ' -Estado de la factura: ' || :NEW.ESTADO_FACTURA || ' -Tipo de factura: ' || :NEW.TIPO_FACTURA
        || ' -Estado: ' ||  :NEW.ESTADO || ' -ID sede: ' ||  :NEW.PV_SEDE_ID || '-ID USUARIO: ' || :NEW.PV_USUARIO_ID);
      
    WHEN DELETING THEN
     
  INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('ELIMINO' , USER, SYSDATE, 'FACTURA','-ID FACTURA: ' || :OLD.FACTURA_ID || ' -ID cliente: ' || :OLD.PV_CLIENTE_ID || ' -ID servicio ' ||  :OLD.PV_SERVICIO_ID
      || ' -ID proveedor: ' ||  :OLD.PV_PROVEEDOR_ID || ' -Fecha de la factura: ' ||  :OLD.FECHA || ' -Total: ' || :OLD.TOTAL || ' -Subtotal: ' || :OLD.SUB_TOTAL || ' -Desceuntos: ' || :OLD.DESCUENTO || ' -Impuestos: ' || :OLD.IMPUESTO
       || ' -ID Usuario: ' ||  :NEW.PV_USUARIO_ID || ' -Fecha de cancelacion: ' || :OLD.FECHA_CANCELACION || ' -Fecha de vencimiento: ' || :OLD.FECHA_VENCIMIENTO || ' -Estado de la factura: ' || :OLD.ESTADO_FACTURA || ' -Tipo de factura: ' || :OLD.TIPO_FACTURA
        || ' -Estado: ' ||  :OLD.ESTADO || ' -ID sede: ' ||  :OLD.PV_SEDE_ID || '-ID USUARIO: ' || :OLD.PV_USUARIO_ID, '');
      
  END CASE;

end BITACORA_FACTURA;
/
