create or replace noneditionable procedure INSERTAR_CODIGO_BARRAS(pv_producto_id_ IN NUMBER,
                                                                  codigo_barras_  IN NUMBER) is
  CONTEO_A NUMBER;
BEGIN

  SELECT COUNT(*)
    INTO CONTEO_A
    FROM PV_PRODUCTO B
   WHERE B.PRODUCTO_ID = pv_producto_id_;

  IF CONTEO_A > 0 THEN
  
    insert into PV_CODIGO_BARRAS_PRODUCTOS
      (pv_producto_id, codigo_barras, estado)
    values
      (pv_producto_id_, codigo_barras_, 'A');
  
  END IF;

end INSERTAR_CODIGO_BARRAS;
/
