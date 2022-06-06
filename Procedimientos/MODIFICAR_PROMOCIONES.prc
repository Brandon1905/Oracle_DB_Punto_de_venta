create or replace noneditionable procedure MODIFICAR_PROMOCIONES(promociones_id_     IN NUMBER,
                                                  pv_producto_id_     IN NUMBER,
                                                  cantidad_productos_ IN NUMBER,
                                                  estado_             IN VARCHAR2,
                                                  descripcion_        IN VARCHAR2,
                                                  pv_sede_id_         IN NUMBER,
                                                  cantidad_acciones_  IN NUMBER,
                                                  productos_nn_x_n_        IN NUMBER,
                                                  productos_n_x_nn_      IN NUMBER) is
  CONTEO_P NUMBER;
  CONTEO_I NUMBER;
  CONTEO_ID NUMBER;
begin

  SELECT COUNT(*)
    INTO CONTEO_ID
    FROM PV_PROMOCIONES B
   WHERE B.PROMOCIONES_ID = promociones_id_;
   
  SELECT COUNT(*)
    INTO CONTEO_P
    FROM PV_PRODUCTO B
   WHERE B.PRODUCTO_ID = pv_producto_id_;
   
SELECT COUNT(*)
    INTO CONTEO_I
    FROM PV_SEDE B
   WHERE B.SEDE_ID = pv_sede_id_;
   
  IF CONTEO_P > 0 AND CONTEO_I > 0 AND CONTEO_ID > 0THEN
  
  update PV_PROMOCIONES
     set pv_producto_id     = pv_producto_id_,
         cantidad_productos = cantidad_productos_,
         estado             = estado_,
         descripcion        = descripcion_,
         pv_sede_id         = pv_sede_id_,
         cantidad_acciones  = cantidad_acciones_,
         productos_nn_x_n        = productos_nn_x_n_,
         productos_n_x_nn      = productos_n_x_nn_
  
   where promociones_id = promociones_id_;

END IF;

end MODIFICAR_PROMOCIONES;
/
