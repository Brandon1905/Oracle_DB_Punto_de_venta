create or replace noneditionable procedure ACTIVAR_SEDE(sede_id_ IN NUMBER) is
begin
  update PV_SEDE set estado = 'A' where sede_id_ = sede_id;
end ACTIVAR_SEDE;
/
