create or replace noneditionable trigger FACTURAS_ESTADO_CPC_CPP
  after insert OR update on pv_factura
  for each row
declare
  -- local variables here
begin
  CASE
    WHEN INSERTING THEN
      IF :NEW.TIPO_FACTURA = 'CPC' and :NEW.PV_CLIENTE_ID >= 0 AND
         :NEW.ESTADO_FACTURA = 'P' THEN
      
        INSERT INTO PV_CUENTAS_POR_COBRAR
          (pv_cliente_id,
           pv_factura_id,
           monto_TOTAL,
           fecha_registro,
           fecha_cancelacion,
           fecha_vencimiento,
           estado,
           MONTO)
        VALUES
          (:NEW.PV_CLIENTE_ID,
           :NEW.FACTURA_ID,
           :NEW.TOTAL,
           SYSDATE,
           :NEW.FECHA_CANCELACION,
           :NEW.FECHA_VENCIMIENTO,
           'A',
           :NEW.TOTAL);
      
        UPDATE PV_CLIENTE
           SET CREDITO_ACTUAL = CREDITO_ACTUAL + :NEW.TOTAL
         WHERE CLIENTE_ID = :NEW.PV_CLIENTE_ID;
      
      END IF;
    
      IF :NEW.TIPO_FACTURA = 'CPP' and :NEW.PV_PROVEEDOR_ID >= 0 AND
         :NEW.ESTADO_FACTURA = 'P' THEN
      
        INSERT INTO PV_CUENTAS_POR_PAGAR
          (pv_factura_id,
           PV_PROVEEDOR_ID,
           MONTO,
           fecha_registro,
           fecha_cancelacion,
           fecha_vencimiento,
           estado,
           MONTO_TOTAL)
        VALUES
          (:NEW.FACTURA_ID,
           :NEW.PV_PROVEEDOR_ID,
           :NEW.TOTAL,
           SYSDATE,
           :NEW.FECHA_CANCELACION,
           :NEW.FECHA_VENCIMIENTO,
           'A',
           :NEW.TOTAL);
      
        UPDATE PV_PROVEEDORES
           SET SALDO = SALDO + :NEW.TOTAL
         WHERE PROVEEDORES_ID = :NEW.PV_PROVEEDOR_ID;
      
      END IF;
    
    WHEN UPDATING THEN
    
      IF :OLD.TIPO_FACTURA = 'CPC' and :OLD.PV_CLIENTE_ID >= 0 AND
         :NEW.ESTADO_FACTURA = 'P' THEN
      
        UPDATE PV_CUENTAS_POR_COBRAR
           SET MONTO_TOTAL = :NEW.TOTAL,
               MONTO       = MONTO + (:NEW.TOTAL - :OLD.TOTAL)
         WHERE PV_FACTURA_ID = :OLD.FACTURA_ID;
      
        UPDATE PV_CLIENTE
           SET CREDITO_ACTUAL = CREDITO_ACTUAL + (:NEW.TOTAL - :OLD.TOTAL)
         WHERE CLIENTE_ID = :OLD.PV_CLIENTE_ID;
      
      END IF;
    
      IF :OLD.TIPO_FACTURA = 'CPP' and :OLD.PV_PROVEEDOR_ID >= 0 AND
         :NEW.ESTADO_FACTURA = 'P' THEN
      
        UPDATE PV_CUENTAS_POR_PAGAR
           SET MONTO_TOTAL = :NEW.TOTAL,
               MONTO       = MONTO + (:NEW.TOTAL - :OLD.TOTAL)
         WHERE PV_FACTURA_ID = :OLD.FACTURA_ID;
      
        UPDATE PV_PROVEEDORES
           SET SALDO = SALDO + (:NEW.TOTAL - :OLD.TOTAL)
         WHERE PROVEEDORES_ID = :OLD.PV_PROVEEDOR_ID;
      
      END IF;
    
  END CASE;

end FACTURAS_ESTADO_CPC_CPP;
  --? Cuando se ingrese una factura en estado pendiente de cancelar, aumentar
  --automáticamente el saldo del cliente que debe el cliente y agregar esta factura al
  --detalle, cuentas por cobrar.

  --? La factura a los proveedores también debe de aumentar automáticamente el saldo
  --que se le debe en caso de ser una factura pendiente de pago, cuentas por pagar.
/
