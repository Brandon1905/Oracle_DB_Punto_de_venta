create or replace noneditionable procedure MODIFICAR_INVENTARIO(inventario_id_ IN NUMBER,
                                                                pv_bodega_id_  IN NUMBER,
                                                                descripcion_   IN VARCHAR2,
                                                                fecha_         IN DATE,
                                                                estado_        IN VARCHAR2) is
  CONTEO    NUMBER;
  CONTEO_ID NUMBER;
begin

  SELECT COUNT(*)
    INTO CONTEO_ID
    FROM PV_INVENTARIO B
   WHERE B.INVENTARIO_ID = inventario_id_;

  SELECT COUNT(*)
    INTO CONTEO
    FROM PV_BODEGA B
   WHERE B.BODEGA_ID = pv_bodega_id_;

  IF CONTEO > 0 AND CONTEO_ID > 0 THEN
  
    update PV_INVENTARIO
       set pv_bodega_id = pv_bodega_id_,
           descripcion  = descripcion_,
           fecha        = fecha_,
           estado       = estado_
    
     where inventario_id = inventario_id_;
  
  END IF;

end MODIFICAR_INVENTARIO;
/
