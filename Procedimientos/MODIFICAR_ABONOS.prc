create or replace noneditionable procedure MODIFICAR_ABONOS(ABONOS_ID_                IN NUMBER,
                                                            PV_CUENTAS_POR_COBRAR_ID_ IN NUMBER,
                                                            MONTO_                    IN FLOAT,
                                                            FECHA_                    IN DATE,
                                                            ESTADO_                   IN VARCHAR2) is
  CONTEO_A NUMBER;
  CONTEO_C NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_A
    FROM PV_ABONOS B
   WHERE B.ABONOS_ID = ABONOS_ID_;

  SELECT COUNT(*)
    INTO CONTEO_C
    FROM PV_CUENTAS_POR_COBRAR B
   WHERE B.CUENTAS_POR_COBRAR_ID = pv_cuentas_por_cobrar_id_;
  IF CONTEO_A > 0 AND CONTEO_C > 0 THEN
  
    UPDATE PV_ABONOS
       SET PV_CUENTAS_POR_COBRAR_ID = PV_CUENTAS_POR_COBRAR_ID_,
           MONTO                    = MONTO_,
           FECHA                    = FECHA_,
           ESTADO                   = ESTADO_
    
     WHERE ABONOS_ID = ABONOS_ID_;
  
  END IF;

end MODIFICAR_ABONOS;
/
