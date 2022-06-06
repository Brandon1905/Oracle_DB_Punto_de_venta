create or replace noneditionable trigger ACTUALIZAR_INVENTARIO
  after insert
  on pv_detalle_factura
  for each row
declare
  AUX VARCHAR2(3);
begin


SELECT FF.TIPO_FACTURA INTO AUX
FROM PV_FACTURA FF
WHERE FF.FACTURA_ID = :NEW.PV_FACTURA_ID;
      
      
IF AUX = 'fac' OR AUX = 'cpc' OR  AUX = 'FAC' OR AUX = 'CPC'THEN

UPDATE PV_DETALLE_INVENTARIO 
SET CANTIDAD = CANTIDAD - :NEW.CANTIDAD
WHERE PV_DETALLE_INVENTARIO.PV_PRODUCTO_ID = :NEW.PV_PRODUCTO_ID AND EXISTS (SELECT * FROM PV_FACTURA F   
             WHERE F.FACTURA_ID = :NEW.pv_factura_ID AND EXISTS(  --:NEW.pv_factura_ID
                         SELECT * FROM PV_BODEGA B 
                         WHERE B.PV_SEDE_ID = F.PV_SEDE_ID AND EXISTS( 
                                            SELECT * FROM PV_INVENTARIO I 
                                            WHERE I.PV_BODEGA_ID = B.BODEGA_ID 
                                            AND I.INVENTARIO_ID = PV_DETALLE_INVENTARIO.PV_INVENTARIO_ID ))); --:NEW.PV_INVENTARIO_ID           

  END IF;

IF AUX = 'dvl' OR AUX = 'cpp' OR AUX = 'DVL' OR AUX = 'CPP' THEN

UPDATE PV_DETALLE_INVENTARIO 
SET CANTIDAD = CANTIDAD + :NEW.CANTIDAD
WHERE PV_DETALLE_INVENTARIO.PV_PRODUCTO_ID = :NEW.PV_PRODUCTO_ID AND EXISTS (SELECT * FROM PV_FACTURA F   
             WHERE F.FACTURA_ID = :NEW.pv_factura_ID AND EXISTS(  --:NEW.pv_factura_ID
                         SELECT * FROM PV_BODEGA B 
                         WHERE B.PV_SEDE_ID = F.PV_SEDE_ID AND EXISTS( 
                                            SELECT * FROM PV_INVENTARIO I 
                                            WHERE I.PV_BODEGA_ID = B.BODEGA_ID 
                                            AND I.INVENTARIO_ID = PV_DETALLE_INVENTARIO.PV_INVENTARIO_ID ))); --:NEW.PV_INVENTARIO_ID          

  END IF;

end ACTUALIZAR_INVENTARIO;
--? Cada vez que se realice una factura se deberá modificar automáticamente el
--inventario, aplica para facturas de proveedores y facturas a clientes.
/
