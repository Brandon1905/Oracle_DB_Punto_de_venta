create or replace noneditionable procedure MODIFICAR_CLIENTE(CLIENTE_ID_                         IN NUMBER,
                                                             CEDULA_                             IN NUMBER,
                                                             NOMBRE_                             IN VARCHAR2,
                                                             APELLIDOS_                          IN VARCHAR2,
                                                             TIPO_                               IN VARCHAR2,
                                                             PREFERENCIAS_                       IN VARCHAR2,
                                                             ESTADO_CIVIL_                       IN VARCHAR2,
                                                             DIRECCION_                          IN VARCHAR2,
                                                             TELEFONO_                           IN NUMBER,
                                                             NACIONALIDAD_                       IN VARCHAR2,
                                                             RESIDENCIA_                         IN VARCHAR2,
                                                             FAX_                                IN VARCHAR2,
                                                             SEXO_                               IN VARCHAR2,
                                                             FECHA_NACIMIENTO_                   IN DATE,
                                                             PUESTO_                             IN VARCHAR2,
                                                             EMPRESA_DONDE_LABORA_               IN VARCHAR2,
                                                             POSEE_SEGURO_                       IN VARCHAR2,
                                                             ESCOLARIDAD_                        IN VARCHAR2,
                                                             FECHA_INGRESO_EMPRESA_COMO_CLIENTE_ IN DATE,
                                                             CREDITO_MAX_                        IN FLOAT,
                                                             CREDITO_ACTUAL_                     IN FLOAT,
                                                             ESTADO_                             IN VARCHAR2,
                                                             ACCIONES_                           NUMBER) is

  CONTEO_ID NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO CONTEO_ID
    FROM PV_CLIENTE B
   WHERE B.CLIENTE_ID = CLIENTE_ID_;

  IF CONTEO_ID > 0 THEN
  
    UPDATE PV_CLIENTE
       SET cedula                             = CEDULA_,
           nombre                             = NOMBRE_,
           apellidos                          = APELLIDOS_,
           tipo                               = TIPO_,
           preferencias                       = PREFERENCIAS_,
           estado_civil                       = ESTADO_CIVIL_,
           direccion                          = DIRECCION_,
           telefono                           = TELEFONO_,
           nacionalidad                       = NACIONALIDAD_,
           residencia                         = RESIDENCIA_,
           fax                                = FAX_,
           sexo                               = SEXO_,
           fecha_nacimiento                   = FECHA_NACIMIENTO_,
           puesto                             = PUESTO_,
           empresa_donde_labora               = EMPRESA_DONDE_LABORA_,
           posee_seguro                       = POSEE_SEGURO_,
           escolaridad                        = ESCOLARIDAD_,
           fecha_ingreso_empresa_como_cliente = FECHA_INGRESO_EMPRESA_COMO_CLIENTE_,
           credito_max                        = CREDITO_MAX_,
           credito_actual                     = CREDITO_ACTUAL_,
           estado                             = ESTADO_,
           acciones                           = ACCIONES_
    
     WHERE CLIENTE_ID = CLIENTE_ID_;
  
  END IF;

end MODIFICAR_CLIENTE;
/
