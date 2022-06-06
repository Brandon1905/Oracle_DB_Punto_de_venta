create or replace noneditionable procedure INACTIVAR_CLIENTE(cliente_id_ IN NUMBER) is
begin
  update PV_CLIENTE set estado = 'I' where cliente_id_ = cliente_id;
end INACTIVAR_CLIENTE;
/
