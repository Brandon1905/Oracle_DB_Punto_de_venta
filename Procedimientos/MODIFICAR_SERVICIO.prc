create or replace noneditionable procedure MODIFICAR_SERVICIO(servicio_id_       number,
                                                              tipo_              VARCHAR2,
                                                              numero_referencia_ NUMBER,
                                                              monto_             FLOAT,
                                                              estado_            varchar2) is
  CONTEO_ID NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_ID
    FROM PV_SERVICIO B
   WHERE B.SERVICIO_ID = servicio_id_;

  IF CONTEO_ID > 0 THEN
    UPDATE PV_SERVICIO
       SET tipo              = tipo_,
           numero_referencia = numero_referencia_,
           monto             = monto_,
           estado            = estado_
     WHERE servicio_id = servicio_id_;
  
  END IF;
end MODIFICAR_SERVICIO;
/
