create or replace noneditionable procedure INSERTAR_DETALLE_INVENTARIO(pv_producto_id_     IN NUMBER,
                                                                       pv_inventario_id_   IN NUMBER,
                                                                       cantidad_           IN NUMBER,
                                                                       porciento_utilidad_ IN FLOAT,
                                                                       porciento_máximo_   IN FLOAT) is
  CONTEO_P NUMBER;
  CONTEO_I NUMBER;
begin

  SELECT COUNT(*)
    INTO CONTEO_P
    FROM PV_PRODUCTO B
   WHERE B.PRODUCTO_ID = pv_producto_id_;

  SELECT COUNT(*)
    INTO CONTEO_I
    FROM PV_INVENTARIO B
   WHERE B.INVENTARIO_ID = pv_inventario_id_;

  IF CONTEO_P > 0 AND CONTEO_I > 0 THEN
  
    insert into PV_DETALLE_INVENTARIO
      (pv_producto_id,
       pv_inventario_id,
       cantidad,
       porciento_utilidad,
       porciento_máximo,
       estado)
    values
      (pv_producto_id_,
       pv_inventario_id_,
       cantidad_,
       porciento_utilidad_,
       porciento_máximo_,
       'A');
  
  END IF;

end INSERTAR_DETALLE_INVENTARIO;
/
