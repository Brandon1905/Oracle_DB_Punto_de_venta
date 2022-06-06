create or replace noneditionable procedure INACTIVAR_DETALLE_TOMA_FISICA(detalle_toma_fisica_id_ IN NUMBER) is
begin
  update PV_DETALLE_TOMA_FISICA
     set estado = 'I'
   where detalle_toma_fisica_id = detalle_toma_fisica_id_;
end INACTIVAR_DETALLE_TOMA_FISICA;
/
