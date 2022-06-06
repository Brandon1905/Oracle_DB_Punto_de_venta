create or replace noneditionable procedure INSERTAR_PRODUCTO(pv_proveedor_id_   IN NUMBER,
                                                             pv_familia_id_     IN NUMBER,
                                                             nombre_            IN VARCHAR2,
                                                             costo_             IN FLOAT,
                                                             fecha_de_ingreso_  IN DATE,
                                                             fecha_vencimiento_ IN DATE,
                                                             impuestos_         IN FLOAT,
                                                             exento_impuesto_   IN VARCHAR2,
                                                             unidad_medida_     IN VARCHAR2,
                                                             descripción_       IN VARCHAR2,
                                                             precio_venta_      IN FLOAT) is
  conteo_familia number;
begin

  select count(*)
    into conteo_familia
    from pv_familia f
   where f.familia_id = pv_familia_id_;

  if conteo_familia > 0 then
    insert into PV_PRODUCTO
      (pv_proveedor_id,
       pv_familia_id,
       nombre,
       costo,
       fecha_de_ingreso,
       fecha_vencimiento,
       impuestos,
       exento_impuesto,
       unidad_medida,
       descripción,
       estado,
       precio_venta)
    values
      (pv_proveedor_id_,
       pv_familia_id_,
       nombre_,
       costo_,
       fecha_de_ingreso_,
       fecha_vencimiento_,
       impuestos_,
       exento_impuesto_,
       unidad_medida_,
       descripción_,
       'A',
       precio_venta_);
  end if;
end INSERTAR_PRODUCTO;
/
