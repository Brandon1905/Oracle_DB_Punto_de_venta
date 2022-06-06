create or replace noneditionable trigger INYECCION_PAGO_PROVEEDOR
  after insert
  on pv_pagos 
  for each row
declare
  -- local variables here
begin
  
     UPDATE PV_CUENTAS_POR_PAGAR P
      SET  P.MONTO = P.MONTO - :NEW.MONTO
      WHERE :NEW.PV_CUENTAS_POR_PAGAR_ID  = P.CUENTAS_POR_PAGAR_ID;

end INYECCION_PAGO_PROVEEDOR;

-- Cuando una factura sea cancelada totalmente, deberá automáticamente cambiar el 
-- estado de pendiente a cancelada.
/
