create or replace noneditionable procedure MODIFICAR_FACTURA(factura_id_        IN NUMBER,
                                                             pv_cliente_id_     IN NUMBER,
                                                             pv_servicio_id_    IN NUMBER,
                                                             pv_proveedor_id_   IN NUMBER,
                                                             fecha_             IN DATE,
                                                             total_             IN FLOAT,
                                                             sub_total_         IN FLOAT,
                                                             descuento_         IN FLOAT,
                                                             impuesto_          IN FLOAT,
                                                             fecha_cancelacion_ IN DATE,
                                                             fecha_vencimiento_ IN DATE,
                                                             estado_factura_    IN VARCHAR2,
                                                             tipo_factura_      IN VARCHAR2,
                                                             estado_            IN VARCHAR2,
                                                             pv_sede_id_        IN NUMBER) is
  CONTEO_C   NUMBER;
  CONTEO_S   NUMBER;
  CONTEO_P   NUMBER;
  CONTEO_SED NUMBER;
  CONTEO_ID  NUMBER;
begin
  SELECT COUNT(*)
    INTO CONTEO_ID
    FROM PV_FACTURA B
   WHERE B.FACTURA_ID = factura_id_;

  SELECT COUNT(*)
    INTO CONTEO_C
    FROM PV_CLIENTE B
   WHERE B.CLIENTE_ID = pv_cliente_id_;

  SELECT COUNT(*)
    INTO CONTEO_S
    FROM PV_SERVICIO B
   WHERE B.SERVICIO_ID = pv_servicio_id_;

  SELECT COUNT(*)
    INTO CONTEO_P
    FROM PV_PROVEEDORES B
   WHERE B.PROVEEDORES_ID = pv_proveedor_id_;

  SELECT COUNT(*)
    INTO CONTEO_SED
    FROM PV_SEDE B
   WHERE B.SEDE_ID = pv_sede_id_;

  IF CONTEO_ID > 0 AND CONTEO_SED > 0 AND
     (CONTEO_S > 0 OR CONTEO_P > 0 OR CONTEO_C > 0) THEN
  
    update PV_FACTURA
       set pv_cliente_id     = pv_cliente_id_,
           pv_servicio_id    = pv_servicio_id_,
           pv_proveedor_id   = pv_proveedor_id_,
           fecha             = fecha_,
           total             = total_,
           sub_total         = sub_total_,
           descuento         = descuento_,
           impuesto          = impuesto_,
           fecha_cancelacion = fecha_cancelacion_,
           fecha_vencimiento = fecha_vencimiento_,
           estado_factura    = estado_factura_,
           tipo_factura      = tipo_factura_,
           estado            = estado_,
           pv_sede_id        = pv_sede_id_,
           pv_usuario_id     = USER
    
     where factura_id = factura_id_;
  
  END IF;

end MODIFICAR_FACTURA;
/
