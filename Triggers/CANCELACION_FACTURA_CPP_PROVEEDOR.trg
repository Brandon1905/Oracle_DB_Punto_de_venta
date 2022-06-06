create or replace noneditionable trigger CANCELACION_FACTURA_CPP_PROVEEDOR
  after update
  on Pv_Cuentas_Por_Pagar
  for each row
declare
  -- local variables here
begin
  
  IF(:NEW.MONTO <= 0) THEN

     UPDATE PV_FACTURA F
      SET  F.ESTADO_FACTURA = 'C'
      WHERE :NEW.PV_FACTURA_ID  = F.FACTURA_ID;
      
END IF;
      
end CANCELACION_FACTURA_CPP_PROVEEDOR;
-- Cuando una factura sea cancelada totalmente, deberá automáticamente cambiar el 
-- estado de pendiente a cancelada.
/
