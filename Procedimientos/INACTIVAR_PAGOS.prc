create or replace noneditionable procedure INACTIVAR_PAGOS(pagos_id_ IN NUMBER) is
begin
  update PV_PAGOS set estado = 'I' where pagos_id_ = pagos_id;
end INACTIVAR_PAGOS;
/
