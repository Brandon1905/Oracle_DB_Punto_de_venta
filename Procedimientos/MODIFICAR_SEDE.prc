create or replace noneditionable procedure MODIFICAR_SEDE(SEDE_ID_      NUMBER,
                                                          nombre_local_ IN VARCHAR2,
                                                          direccion_    IN VARCHAR2,
                                                          codigo_       IN VARCHAR2,
                                                          descripcion_  IN VARCHAR2,
                                                          ESTADO_       VARCHAR2) is
  CONTEO_ID NUMBER;
BEGIN
  SELECT COUNT(*) INTO CONTEO_ID FROM PV_SEDE B WHERE B.SEDE_ID = SEDE_ID_;

  IF CONTEO_ID > 0 THEN
  
    UPDATE PV_SEDE
       SET nombre_local = nombre_local_,
           direccion    = direccion_,
           codigo       = codigo_,
           descripcion  = descripcion_,
           ESTADO       = ESTADO_
    
     WHERE SEDE_ID = SEDE_ID_;
  
  END IF;

end MODIFICAR_SEDE;
/
