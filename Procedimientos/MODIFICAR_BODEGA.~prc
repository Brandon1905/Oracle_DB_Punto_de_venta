create or replace noneditionable procedure MODIFICAR_BODEGA(BODEGA_ID_  IN NUMBER,
                                                            PV_SEDE_ID_ IN INTEGER,
                                                            NOMBRE_     IN VARCHAR2,
                                                            DIRECCION_  IN VARCHAR2,
                                                            ESTADO_     IN VARCHAR2) is
  CONTEO_SEDE NUMBER;
  CONTEO_ID   NUMBER;
begin

  SELECT COUNT(*)
    INTO CONTEO_ID
    FROM PV_BODEGA S
   WHERE S.BODEGA_ID = BODEGA_ID_;

  SELECT COUNT(*)
    INTO CONTEO_SEDE
    FROM PV_SEDE S
   WHERE S.SEDE_ID = PV_SEDE_ID_;

  IF CONTEO_SEDE > 0 AND CONTEO_ID > 0 THEN
  
    UPDATE PV_BODEGA
       SET PV_SEDE_ID = PV_SEDE_ID_,
           NOMBRE     = NOMBRE_,
           DIRECCION  = DIRECCION_,
           ESTADO     = ESTADO_
    
     WHERE BODEGA_ID = BODEGA_ID_;
  END IF;
end MODIFICAR_BODEGA;
/
