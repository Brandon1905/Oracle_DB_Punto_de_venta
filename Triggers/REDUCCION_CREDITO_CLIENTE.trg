create or replace noneditionable trigger REDUCCION_CREDITO_CLIENTE
  after insert
  on pv_abonos 
  for each row
declare
  -- local variables here
  ID INTEGER;
begin
       
     SELECT C.PV_CLIENTE_ID INTO ID
     FROM PV_CUENTAS_POR_COBRAR C
     WHERE C.CUENTAS_POR_COBRAR_ID = :NEW.PV_CUENTAS_POR_COBRAR_ID;

     UPDATE pv_cliente
     SET  pv_cliente.credito_actual = pv_cliente.credito_actual - :NEW.MONTO
     WHERE pv_cliente.cliente_id = ID;

end REDUCCION_CREDITO_CLIENTE;
/
