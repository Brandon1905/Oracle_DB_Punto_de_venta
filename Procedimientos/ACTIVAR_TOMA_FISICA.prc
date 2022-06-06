create or replace noneditionable procedure ACTIVAR_TOMA_FISICA(toma_fisica_id_ IN NUMBER) is
begin
  update PV_TOMA_FISICA
     set estado = 'A'
   where toma_fisica_id_ = toma_fisica_id;
end ACTIVAR_TOMA_FISICA;
/
