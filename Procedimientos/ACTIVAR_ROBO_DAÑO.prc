create or replace noneditionable procedure ACTIVAR_ROBO_DAÑO(robo_daño_id_ IN NUMBER) is
begin
  update PV_ROBO_DAÑO set estado = 'A' where robo_daño_id_ = robo_daño_id;
end ACTIVAR_ROBO_DAÑO;
/
