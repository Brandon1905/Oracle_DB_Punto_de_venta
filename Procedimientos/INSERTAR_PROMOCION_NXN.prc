create or replace noneditionable procedure INSERTAR_PROMOCION_NXN(PRODUCTO_ID_      IN NUMBER,
                                                                  DESCRIPCION_      IN VARCHAR2,
                                                                  SEDE_ID           IN NUMBER,
                                                                  PRODUCTOS_NN_X_N_ IN NUMBER,
                                                                  PRODUCTOS_N_X_NN_ IN NUMBER,
                                                                  FECHA_LIMITE      DATE) is
  CONTEO_P NUMBER;
  CONTEO_I NUMBER;
begin

  SELECT COUNT(*)
    INTO CONTEO_P
    FROM PV_PRODUCTO B
   WHERE B.PRODUCTO_ID = PRODUCTO_ID_;

  SELECT COUNT(*) INTO CONTEO_I FROM PV_SEDE B WHERE B.SEDE_ID = SEDE_ID;

  IF CONTEO_P > 0 AND CONTEO_I > 0 THEN
  
    INSERT INTO PV_PROMOCIONES
      (PV_PRODUCTO_ID,
       CANTIDAD_PRODUCTOS,
       ESTADO,
       DESCRIPCION,
       PV_SEDE_ID,
       CANTIDAD_ACCIONES,
       PRODUCTOS_NN_X_N,
       PRODUCTOS_N_X_NN,
       TIPO,
       FECHA_LIMITE_PROMOCION)
    VALUES
      (PRODUCTO_ID_,
       0,
       'A',
       DESCRIPCION_,
       SEDE_ID,
       0,
       PRODUCTOS_NN_X_N_,
       PRODUCTOS_N_X_NN_,
       'NXN',
       FECHA_LIMITE);
  
  END IF;

end INSERTAR_PROMOCION_NXN;
/
