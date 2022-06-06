create or replace noneditionable trigger INYECCION_ABONO_CLIENTE
  after insert
  on pv_abonos
  for each row
declare
  -- local variables here
begin

   UPDATE PV_CUENTAS_POR_COBRAR
      SET  MONTO = MONTO - :NEW.MONTO
      WHERE :NEW.PV_CUENTAS_POR_COBRAR_ID  = CUENTAS_POR_COBRAR_ID;

end INYECCION_ABONO_CLIENTE;
-- Cuando una factura sea cancelada totalmente, deberá automáticamente cambiar el 
-- estado de pendiente a cancelada.
/
