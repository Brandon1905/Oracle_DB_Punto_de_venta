create or replace noneditionable procedure INSERTAR_PROVEEDOR(limite_de_credito_ FLOAT,
                                                              nombre_empresa_    VARCHAR2,
                                                              cedula_juridica_   NUMBER,
                                                              preferencias_      VARCHAR2,
                                                              direccion_         VARCHAR2,
                                                              telefono_          NUMBER,
                                                              fax_               VARCHAR2,
                                                              email_             VARCHAR2,
                                                              cuenta_bancaria_   NUMBER) is
begin
  INSERT INTO PV_PROVEEDORES
    (LIMITE_DE_CREDITO,
     NOMBRE_EMPRESA,
     CEDULA_JURIDICA,
     PREFERENCIAS,
     DIRECCION,
     TELEFONO,
     FAX,
     EMAIL,
     SALDO,
     FECHA_INGRESO_EMPRESA_COMO_PROVEEDOR,
     CUENTA_BANCARIA,
     ESTADO)
  VALUES
    (limite_de_credito_,
     nombre_empresa_,
     cedula_juridica_,
     preferencias_,
     direccion_,
     telefono_,
     fax_,
     email_,
     0,
     SYSDATE,
     cuenta_bancaria_,
     'A');
end INSERTAR_PROVEEDOR;
/
