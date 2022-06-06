create or replace noneditionable procedure INSERTAR_FACTURA(pv_cliente_id_     IN NUMBER,
                                                            pv_servicio_id_    IN NUMBER,
                                                            pv_proveedor_id_   IN NUMBER,
                                                            fecha_cancelacion_ IN DATE,
                                                            fecha_vencimiento_ IN DATE,
                                                            estado_factura_    IN VARCHAR2,
                                                            tipo_factura_      IN VARCHAR2,
                                                            pv_sede_id_        IN NUMBER,
                                                            pv_USUARIO_id_     IN NUMBER) is
  CONTEO_C    NUMBER;
  CONTEO_S    NUMBER;
  CONTEO_P    NUMBER;
  CONTEO_SED  NUMBER;
  CONTEO_US   NUMBER;
  PREFERENCIA VARCHAR2(15);
begin
  SELECT COUNT(*)
    INTO CONTEO_US
    FROM PV_USUARIOS B
   WHERE B.USUARIOS_ID = pv_USUARIO_id_;

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

  --se puede o no hacer factura cpp o cpc
  if CONTEO_C > 0 THEN
    SELECT b.preferencias
      INTO PREFERENCIA
      FROM PV_CLIENTE B
     WHERE B.CLIENTE_ID = pv_cliente_id_;
  end if;

  if CONTEO_P > 0 THEN
    SELECT B.PREFERENCIAS
      INTO PREFERENCIA
      FROM PV_PROVEEDORES B
     WHERE B.PROVEEDORES_ID = pv_proveedor_id_;
  END IF;

  -- VALIDAD FORANEAS
  IF CONTEO_SED > 0 AND CONTEO_US > 0 AND
     (CONTEO_S > 0 OR CONTEO_P > 0 OR CONTEO_C > 0) THEN
  
    --VALIDAR PREFERENCIAS PARA CUENTAS CPP Y CPC  
    IF PREFERENCIA = 'SI' AND estado_factura_ = 'P' THEN
    
      IF CONTEO_P > 0 AND tipo_factura_ = 'CPP' OR tipo_factura_ = 'cpp' THEN
        insert into PV_FACTURA
          (pv_cliente_id,
           pv_servicio_id,
           pv_proveedor_id,
           fecha,
           total,
           sub_total,
           descuento,
           impuesto,
           fecha_cancelacion,
           fecha_vencimiento,
           estado_factura,
           tipo_factura,
           estado,
           pv_sede_id,
           pv_usuario_id)
        values
          (pv_cliente_id_,
           pv_servicio_id_,
           pv_proveedor_id_,
           SYSDATE,
           0,
           0,
           0,
           0,
           fecha_cancelacion_,
           fecha_vencimiento_,
           estado_factura_,
           tipo_factura_,
           'A',
           pv_sede_id_,
           pv_USUARIO_id_);
      END IF;
    
      IF CONTEO_C > 0 AND tipo_factura_ = 'CPC' OR tipo_factura_ = 'cpc' THEN
        insert into PV_FACTURA
          (pv_cliente_id,
           pv_servicio_id,
           pv_proveedor_id,
           fecha,
           total,
           sub_total,
           descuento,
           impuesto,
           fecha_cancelacion,
           fecha_vencimiento,
           estado_factura,
           tipo_factura,
           estado,
           pv_sede_id,
           pv_usuario_id)
        values
          (pv_cliente_id_,
           pv_servicio_id_,
           pv_proveedor_id_,
           SYSDATE,
           0,
           0,
           0,
           0,
           fecha_cancelacion_,
           fecha_vencimiento_,
           estado_factura_,
           tipo_factura_,
           'A',
           pv_sede_id_,
           pv_USUARIO_id_);
      END IF;
    
    END IF;
  
    IF tipo_factura_ = 'DVL' OR tipo_factura_ = 'dvl' or
       tipo_factura_ = 'fac' OR tipo_factura_ = 'FAC' THEN
    
      insert into PV_FACTURA
        (pv_cliente_id,
         pv_servicio_id,
         pv_proveedor_id,
         fecha,
         total,
         sub_total,
         descuento,
         impuesto,
         fecha_cancelacion,
         fecha_vencimiento,
         estado_factura,
         tipo_factura,
         estado,
         pv_sede_id,
         pv_usuario_id)
      values
        (pv_cliente_id_,
         pv_servicio_id_,
         pv_proveedor_id_,
         SYSDATE,
         0,
         0,
         0,
         0,
         fecha_cancelacion_,
         fecha_vencimiento_,
         estado_factura_,
         tipo_factura_,
         'A',
         pv_sede_id_,
         pv_USUARIO_id_);
    
    END IF;
  END IF;

  IF CONTEO_SED > 0 AND CONTEO_US > 0 AND tipo_factura_ = 'fac' OR
     tipo_factura_ = 'FAC' AND CONTEO_S = 0 and CONTEO_P = 0 and
     CONTEO_C = 0 THEN
    insert into PV_FACTURA
      (pv_cliente_id,
       pv_servicio_id,
       pv_proveedor_id,
       fecha,
       total,
       sub_total,
       descuento,
       impuesto,
       fecha_cancelacion,
       fecha_vencimiento,
       estado_factura,
       tipo_factura,
       estado,
       pv_sede_id,
       pv_usuario_id)
    values
      (pv_cliente_id_,
       pv_servicio_id_,
       pv_proveedor_id_,
       SYSDATE,
       0,
       0,
       0,
       0,
       fecha_cancelacion_,
       fecha_vencimiento_,
       estado_factura_,
       tipo_factura_,
       'A',
       pv_sede_id_,
       pv_USUARIO_id_);
  END IF;

end INSERTAR_FACTURA;
/
