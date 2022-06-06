create or replace noneditionable procedure INACTIVAR_DESCUENTOS(descuentos_id_ IN NUMBER) is
begin
  update PV_DESCUENTOS
     set estado = 'I'
   where descuentos_id = descuentos_id_;
end INACTIVAR_DESCUENTOS;
/
