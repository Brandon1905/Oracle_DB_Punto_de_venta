create or replace noneditionable procedure INSERTAR_PAGOS(pv_cuentas_por_pagar_id_ IN NUMBER,
                                                          monto_                   IN FLOAT) is
  CONTEO_A NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_A
    FROM PV_CUENTAS_POR_PAGAR B
   WHERE B.CUENTAS_POR_PAGAR_ID = pv_cuentas_por_pagar_id_;

  IF CONTEO_A > 0 THEN
  
    insert into PV_PAGOS
      (pv_cuentas_por_pagar_id, monto, fecha, estado)
    values
      (pv_cuentas_por_pagar_id_, monto_, SYSDATE, 'A');
  
  END IF;

end INSERTAR_PAGOS;
/
