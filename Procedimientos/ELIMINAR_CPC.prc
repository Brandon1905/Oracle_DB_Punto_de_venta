create or replace noneditionable procedure ELIMINAR_CPC(CUENTAS_POR_COBRAR_ID_ NUMBER) is
begin
  DELETE FROM PV_CUENTAS_POR_COBRAR C
   WHERE C.CUENTAS_POR_COBRAR_ID = CUENTAS_POR_COBRAR_ID_;
end;
/