create or replace noneditionable procedure MODIFICAR_DECUENTOS(descuentos_id_     IN NUMBER,
                                                               pv_familia_id_     IN NUMBER,
                                                               pv_proveedor_id_   IN NUMBER,
                                                               pv_productos_id_   IN NUMBER,
                                                               pv_inventario_id_  IN NUMBER,
                                                               descuento_         IN FLOAT,
                                                               fecha_ingreso_     IN DATE,
                                                               fecha_vencimiento_ IN DATE,
                                                               estado_            IN VARCHAR2) is
  CONTEO_P  NUMBER;
  CONTEO_I  NUMBER;
  CONTEO_F  NUMBER;
  CONTEO_PR NUMBER;
  CONTEO_ID NUMBER;
begin
  SELECT COUNT(*)
    INTO CONTEO_ID
    FROM PV_DESCUENTOS B
   WHERE B.DESCUENTOS_ID = descuentos_id_;

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

  IF CONTEO_ID > 0 AND CONTEO_P > 0 OR CONTEO_I > 0 OR CONTEO_PR > 0 OR
     CONTEO_F > 0 THEN
  
    update PV_DESCUENTOS
       set pv_familia_id     = pv_familia_id_,
           pv_proveedor_id   = pv_proveedor_id_,
           pv_productos_id   = pv_productos_id_,
           pv_inventario_id  = pv_inventario_id_,
           descuento         = descuento_,
           fecha_ingreso     = fecha_ingreso_,
           fecha_vencimiento = fecha_vencimiento_,
           estado            = estado_
    
     where descuentos_id = descuentos_id_;
  
  END IF;

end MODIFICAR_DECUENTOS;
/
