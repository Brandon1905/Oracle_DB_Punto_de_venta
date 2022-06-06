create or replace noneditionable procedure ACTIVAR_DETALLE_ROBO_DAÑO(datelle_robo_daño_id_ IN NUMBER) is
begin
  update PV_DETALLE_ROBO_DAÑO
     set estado = 'A'
   where datelle_robo_daño_id_ = datelle_robo_daño_id;
end ACTIVAR_DETALLE_ROBO_DAÑO;
/
