create or replace noneditionable procedure INACTIVAR_ABONOS(abonos_id_ IN NUMBER) is
begin
  update PV_ABONOS set estado = 'I' where abonos_id_ = abonos_id;

end INACTIVAR_ABONOS;
/
