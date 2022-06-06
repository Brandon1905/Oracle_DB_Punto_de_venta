create or replace noneditionable procedure MODIFICAR_DETALLE_ROBO_DA�O(datelle_robo_da�o_id_ IN NUMBER,
                                                                       pv_robo_da�o_id_      IN NUMBER,
                                                                       pv_producto_id_       IN NUMBER,
                                                                       cantidad_             IN NUMBER,
                                                                       valor_                IN NUMBER,
                                                                       estado_               IN VARCHAR2) is
  CONTEO_I  NUMBER;
  CONTEO_ID NUMBER;
  CONTEO_P  NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_ID
    FROM PV_DETALLE_ROBO_DA�O B
   WHERE B.DATELLE_ROBO_DA�O_ID = datelle_robo_da�o_id_;

  SELECT COUNT(*)
    INTO CONTEO_I
    FROM PV_ROBO_DA�O B
   WHERE B.ROBO_DA�O_ID = pv_robo_da�o_id_;

  SELECT COUNT(*)
    INTO CONTEO_P
    FROM PV_PRODUCTO B
   WHERE B.PRODUCTO_ID = pv_producto_id_;

  IF CONTEO_ID > 0 AND CONTEO_I > 0 AND CONTEO_P > 0 THEN
  
    UPDATE PV_DETALLE_ROBO_DA�O
       SET PV_ROBO_DA�O_ID = pv_robo_da�o_id_,
           PV_PRODUCTO_ID  = pv_producto_id_,
           CANTIDAD        = cantidad_,
           VALOR           = valor_,
           ESTADO          = estado_
     WHERE DATELLE_ROBO_DA�O_ID = datelle_robo_da�o_id_;
  
  END IF;

end MODIFICAR_DETALLE_ROBO_DA�O;
/
