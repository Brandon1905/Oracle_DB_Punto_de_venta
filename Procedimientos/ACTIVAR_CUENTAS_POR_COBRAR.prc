create or replace noneditionable procedure ACTIVAR_CUENTAS_POR_COBRAR(cuentas_por_cobrar_id_ IN NUMBER) is
begin
  update PV_CUENTAS_POR_COBRAR
     set estado = 'A'
   where cuentas_por_cobrar_id_ = cuentas_por_cobrar_id;
end ACTIVAR_CUENTAS_POR_COBRAR;
/
