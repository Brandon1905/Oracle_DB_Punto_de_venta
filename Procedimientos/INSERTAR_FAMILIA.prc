create or replace noneditionable procedure INSERTAR_FAMILIA(tipo_        IN VARCHAR2,
                                                            descripcion_ IN VARCHAR2) is
begin

  INSERT INTO PV_FAMILIA
    (TIPO, DESCRIPCION, ESTADO)
  VALUES
    (tipo_, descripcion_, 'A');

end INSERTAR_FAMILIA;
/
