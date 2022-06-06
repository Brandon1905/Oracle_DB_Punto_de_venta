create or replace noneditionable procedure INACTIVAR_CUENTAS_POR_COBRAR(cuentas_por_cobrar_id_ IN NUMBER) is
begin
  update PV_CUENTAS_POR_COBRAR
     set estado = 'I'
   where cuentas_por_cobrar_id_ = cuentas_por_cobrar_id;
end INACTIVAR_CUENTAS_POR_COBRAR;
/
