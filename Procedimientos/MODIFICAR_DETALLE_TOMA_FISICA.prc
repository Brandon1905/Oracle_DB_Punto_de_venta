create or replace noneditionable procedure MODIFICAR_DETALLE_TOMA_FISICA(detalle_toma_fisica_id_ IN NUMBER,
                                                                         pv_toma_fisica_id_      IN NUMBER,
                                                                         pv_producto_id_         IN NUMBER,
                                                                         pv_inventario_id_       IN NUMBER,
                                                                         cantidad_               IN NUMBER,
                                                                         estado_                 IN VARCHAR2) is
  CONTEO_I  NUMBER;
  CONTEO_P  NUMBER;
  CONTEO_ID NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_ID
    FROM PV_TOMA_FISICA B
   WHERE B.TOMA_FISICA_ID = pv_toma_fisica_id_;

  SELECT COUNT(*)
    INTO CONTEO_I
    FROM PV_INVENTARIO B
   WHERE B.INVENTARIO_ID = pv_inventario_id_;

  SELECT COUNT(*)
    INTO CONTEO_P
    FROM PV_PRODUCTO B
   WHERE B.PRODUCTO_ID = pv_producto_id_;

  IF CONTEO_ID > 0 AND CONTEO_I > 0 AND CONTEO_P > 0 THEN
  
    update PV_DETALLE_TOMA_FISICA
       set pv_toma_fisica_id = pv_toma_fisica_id_,
           pv_producto_id    = pv_producto_id_,
           pv_inventario_id  = pv_inventario_id_,
           cantidad          = cantidad_,
           estado            = estado_
    
     where detalle_toma_fisica_id = detalle_toma_fisica_id_;
  
  END IF;

end MODIFICAR_DETALLE_TOMA_FISICA;
/
