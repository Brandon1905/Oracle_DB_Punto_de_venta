create or replace noneditionable procedure MODIFICAR_TIPO_PAGO_DETALLE(tipo_pago_id_        IN NUMBER,
                                                                       pv_factura_id_       IN NUMBER,
                                                                       tipo_pago_           IN VARCHAR2,
                                                                       numero_de_documento_ IN VARCHAR2,
                                                                       monto_               IN FLOAT,
                                                                       estado_              IN VARCHAR2) is
  CONTEO_I  NUMBER;
  CONTEO_ID NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_ID
    FROM PV_TIPO_PAGO_DETALLE B
   WHERE B.TIPO_PAGO_ID = tipo_pago_id_;

  SELECT COUNT(*)
    INTO CONTEO_I
    FROM PV_FACTURA B
   WHERE B.FACTURA_ID = pv_factura_id_;

  IF CONTEO_I > 0 AND CONTEO_ID > 0 THEN
  
    update PV_TIPO_PAGO_DETALLE
       set pv_factura_id       = pv_factura_id_,
           tipo_pago           = tipo_pago_,
           numero_de_documento = numero_de_documento_,
           monto               = monto_,
           estado              = estado_
    
     where tipo_pago_id = tipo_pago_id_;
  
  END IF;

end MODIFICAR_TIPO_PAGO_DETALLE;
/
