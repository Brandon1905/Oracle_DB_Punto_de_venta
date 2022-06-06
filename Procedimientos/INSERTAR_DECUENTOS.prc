create or replace noneditionable procedure INSERTAR_DECUENTOS(pv_familia_id_     IN NUMBER,
                                                              pv_proveedor_id_   IN NUMBER,
                                                              pv_productos_id_   IN NUMBER,
                                                              pv_inventario_id_  IN NUMBER,
                                                              descuento_         IN FLOAT,
                                                              fecha_ingreso_     IN DATE,
                                                              fecha_vencimiento_ IN DATE) is
  CONTEO_P  NUMBER;
  CONTEO_I  NUMBER;
  CONTEO_F  NUMBER;
  CONTEO_PR NUMBER;
begin

  SELECT COUNT(*)
    INTO CONTEO_P
    FROM PV_PRODUCTO B
   WHERE B.PRODUCTO_ID = pv_productos_id_;

  SELECT COUNT(*)
    INTO CONTEO_F
    FROM PV_FAMILIA B
   WHERE B.FAMILIA_ID = pv_familia_id_;

  SELECT COUNT(*)
    INTO CONTEO_PR
    FROM PV_PROVEEDORES B
   WHERE B.PROVEEDORES_ID = pv_proveedor_id_;

  SELECT COUNT(*)
    INTO CONTEO_I
    FROM PV_INVENTARIO B
   WHERE B.INVENTARIO_ID = pv_inventario_id_;

  IF CONTEO_P > 0 OR CONTEO_I > 0 OR CONTEO_PR > 0 OR CONTEO_F > 0 THEN
  
    insert into PV_DESCUENTOS
      (pv_familia_id,
       pv_proveedor_id,
       pv_productos_id,
       pv_inventario_id,
       descuento,
       fecha_ingreso,
       fecha_vencimiento,
       estado)
    values
      (pv_familia_id_,
       pv_proveedor_id_,
       pv_productos_id_,
       pv_inventario_id_,
       descuento_,
       fecha_ingreso_,
       fecha_vencimiento_,
       'A');
  
  END IF;

end INSERTAR_DECUENTOS;
/
