create or replace noneditionable procedure INSERTAR_BODEGA(pv_sede_id_ IN NUMBER,
                                                           nombre_     IN VARCHAR2,
                                                           direccion_  IN VARCHAR2) is
  CONTEO_SEDE NUMBER;
begin

  SELECT COUNT(*)
    INTO CONTEO_SEDE
    FROM PV_SEDE S
   WHERE S.SEDE_ID = PV_SEDE_ID_;

  IF CONTEO_SEDE > 0 THEN
  
    INSERT INTO PV_BODEGA
      (PV_SEDE_ID, NOMBRE, DIRECCION, ESTADO)
    VALUES
      (pv_sede_id_, nombre_, direccion_, 'A');
  END IF;

end INSERTAR_BODEGA;
/
