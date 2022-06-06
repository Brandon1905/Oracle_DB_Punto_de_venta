create or replace noneditionable procedure INSERTAR_TIPO_PAGO_DETALLE(pv_factura_id_       IN NUMBER,
                                                                      tipo_pago_           IN VARCHAR2,
                                                                      numero_de_documento_ IN VARCHAR2,
                                                                      monto_               IN FLOAT) is
  CONTEO_I NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_I
    FROM PV_FACTURA B
   WHERE B.FACTURA_ID = pv_factura_id_;

  IF CONTEO_I > 0 THEN
  
    insert into PV_TIPO_PAGO_DETALLE
      (pv_factura_id, tipo_pago, numero_de_documento, monto, estado)
    values
      (pv_factura_id_, tipo_pago_, numero_de_documento_, monto_, 'A');
  
  END IF;

end INSERTAR_TIPO_PAGO_DETALLE;
/
