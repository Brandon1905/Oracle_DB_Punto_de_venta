create or replace noneditionable procedure INACTIVAR_SEDE(sede_id_ IN NUMBER) is
begin
  update PV_SEDE set estado = 'I' where sede_id_ = sede_id;
end INACTIVAR_SEDE;
/
