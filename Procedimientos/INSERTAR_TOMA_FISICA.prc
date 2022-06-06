create or replace noneditionable procedure INSERTAR_TOMA_FISICA(descripcion_ IN VARCHAR2) is
begin
  insert into PV_TOMA_FISICA
    (descripcion, fecha, estado)
  values
    (descripcion_, SYSDATE, 'A');
end INSERTAR_TOMA_FISICA;
/
