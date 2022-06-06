create or replace noneditionable procedure MODIFICAR_PAGOS(pagos_id_                IN NUMBER,
                                                           pv_cuentas_por_pagar_id_ IN NUMBER,
                                                           monto_                   IN FLOAT,
                                                           fecha_                   IN DATE,
                                                           estado_                  IN VARCHAR2) is
  CONTEO_A NUMBER;
  CONTEO_P NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_A
    FROM PV_CUENTAS_POR_COBRAR B
   WHERE B.CUENTAS_POR_COBRAR_ID = pv_cuentas_por_pagar_id_;

  SELECT COUNT(*)
    INTO CONTEO_P
    FROM PV_PAGOS B
   WHERE B.PAGOS_ID = pagos_id_;

  IF CONTEO_A > 0 AND CONTEO_P > 0 THEN
  
    update PV_PAGOS
       set pv_cuentas_por_pagar_id = pv_cuentas_por_pagar_id_,
           monto                   = monto_,
           fecha                   = fecha_,
           estado                  = estado_
    
     where pagos_id = pagos_id_;
  
  END IF;

end MODIFICAR_PAGOS;
/
