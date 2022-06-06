create or replace noneditionable procedure MODIFICAR_PRODUCTO(producto_id_       IN NUMBER,
                                                              pv_proveedor_id_   IN NUMBER,
                                                              pv_familia_id_     IN NUMBER,
                                                              nombre_            IN VARCHAR2,
                                                              costo_             IN FLOAT,
                                                              fecha_de_ingreso_  IN DATE,
                                                              fecha_vencimiento_ IN DATE,
                                                              impuestos_         IN FLOAT,
                                                              exento_impuesto_   IN VARCHAR2,
                                                              unidad_medida_     IN VARCHAR2,
                                                              descripción_       IN VARCHAR2,
                                                              estado_            IN VARCHAR2,
                                                              precio_venta_      IN FLOAT) is
  conteo_familia number;
  conteo_ID      number;
begin

  select count(*)
    into conteo_ID
    from PV_PRODUCTO f
   where f.producto_id = producto_id_;

  select count(*)
    into conteo_familia
    from pv_familia f
   where f.familia_id = pv_familia_id_;

  if conteo_familia > 0 AND conteo_ID > 0 then
    update PV_PRODUCTO
       set pv_proveedor_id   = pv_proveedor_id_,
           pv_familia_id     = pv_familia_id_,
           nombre            = nombre_,
           costo             = costo_,
           fecha_de_ingreso  = fecha_de_ingreso_,
           fecha_vencimiento = fecha_vencimiento_,
           impuestos         = impuestos_,
           exento_impuesto   = exento_impuesto_,
           unidad_medida     = unidad_medida_,
           descripción       = descripción_,
           estado            = estado_,
           precio_venta      = precio_venta_
    
     where producto_id = producto_id_;
  end if;
end MODIFICAR_PRODUCTO;
/
