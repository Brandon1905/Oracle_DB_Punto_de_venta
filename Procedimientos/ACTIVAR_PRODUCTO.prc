create or replace noneditionable procedure ACTIVAR_PRODUCTO(producto_id_ IN NUMBER) is
begin
  update PV_PRODUCTO set estado = 'A' where producto_id_ = producto_id;
end ACTIVAR_PRODUCTO;
/
