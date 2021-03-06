create or replace noneditionable procedure MODIFICAR_PROVEEDOR(proveedor_id_                         number,
                                                               limite_de_credito_                    FLOAT,
                                                               nombre_empresa_                       VARCHAR2,
                                                               cedula_juridica_                      NUMBER,
                                                               preferencias_                         VARCHAR2,
                                                               direccion_                            VARCHAR2,
                                                               telefono_                             NUMBER,
                                                               fax_                                  VARCHAR2,
                                                               email_                                VARCHAR2,
                                                               saldo_                                FLOAT,
                                                               fecha_ingreso_empresa_como_proveedor_ DATE,
                                                               cuenta_bancaria_                      NUMBER,
                                                               estado_                               varchar2) is
  CONTEO_ID NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_ID
    FROM PV_PROVEEDORES B
   WHERE B.PROVEEDORES_ID = proveedor_id_;

  IF CONTEO_ID > 0 THEN
  
    UPDATE PV_PROVEEDORES
       SET LIMITE_DE_CREDITO                    = LIMITE_DE_CREDITO_,
           NOMBRE_EMPRESA                       = NOMBRE_EMPRESA_,
           CEDULA_JURIDICA                      = CEDULA_JURIDICA_,
           PREFERENCIAS                         = PREFERENCIAS_,
           DIRECCION                            = DIRECCION_,
           TELEFONO                             = TELEFONO_,
           FAX                                  = FAX_,
           EMAIL                                = EMAIL_,
           SALDO                                = SALDO_,
           FECHA_INGRESO_EMPRESA_COMO_PROVEEDOR = FECHA_INGRESO_EMPRESA_COMO_PROVEEDOR_,
           CUENTA_BANCARIA                      = CUENTA_BANCARIA_,
           ESTADO                               = ESTADO_
    
     WHERE proveedores_id = proveedor_id_;
  
  END IF;

end MODIFICAR_PROVEEDOR;
/
