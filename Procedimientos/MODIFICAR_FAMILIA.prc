create or replace noneditionable procedure MODIFICAR_FAMILIA(familia_id_  IN NUMBER,
                                                             tipo_        IN VARCHAR2,
                                                             descripcion_ IN VARCHAR2,
                                                             estado_      IN VARCHAR2) is

  CONTEO_ID NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_ID
    FROM PV_FAMILIA B
   WHERE B.FAMILIA_ID = familia_id_;

  IF CONTEO_ID > 0 THEN
  
    UPDATE PV_FAMILIA
       SET tipo = tipo_, descripcion = descripcion_, estado = estado_
    
     WHERE familia_id = familia_id_;
  
  END IF;

end MODIFICAR_FAMILIA;
/
