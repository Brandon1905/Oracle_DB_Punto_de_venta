create or replace noneditionable procedure ACTIVAR_CUENTAS_POR_PAGAR(cuentas_por_pagar_id_ IN NUMBER) is
begin
  update PV_CUENTAS_POR_PAGAR
     set estado = 'A'
   where cuentas_por_pagar_id_ = cuentas_por_pagar_id;
end ACTIVAR_CUENTAS_POR_PAGAR;
/
