create or replace noneditionable procedure ELIMINAR_CPP(CUENTAS_POR_PAGAR_ID_ NUMBER) is
begin
  DELETE FROM PV_CUENTAS_POR_PAGAR C
   WHERE C.CUENTAS_POR_PAGAR_ID = CUENTAS_POR_PAGAR_ID_;
end;
/