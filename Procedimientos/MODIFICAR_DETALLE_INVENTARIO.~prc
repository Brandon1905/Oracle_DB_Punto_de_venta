create or replace noneditionable procedure MODIFICAR_DETALLE_INVENTARIO(detalle_inventario_id_ IN NUMBER,
                                                                        pv_producto_id_        IN NUMBER,
                                                                        pv_inventario_id_      IN NUMBER,
                                                                        cantidad_              IN NUMBER,
                                                                        porciento_utilidad_    IN FLOAT,
                                                                        porciento_máximo_      IN FLOAT,
                                                                        estado_                IN VARCHAR2) is
  CONTEO_P  NUMBER;
  CONTEO_I  NUMBER;
  CONTEO_ID NUMBER;
begin

  SELECT COUNT(*)
    INTO CONTEO_ID
    FROM PV_DETALLE_INVENTARIO B
   WHERE B.DETALLE_INVENTARIO_ID = detalle_inventario_id_;

  SELECT COUNT(*)
    INTO CONTEO_P
    FROM PV_PRODUCTO B
   WHERE B.PRODUCTO_ID = pv_producto_id_;

  SELECT COUNT(*)
    INTO CONTEO_I
    FROM PV_INVENTARIO B
   WHERE B.INVENTARIO_ID = pv_inventario_id_;

  IF CONTEO_ID > 0 AND CONTEO_P > 0 AND CONTEO_I > 0 THEN
  
    update PV_DETALLE_INVENTARIO
       set pv_producto_id     = pv_producto_id_,
           pv_inventario_id   = pv_inventario_id_,
           cantidad           = cantidad_,
           porciento_utilidad = porciento_utilidad_,
           porciento_máximo   = porciento_máximo_,
           estado             = estado_
    
     where detalle_inventario_id = detalle_inventario_id_;
  
  END IF;

end MODIFICAR_DETALLE_INVENTARIO;
/
