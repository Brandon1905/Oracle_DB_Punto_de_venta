create or replace noneditionable procedure ACTIVAR_PAGOS(pagos_id_ IN NUMBER) is
begin
  update PV_PAGOS set estado = 'A' where pagos_id_ = pagos_id;
end ACTIVAR_PAGOS;
/
