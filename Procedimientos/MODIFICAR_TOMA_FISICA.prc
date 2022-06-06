create or replace noneditionable procedure MODIFICAR_TOMA_FISICA(toma_fisica_id_ IN NUMBER,
                                                                 descripcion_    IN VARCHAR2,
                                                                 fecha_          IN DATE,
                                                                 estado_         IN VARCHAR2) is
  CONTEO_ID NUMBER;
BEGIN

  SELECT COUNT(*)
    INTO CONTEO_ID
    FROM PV_TOMA_FISICA B
   WHERE B.TOMA_FISICA_ID = toma_fisica_id_;

  IF CONTEO_ID > 0 THEN
    update PV_TOMA_FISICA
       set descripcion = descripcion_, fecha = fecha_, estado = estado_
    
     where toma_fisica_id = toma_fisica_id_;
  END IF;
end MODIFICAR_TOMA_FISICA;
/
