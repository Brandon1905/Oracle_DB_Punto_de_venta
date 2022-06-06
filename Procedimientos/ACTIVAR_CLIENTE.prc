create or replace noneditionable procedure ACTIVAR_CLIENTE(cliente_id_ IN NUMBER) is
begin
  update PV_CLIENTE set estado = 'A' where cliente_id_ = cliente_id;
end ACTIVAR_CLIENTE;
/
