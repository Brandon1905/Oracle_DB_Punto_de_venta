create or replace noneditionable procedure INSERTAR_SEDE(nombre_local_ IN VARCHAR2,
                                                         direccion_    IN VARCHAR2,
                                                         codigo_       IN VARCHAR2,
                                                         descripcion_  IN VARCHAR2) is
begin
  INSERT INTO PV_SEDE
    (NOMBRE_LOCAL, DIRECCION, CODIGO, ESTADO, DESCRIPCION)
  VALUES
    (nombre_local_, direccion_, codigo_, 'A', descripcion_);

end INSERTAR_SEDE;
/
