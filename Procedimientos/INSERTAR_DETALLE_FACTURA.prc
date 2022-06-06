create or replace noneditionable procedure INSERTAR_DETALLE_FACTURA(PV_PRODICTO_ID_ IN INTEGER,
                                                                    PV_FACTURA_ID_  IN INTEGER,
                                                                    CANTIDAD_       IN INTEGER) is
  PRECIO_VENTA2       FLOAT;
  IMPUESTOS2          FLOAT;
  IMPUESTOS           FLOAT;
  PORCIENTO_UTILIDAD2 FLOAT;
  DESCUENTOS          FLOAT;
  FAMILIA_ID          FLOAT;
  PORVEEDOR_ID        FLOAT;
  PRODUCUTO_ID        FLOAT;
  CLIENTE             NUMBER;
  PROVEEDOR           NUMBER;
  CREDITO_ACTUAL_     FLOAT;
  CREDITO_MAX_        FLOAT;
  ESTADO              VARCHAR2(100);
  TIPO                VARCHAR2(100);
  PRODUCTOS_ACCIONES  INTEGER;
  SEDE                NUMBER;
  ACCIONES_           INTEGER;
  CANTIDAD_PRODUC     INTEGER;
  NN_XN               INTEGER;
  NX_NN               INTEGER;
  CONTEO              INTEGER;
  FAC                 INTEGER;
  CONTEO_P            NUMBER;
  CONTEO_F            NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_F
    FROM PV_FACTURA B
   WHERE B.FACTURA_ID = PV_FACTURA_ID_;

  SELECT COUNT(*)
    INTO CONTEO_P
    FROM PV_PRODUCTO B
   WHERE B.PRODUCTO_ID = PV_PRODICTO_ID_;

  IF CONTEO_F > 0 AND CONTEO_P > 0 THEN
  
    SELECT COUNT(*)
      INTO FAC
      FROM PV_FACTURA FA
     WHERE FA.FACTURA_ID = PV_FACTURA_ID_;
  
    IF FAC > 0 THEN
    
      -- PARA SABER SI LLEGO AL LIMITE
      SELECT FA.PV_CLIENTE_ID,
             FA.PV_PROVEEDOR_ID,
             FA.ESTADO_FACTURA,
             FA.TIPO_FACTURA,
             FA.PV_SEDE_ID
        INTO CLIENTE, PROVEEDOR, ESTADO, TIPO, SEDE
        FROM PV_FACTURA FA
       WHERE FA.FACTURA_ID = PV_FACTURA_ID_;
    
      IF CLIENTE > 0 THEN
        SELECT C.CREDITO_ACTUAL, C.CREDITO_MAX
          INTO CREDITO_ACTUAL_, CREDITO_MAX_
          FROM PV_CLIENTE C
         WHERE C.CLIENTE_ID = CLIENTE;
      END IF;
    
      IF PROVEEDOR > 0 THEN
        SELECT P.LIMITE_DE_CREDITO, P.SALDO
          INTO CREDITO_MAX_, CREDITO_ACTUAL_
          FROM PV_PROVEEDORES P
         WHERE P.PROVEEDORES_ID = PROVEEDOR;
      END IF;
    
      SELECT PP.PRECIO_VENTA,
             PP.IMPUESTOS,
             PP.PRODUCTO_ID,
             PP.PV_PROVEEDOR_ID,
             PP.PV_FAMILIA_ID
        INTO PRECIO_VENTA2,
             IMPUESTOS,
             PRODUCUTO_ID,
             PORVEEDOR_ID,
             FAMILIA_ID
        FROM PV_PRODUCTO PP
       WHERE PP.PRODUCTO_ID = PV_PRODICTO_ID_;
    
      SELECT DI.PORCIENTO_UTILIDAD
        INTO PORCIENTO_UTILIDAD2
        FROM PV_DETALLE_INVENTARIO DI
       WHERE DI.PV_PRODUCTO_ID = PV_PRODICTO_ID_
         AND EXISTS
       (SELECT *
                FROM PV_FACTURA F
               WHERE F.FACTURA_ID = PV_FACTURA_ID_
                 AND EXISTS
               ( --:NEW.pv_factura_ID
                      SELECT *
                        FROM PV_BODEGA B
                       WHERE B.PV_SEDE_ID = F.PV_SEDE_ID
                         AND EXISTS
                       (SELECT *
                                FROM PV_INVENTARIO I
                               WHERE I.PV_BODEGA_ID = B.BODEGA_ID
                                 AND I.INVENTARIO_ID = DI.PV_INVENTARIO_ID))); --:NEW.PV_INVENTARIO_ID          
    
      -- ACCIONES
      CONTEO := 0;
      SELECT COUNT(*)
        INTO CONTEO
        FROM PV_PROMOCIONES P
       WHERE P.PV_PRODUCTO_ID = PV_PRODICTO_ID_
         AND P.PV_SEDE_ID = SEDE
         AND P.TIPO = 'AC'
         AND P.FECHA_LIMITE_PROMOCION >= SYSDATE
         AND P.ESTADO = 'A';
    
      IF CONTEO > 0 THEN
      
        SELECT P.CANTIDAD_PRODUCTOS, P.CANTIDAD_ACCIONES
          INTO PRODUCTOS_ACCIONES, ACCIONES_
          FROM PV_PROMOCIONES P
         WHERE P.PV_PRODUCTO_ID = PV_PRODICTO_ID_
           AND P.PV_SEDE_ID = SEDE
           AND P.TIPO = 'AC'
           AND P.FECHA_LIMITE_PROMOCION >= SYSDATE
           AND P.ESTADO = 'A';
      
        IF CANTIDAD_ > PRODUCTOS_ACCIONES AND PRODUCTOS_ACCIONES >= 1 THEN
        
          ACCIONES_ := ACCIONES_ *
                       CANTIDAD_ACCIONES(CANTIDAD_, PRODUCTOS_ACCIONES);
        
          UPDATE PV_CLIENTE P
             SET ACCIONES = ACCIONES + ACCIONES_
           WHERE CLIENTE_ID = CLIENTE;
        
        END IF;
      
      END IF;
    
      CANTIDAD_PRODUC := CANTIDAD_;
    
      -- 2X1 NXN
      CONTEO := 0;
      SELECT COUNT(*)
        INTO CONTEO
        FROM PV_PROMOCIONES P
       WHERE P.PV_PRODUCTO_ID = PV_PRODICTO_ID_
         AND P.PV_SEDE_ID = SEDE
         AND P.TIPO = 'NXN'
         AND P.FECHA_LIMITE_PROMOCION >= SYSDATE
         AND P.ESTADO = 'A';
    
      IF CONTEO > 0 THEN
      
        SELECT P.PRODUCTOS_NN_X_N, P.PRODUCTOS_N_X_NN
          INTO NN_XN, NX_NN
          FROM PV_PROMOCIONES P
         WHERE P.PV_PRODUCTO_ID = PV_PRODICTO_ID_
           AND P.PV_SEDE_ID = SEDE
           AND P.TIPO = 'NXN'
           AND P.FECHA_LIMITE_PROMOCION >= SYSDATE
           AND P.ESTADO = 'A';
      
        IF NN_XN > 1 AND NN_XN > NX_NN AND NX_NN > 0 THEN
        
          CANTIDAD_PRODUC := CALCULO_NXN(NN_XN, NX_NN, CANTIDAD_);
        
        END IF;
      
      END IF;
    
      -- DESCUENTOS 
      SELECT COUNT(*)
        INTO DESCUENTOS
        FROM PV_DESCUENTOS D
       WHERE PRODUCUTO_ID = D.PV_PRODUCTOS_ID
          OR FAMILIA_ID = D.PV_FAMILIA_ID
          OR PORVEEDOR_ID = D.PV_PROVEEDOR_ID
         AND D.FECHA_VENCIMIENTO >= SYSDATE;
    
      IF DESCUENTOS >= 1 THEN
        DESCUENTOS := DESCUENTO(PRODUCUTO_ID, FAMILIA_ID, PORVEEDOR_ID);
      END IF;
    
      IF DESCUENTOS < 1 THEN
        DESCUENTOS := 0;
      END IF;
    
      PRECIO_VENTA2 := (PRECIO_VENTA2 * (1 + (PORCIENTO_UTILIDAD2 / 100)));
      DESCUENTOS    := PRECIO_VENTA2 -
                       (PRECIO_VENTA2 * (1 - (DESCUENTOS / 100)));
      IMPUESTOS2    := (PRECIO_VENTA2 - DESCUENTOS) -
                       ((PRECIO_VENTA2 - DESCUENTOS) *
                       (1 - (IMPUESTOS / 100)));
    
      --PRECIO_VENTA2 :=1000; 
      --IMPUESTOS2 := 1;
    
      --DETALLE
      IF TIPO = 'FAC' OR TIPO = 'DVL' OR TIPO = 'fac' OR
         TIPO = 'dvl' AND ESTADO = 'C' THEN
      
        INSERT INTO PV_DETALLE_FACTURA
          (PV_PRODUCTO_ID,
           PV_FACTURA_ID,
           PRECIO,
           IMPUESTO,
           DESCUENTO,
           CANTIDAD,
           ESTADO)
        VALUES
          (PV_PRODICTO_ID_,
           PV_FACTURA_ID_,
           ((PRECIO_VENTA2 - DESCUENTOS) + IMPUESTOS2) * CANTIDAD_PRODUC,
           IMPUESTOS2 * CANTIDAD_PRODUC,
           DESCUENTOS * CANTIDAD_PRODUC,
           CANTIDAD_,
           'A');
      
      END IF;
    
      --SE INSERTA SOLO SI EL CLIENTE CUMPLE CON EL CREDITO NECESARIO
      IF (PRECIO_VENTA2 * CANTIDAD_PRODUC) <=
         (CREDITO_MAX_ - CREDITO_ACTUAL_) AND ESTADO = 'P' AND
         (TIPO = 'CPC' OR TIPO = 'CPP') THEN
      
        INSERT INTO PV_DETALLE_FACTURA
          (PV_PRODUCTO_ID,
           PV_FACTURA_ID,
           PRECIO,
           IMPUESTO,
           DESCUENTO,
           CANTIDAD,
           ESTADO)
        VALUES
          (PV_PRODICTO_ID_,
           PV_FACTURA_ID_,
           ((PRECIO_VENTA2 - DESCUENTOS) + IMPUESTOS2) * CANTIDAD_PRODUC,
           IMPUESTOS2 * CANTIDAD_PRODUC,
           DESCUENTOS * CANTIDAD_PRODUC,
           CANTIDAD_,
           'A');
      
      END IF;
    
    END IF;
  
  END IF;
end INSERTAR_DETALLE_FACTURA;
/
