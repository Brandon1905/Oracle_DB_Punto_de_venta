create or replace noneditionable procedure INACTIVAR_DETALLE_ROBO_DA�O(datelle_robo_da�o_id_ IN NUMBER) is
begin
  update PV_DETALLE_ROBO_DA�O
     set estado = 'I'
   where datelle_robo_da�o_id_ = datelle_robo_da�o_id;
end INACTIVAR_DETALLE_ROBO_DA�O;
/
