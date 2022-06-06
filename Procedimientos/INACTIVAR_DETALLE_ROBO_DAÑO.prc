create or replace noneditionable procedure INACTIVAR_DETALLE_ROBO_DAÑO(datelle_robo_daño_id_ IN NUMBER) is
begin
  update PV_DETALLE_ROBO_DAÑO
     set estado = 'I'
   where datelle_robo_daño_id_ = datelle_robo_daño_id;
end INACTIVAR_DETALLE_ROBO_DAÑO;
/
