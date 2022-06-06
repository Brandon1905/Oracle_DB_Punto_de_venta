create or replace noneditionable procedure MODIFICAR_ROBO_DA�O(robo_da�o_id_ IN NUMBER,
                                                               pv_sede_id_   IN NUMBER,
                                                               fecha_        IN DATE,
                                                               tipo_         IN VARCHAR2,
                                                               total_        IN FLOAT,
                                                               estado_       IN VARCHAR2) is
  CONTEO_ID NUMBER;
  CONTEO_I  NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_I
    FROM PV_SEDE B
   WHERE B.SEDE_ID = pv_sede_id_;

  SELECT COUNT(*)
    INTO CONTEO_I
    FROM PV_ROBO_DA�O B
   WHERE B.ROBO_DA�O_ID = robo_da�o_id_;

  IF CONTEO_I > 0 AND CONTEO_ID > 0 THEN
  
    update PV_ROBO_DA�O
       set pv_sede_id = pv_sede_id_,
           fecha      = fecha_,
           tipo       = tipo_,
           total      = total_,
           estado     = estado_
    
     where robo_da�o_id = robo_da�o_id_;
  
  END IF;

end MODIFICAR_ROBO_DA�O;
/
