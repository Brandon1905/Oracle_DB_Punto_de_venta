create or replace noneditionable procedure ACTIVAR_ABONOS(abonos_id_ IN NUMBER) is
begin
  update PV_ABONOS set estado = 'A' where abonos_id_ = abonos_id;

end ACTIVAR_ABONOS;
/
