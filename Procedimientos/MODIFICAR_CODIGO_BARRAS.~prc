create or replace noneditionable procedure MODIFICAR_CODIGO_BARRAS(codigo_barras_producto_id_ IN NUMBER,
                                                                   pv_producto_id_            IN NUMBER,
                                                                   codigo_barras_             IN NUMBER,
                                                                   estado_                    IN VARCHAR2) is
  CONTEO_A NUMBER;
  CONTEO_P NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_A
    FROM PV_CUENTAS_POR_COBRAR B
   WHERE B.CUENTAS_POR_COBRAR_ID = codigo_barras_producto_id_;

  SELECT COUNT(*)
    INTO CONTEO_P
    FROM PV_PRODUCTO B
   WHERE B.PRODUCTO_ID = pv_producto_id_;

  IF CONTEO_A > 0 AND CONTEO_P > 0 THEN
  
    update PV_CODIGO_BARRAS_PRODUCTOS
       set pv_producto_id = pv_producto_id_,
           codigo_barras  = codigo_barras_,
           estado         = estado_
    
     where codigo_barras_producto_id = codigo_barras_producto_id_;
  
  END IF;

end MODIFICAR_CODIGO_BARRAS;
/
