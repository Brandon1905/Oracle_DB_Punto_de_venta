create or replace noneditionable procedure ACTIVAR_FAMILIA(familia_id_ IN NUMBER) is
begin
  update PV_FAMILIA set estado = 'A' where familia_id_ = familia_id;
end ACTIVAR_FAMILIA;
/
