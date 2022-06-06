create or replace noneditionable procedure INACTIVAR_FAMILIA(familia_id_ IN NUMBER) is
begin
  update PV_FAMILIA set estado = 'I' where familia_id = familia_id_;
end INACTIVAR_FAMILIA;
/
