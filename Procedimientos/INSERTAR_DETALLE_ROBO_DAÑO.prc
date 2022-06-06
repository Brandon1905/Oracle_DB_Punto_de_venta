create or replace noneditionable procedure INSERTAR_DETALLE_ROBO_DAÑO(pv_robo_daño_id_ NUMBER,
                                                                      pv_producto_id_  NUMBER,
                                                                      cantidad_        NUMBER) is
  COSTO_PRODUCTO      NUMBER;
  VALOR_              NUMBER;
  SEDE_ID_            NUMBER;
  PORCIENTO_UTILIDAD2 FLOAT;
  CONTEO_I            NUMBER;
  CONTEO_IN           NUMBER;
  CONTEO_P            NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_IN
    FROM PV_DETALLE_INVENTARIO B
   WHERE B.PV_PRODUCTO_ID = pv_producto_id_;

  SELECT COUNT(*)
    INTO CONTEO_I
    FROM PV_ROBO_DAÑO B
   WHERE B.ROBO_DAÑO_ID = pv_robo_daño_id_;

  SELECT COUNT(*)
    INTO CONTEO_P
    FROM PV_PRODUCTO B
   WHERE B.PRODUCTO_ID = pv_producto_id_;

  IF CONTEO_I > 0 AND CONTEO_P > 0 AND CONTEO_IN > 0 THEN
  
    SELECT P.COSTO
      INTO COSTO_PRODUCTO
      FROM PV_PRODUCTO P
     WHERE P.PRODUCTO_ID = pv_producto_id_;
  
    SELECT R.PV_SEDE_ID
      INTO SEDE_ID_
      FROM PV_ROBO_DAÑO R
     WHERE R.ROBO_DAÑO_ID = pv_robo_daño_id_;
  
    SELECT DI.PORCIENTO_UTILIDAD
      INTO PORCIENTO_UTILIDAD2
      FROM PV_DETALLE_INVENTARIO DI
     WHERE DI.PV_PRODUCTO_ID = pv_producto_id_
       AND EXISTS
     ( --:NEW.pv_factura_ID
            SELECT *
              FROM PV_BODEGA B
             WHERE B.PV_SEDE_ID = SEDE_ID_
               AND EXISTS
             (SELECT *
                      FROM PV_INVENTARIO I
                     WHERE I.PV_BODEGA_ID = B.BODEGA_ID
                       AND I.INVENTARIO_ID = DI.PV_INVENTARIO_ID));
  
    COSTO_PRODUCTO := (COSTO_PRODUCTO * (1 + (PORCIENTO_UTILIDAD2 / 100)));
    VALOR_         := COSTO_PRODUCTO * cantidad_;
  
    INSERT INTO PV_DETALLE_ROBO_DAÑO
      (PV_ROBO_DAÑO_ID, PV_PRODUCTO_ID, CANTIDAD, VALOR, ESTADO)
    VALUES
      (pv_robo_daño_id_, pv_producto_id_, cantidad_, VALOR_, 'A');
  
    UPDATE PV_ROBO_DAÑO
       SET TOTAL = TOTAL + VALOR_
     WHERE ROBO_DAÑO_ID = pv_robo_daño_id_;
  
  END IF;

end INSERTAR_DETALLE_ROBO_DAÑO;
/
