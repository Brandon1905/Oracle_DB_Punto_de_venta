create or replace noneditionable procedure INACTIVAR_TOMA_FISICA(toma_fisica_id_ IN NUMBER) is
begin
  update PV_TOMA_FISICA
     set estado = 'I'
   where toma_fisica_id_ = toma_fisica_id;
end INACTIVAR_TOMA_FISICA;
/
