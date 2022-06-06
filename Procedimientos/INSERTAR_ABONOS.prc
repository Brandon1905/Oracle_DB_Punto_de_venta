create or replace noneditionable procedure INSERTAR_ABONOS(pv_cuentas_por_cobrar_id_ IN NUMBER,
                                                           monto_                    IN FLOAT) is

  CONTEO_A NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_A
    FROM PV_CUENTAS_POR_COBRAR B
   WHERE B.CUENTAS_POR_COBRAR_ID = pv_cuentas_por_cobrar_id_;

  IF CONTEO_A > 0 THEN
  
    INSERT INTO PV_ABONOS
      (PV_CUENTAS_POR_COBRAR_ID, MONTO, FECHA, ESTADO)
    VALUES
      (pv_cuentas_por_cobrar_id_, monto_, SYSDATE, 'A');
  
  END IF;

end INSERTAR_ABONOS;
/
