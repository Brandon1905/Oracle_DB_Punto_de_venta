create or replace noneditionable trigger ACTUALIZAR_INVENTARIO_X_ROBO_DAÑO
  after insert on pv_detalle_robo_daño
  for each row
declare
  SEDE_ID_ NUMBER;
begin

  SELECT R.PV_SEDE_ID
    INTO SEDE_ID_
    FROM PV_ROBO_DAÑO R
   WHERE R.ROBO_DAÑO_ID = :NEW.PV_ROBO_DAÑO_ID;

  UPDATE PV_DETALLE_INVENTARIO DI
     SET DI.CANTIDAD = DI.CANTIDAD - :NEW.CANTIDAD
   WHERE DI.PV_PRODUCTO_ID = :NEW.PV_PRODUCTO_ID
     AND EXISTS
   (SELECT *
            FROM PV_BODEGA B
           WHERE B.PV_SEDE_ID = SEDE_ID_
             AND EXISTS
           (SELECT *
                    FROM PV_INVENTARIO I
                   WHERE I.PV_BODEGA_ID = B.BODEGA_ID
                     AND I.INVENTARIO_ID = DI.PV_INVENTARIO_ID));

end ACTUALIZAR_INVENTARIO_X_ROBO_DAÑO;
/
