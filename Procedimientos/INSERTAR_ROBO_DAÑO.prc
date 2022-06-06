create or replace noneditionable procedure INSERTAR_ROBO_DAÑO(pv_sede_id_ IN NUMBER,
                                                              tipo_       IN VARCHAR2) is
  CONTEO_I NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_I
    FROM PV_SEDE B
   WHERE B.SEDE_ID = pv_sede_id_;

  IF CONTEO_I > 0 THEN
  
    insert into PV_ROBO_DAÑO
      (pv_sede_id, fecha, tipo, total, estado)
    values
      (pv_sede_id_, SYSDATE, tipo_, 0, 'A');
  
  END IF;

end INSERTAR_ROBO_DAÑO;
/
