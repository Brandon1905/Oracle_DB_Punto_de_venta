create or replace noneditionable procedure INACTIVAR_ROBO_DA�O(robo_da�o_id_ IN NUMBER) is
begin
  update PV_ROBO_DA�O set estado = 'I' where robo_da�o_id_ = robo_da�o_id;
end INACTIVAR_ROBO_DA�O;
/
