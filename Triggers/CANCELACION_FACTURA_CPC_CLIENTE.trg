create or replace noneditionable trigger CANCELACION_FACTURA_CPC_CLIENTE
  after update
  on pv_cuentas_por_cobrar 
  for each row
declare
  -- local variables here
begin
  
  IF(:NEW.MONTO <= 0) THEN

     UPDATE PV_FACTURA
      SET  ESTADO_FACTURA = 'C'
      WHERE :NEW.PV_FACTURA_ID  = FACTURA_ID;
      
END IF;
      
end CANCELACION_FACTURA_CPC_CLIENTE;
-- Cuando una factura sea cancelada totalmente, deberá automáticamente cambiar el 
-- estado de pendiente a cancelada.
/
