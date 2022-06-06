create or replace noneditionable trigger REDUCCION_SALDO_PROVEEDOR
  after insert
  on PV_PAGOS 
  for each row
declare
  -- local variables here
  ID INTEGER;
begin
       
     SELECT P.PV_PROVEEDOR_ID INTO ID
     FROM PV_CUENTAS_POR_PAGAR P
     WHERE P.CUENTAS_POR_PAGAR_ID = :NEW.PV_CUENTAS_POR_PAGAR_ID;

     UPDATE PV_PROVEEDORES P
     SET  P.SALDO = P.SALDO - :NEW.MONTO
     WHERE P.PROVEEDORES_ID = ID;

end REDUCCION_SALDO_PROVEEDOR;
/
