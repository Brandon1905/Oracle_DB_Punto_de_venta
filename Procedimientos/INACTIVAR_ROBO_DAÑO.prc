create or replace noneditionable procedure INACTIVAR_ROBO_DAÑO(robo_daño_id_ IN NUMBER) is
begin
  update PV_ROBO_DAÑO set estado = 'I' where robo_daño_id_ = robo_daño_id;
end INACTIVAR_ROBO_DAÑO;
/
