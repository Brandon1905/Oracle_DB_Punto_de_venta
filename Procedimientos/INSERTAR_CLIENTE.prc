create or replace noneditionable procedure INSERTAR_CLIENTE(CEDULA_                             IN NUMBER,
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
                                                            CORREO_ELECTRONICO_                 IN VARCHAR2) is
begin

  INSERT INTO PV_CLIENTE
    (CEDULA,
     NOMBRE,
     APELLIDOS,
     TIPO,
     PREFERENCIAS,
     ESTADO_CIVIL,
     DIRECCION,
     TELEFONO,
     NACIONALIDAD,
     RESIDENCIA,
     FAX,
     SEXO,
     FECHA_NACIMIENTO,
     PUESTO,
     EMPRESA_DONDE_LABORA,
     POSEE_SEGURO,
     ESCOLARIDAD,
     FECHA_INGRESO_EMPRESA_COMO_CLIENTE,
     CREDITO_MAX,
     CREDITO_ACTUAL,
     ESTADO,
     CORREO_ELECTRONICO,
     ACCIONES)
  VALUES
    (CEDULA_,
     NOMBRE_,
     APELLIDOS_,
     TIPO_,
     PREFERENCIAS_,
     ESTADO_CIVIL_,
     DIRECCION_,
     TELEFONO_,
     NACIONALIDAD_,
     RESIDENCIA_,
     FAX_,
     SEXO_,
     FECHA_NACIMIENTO_,
     PUESTO_,
     EMPRESA_DONDE_LABORA_,
     POSEE_SEGURO_,
     ESCOLARIDAD_,
     FECHA_INGRESO_EMPRESA_COMO_CLIENTE_,
     CREDITO_MAX_,
     0,
     'A',
     CORREO_ELECTRONICO_,
     0);
end INSERTAR_CLIENTE;
/
