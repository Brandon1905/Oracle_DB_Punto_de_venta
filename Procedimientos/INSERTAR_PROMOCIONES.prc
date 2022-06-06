create or replace noneditionable procedure INSERTAR_PROMOCIONES(pv_producto_id_     IN NUMBER,
                                                                cantidad_productos_ IN NUMBER,
                                                                descripcion_        IN VARCHAR2,
                                                                pv_sede_id_         IN NUMBER,
                                                                cantidad_acciones_  IN NUMBER,
                                                                productos_nn_x_n_   IN NUMBER,
                                                                productos_n_x_nn_   IN NUMBER) is
begin
  insert into PV_PROMOCIONES
    (pv_producto_id,
     cantidad_productos,
     estado,
     descripcion,
     pv_sede_id,
     cantidad_acciones,
     productos_nn_x_n,
     productos_n_x_nn)
  values
    (pv_producto_id_,
     cantidad_productos_,
     'A',
     descripcion_,
     pv_sede_id_,
     cantidad_acciones_,
     productos_nn_x_n_,
     productos_n_x_nn_);

end INSERTAR_PROMOCIONES;
/
