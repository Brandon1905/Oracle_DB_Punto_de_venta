create or replace noneditionable procedure INACTIVAR_CUENTAS_POR_PAGAR(cuentas_por_pagar_id_ IN NUMBER) is
begin
  update PV_CUENTAS_POR_PAGAR
     set estado = 'I'
   where cuentas_por_pagar_id_ = cuentas_por_pagar_id;
end INACTIVAR_CUENTAS_POR_PAGAR;
/
