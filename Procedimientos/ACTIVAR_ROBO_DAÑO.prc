create or replace noneditionable procedure ACTIVAR_ROBO_DA�O(robo_da�o_id_ IN NUMBER) is
begin
  update PV_ROBO_DA�O set estado = 'A' where robo_da�o_id_ = robo_da�o_id;
end ACTIVAR_ROBO_DA�O;
/
