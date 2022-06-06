create or replace noneditionable procedure INSERTAR_DETALLE_TOMA_FISICA(PV_TOMA_FISICA_   IN NUMBER,
                                                                        pv_producto_id_   IN NUMBER,
                                                                        pv_inventario_id_ IN NUMBER,
                                                                        cantidad_         IN NUMBER) is
  CONTEO_I  NUMBER;
  CONTEO_P  NUMBER;
  CONTEO_ID NUMBER;
BEGIN

  SELECT COUNT(*)
    INTO CONTEO_ID
    FROM PV_TOMA_FISICA B
   WHERE B.TOMA_FISICA_ID = PV_TOMA_FISICA_;

  SELECT COUNT(*)
    INTO CONTEO_I
    FROM PV_INVENTARIO B
   WHERE B.INVENTARIO_ID = pv_inventario_id_;

  SELECT COUNT(*)
    INTO CONTEO_P
    FROM PV_PRODUCTO B
   WHERE B.PRODUCTO_ID = pv_producto_id_;

  IF CONTEO_ID > 0 AND CONTEO_I > 0 AND CONTEO_P > 0 THEN
  
    insert into PV_DETALLE_TOMA_FISICA
      (PV_TOMA_FISICA_ID,
       PV_PRODUCTO_ID,
       PV_INVENTARIO_ID,
       CANTIDAD,
       ESTADO)
    values
      (PV_TOMA_FISICA_, pv_producto_id_, pv_inventario_id_, cantidad_, 'A');
  
  END IF;

end INSERTAR_DETALLE_TOMA_FISICA;
/
