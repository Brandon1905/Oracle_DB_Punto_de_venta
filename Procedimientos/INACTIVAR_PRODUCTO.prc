create or replace noneditionable procedure INACTIVAR_PRODUCTO(producto_id_ IN NUMBER) is
begin
  update PV_PRODUCTO set estado = 'I' where producto_id_ = producto_id;
end INACTIVAR_PRODUCTO;
/
