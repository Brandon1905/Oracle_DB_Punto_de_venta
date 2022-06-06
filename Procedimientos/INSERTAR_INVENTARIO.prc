create or replace noneditionable procedure INSERTAR_INVENTARIO(pv_bodega_id_ IN NUMBER,
                                                               descripcion_  IN VARCHAR2,
                                                               fecha_        IN DATE) is
  CONTEO NUMBER;
begin

  SELECT COUNT(*)
    INTO CONTEO
    FROM PV_BODEGA B
   WHERE B.BODEGA_ID = pv_bodega_id_;

  IF CONTEO > 0 THEN
  
    insert into PV_INVENTARIO
      (pv_bodega_id, descripcion, fecha, estado)
    values
      (pv_bodega_id_, descripcion_, fecha_, 'A');
  
  END IF;

end INSERTAR_INVENTARIO;
/
