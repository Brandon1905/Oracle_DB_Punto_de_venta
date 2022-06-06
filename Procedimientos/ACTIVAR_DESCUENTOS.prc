create or replace noneditionable procedure ACTIVAR_DESCUENTOS(descuentos_id_ IN NUMBER) is
begin
  update PV_DESCUENTOS
     set estado = 'A'
   where descuentos_id = descuentos_id_;
end ACTIVAR_DESCUENTOS;
/
