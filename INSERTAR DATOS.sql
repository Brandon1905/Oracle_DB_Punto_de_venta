/*
BEGIN 
  PV.INSERTAR_USUARIO(
  usuario_    => 'AXEL',
  rol_        => 'CAJERO',
  contraseña_ => 'AXEL',
 correo_  => 'bejaranoaxel07@gmail.com');
  END;


BEGIN 
  PV.INSERTAR_CLIENTE(
  CEDULA_                             => 604600150,
  NOMBRE_                             => 'brandon',
  APELLIDOS_                          => 'ugalde chavarria',
  TIPO_                               => 'persona',
  PREFERENCIAS_                       => 'SI',
  ESTADO_CIVIL_                       => 'soltero',
  DIRECCION_                          => 'san fransisco de agua buena',
  TELEFONO_                           => 86026861,
  NACIONALIDAD_                       => 'constaricense',
  RESIDENCIA_                         => 'si',
  FAX_                                => 'brandon@a',
  SEXO_                               => 'M',
  FECHA_NACIMIENTO_                   => '19/05/2000',
  PUESTO_                             => 'gerente corporativo',
  EMPRESA_DONDE_LABORA_               => 'apple',
  POSEE_SEGURO_                       => 'si',
  ESCOLARIDAD_                        => 'universitaria incompleta',
  CREDITO_MAX_                        => 500000,
  CORREO_ELECTRONICO_                 => 'brandonugaldech@gmail.com');
  END;
  
  
BEGIN
  PV.INSERTAR_FAMILIA(tipo_ =>'carne', descripcion_ =>'carne de la jj');
  PV.INSERTAR_FAMILIA(tipo_ =>'lacteo', descripcion_ =>'leches');
  PV.INSERTAR_FAMILIA(tipo_ =>'gaseoso', descripcion_ =>'producto carbonatado');
  END;


BEGIN
  PV.INSERTAR_PROVEEDOR(
  limite_de_credito_                    => 500000,
  nombre_empresa_                       => 'BM',
  cedula_juridica_                      => 31015485,
  preferencias_                         => 'SI',
  direccion_                            => 'san vito',
  telefono_                             => 85476321,
  fax_                                  => 'bm@a',
  email_                                => 'bm@gmail.com',
  cuenta_bancaria_                      => 4854648164684168);
  END;


BEGIN
  PV.INSERTAR_SEDE(
  nombre_local_ => 'EL MAYOREO',
  direccion_    => 'SAN VITO CENTRO',
  codigo_       => 6871614,
  descripcion_  => 'No tiene estacionamiento');
  END;


BEGIN
  PV.INSERTAR_SERVICIO(
  tipo_              => 'LUZ',
  numero_referencia_ => 78657634,
  monto_             => 22000,
  USUARIO_ID => 222);
  END;


BEGIN
  PV.INSERTAR_PRODUCTO(
  pv_proveedor_id_   => 41,
  pv_familia_id_     => 61,
  nombre_            => 'CARNE MOLIDA',
  costo_             => 500,
  fecha_de_ingreso_  => '17/11/2021',
  fecha_vencimiento_ => '25/11/2021',
  impuestos_         => 13,
  exento_impuesto_   => 'N',
  unidad_medida_     => 'KG',
  descripción_       => 'carne de primera',
  precio_venta_      => 1000);
  end;


BEGIN
  PV.INSERTAR_BODEGA(
  pv_sede_id_ => 21,
  nombre_     => 'BODEGA DEL BM',
  direccion_  => 'DETRAS DEL BM');
  END;


BEGIN
  PV.INSERTAR_INVENTARIO(pv_bodega_id_ => 21,
                         descripcion_  => 'INVENTARIO PRINCIPAL',
                         fecha_        => '17/11/2021');
END;


BEGIN
  PV.INSERTAR_DETALLE_INVENTARIO(pv_producto_id_     => 102,
                                 pv_inventario_id_   => 21,
                                 cantidad_           => 100,
                                 porciento_utilidad_ => 1,
                                 porciento_máximo_   => 10);
END;
                                 

BEGIN
  PV.INSERTAR_PROMOCION_ACCIONES(
  PRODUCTO_ID_       => 102,
  CANTIDAD           => 5,
  DESCRIPCION_       => 'PROMOCION PARA ACCIONES POR IN CARRO',
  SEDE_ID            => 21,
  cantidad_acciones_ => 2,
  FECHA_LIMITE       => '27/11/2021');
  END;


BEGIN
  PV.INSERTAR_PROMOCION_NXN(
  PRODUCTO_ID_      => 102,
  DESCRIPCION_      => 'PORQUE NO SE VENDE',
  SEDE_ID           => '21',
  PRODUCTOS_NN_X_N_ => 2,
  PRODUCTOS_N_X_NN_ => 1,
  FECHA_LIMITE      => '29/11/2021');
  END;


BEGIN 
  PV.INSERTAR_DECUENTOS(
  pv_familia_id_     => '',
  pv_proveedor_id_   => '',
  pv_productos_id_   => 101,
  pv_inventario_id_  => 21,
  descuento_         => 10,
  fecha_ingreso_     => '17/11/2021',
  fecha_vencimiento_ => '27/11/2021');
  END;
  
  
BEGIN
  PV.INSERTAR_FACTURA(
  pv_cliente_id_     => 101,
  pv_servicio_id_    => '',
  pv_proveedor_id_   => '',
  fecha_cancelacion_ => '17/11/2021',
  fecha_vencimiento_ => '17/11/2021',
  estado_factura_    => 'C',
  tipo_factura_      => 'FAC',
  pv_sede_id_        => 21,
  pv_USUARIO_id_     => 21);
END;  


BEGIN
  PV.INSERTAR_CODIGO_BARRAS(
  pv_producto_id_ => 101, codigo_barras_ => 457378);
  END;


BEGIN
  PV.INSERTAR_DETALLE_FACTURA(
  PV_PRODICTO_ID_ => 102,
  PV_FACTURA_ID_  => 167,
  CANTIDAD_       => 5);
  END;


BEGIN
  PV.INSERTAR_ABONOS(pv_cuentas_por_cobrar_id_ =>81, monto_ =>706);
END;


BEGIN
  PV.INSERTAR_PAGOS(pv_cuentas_por_pagar_id_ => 41, monto_ => 1000);
END;


BEGIN
  PV.INSERTAR_TOMA_FISICA(descripcion_ => 'TOMA FISICA');
END;


BEGIN 
  PV.INSERTAR_DETALLE_TOMA_FISICA(
  PV_TOMA_FISICA_ => 1,
  pv_producto_id_   => 101,
  pv_inventario_id_ => 21,
  cantidad_         => 5);
END;


BEGIN
  PV.INSERTAR_ROBO_DAÑO(
  pv_sede_id_ => 21,
  tipo_       => 'R');
  END;


BEGIN
  PV.INSERTAR_DETALLE_ROBO_DAÑO(
  pv_robo_daño_id_ => 21,
  pv_producto_id_  => 101,
  cantidad_        => 1);
  END;


BEGIN
  PV.INSERTAR_TIPO_PAGO_DETALLE(
  pv_factura_id_       => 164,
  tipo_pago_           => 'EFECTIVO',
  numero_de_documento_ => 61,
  monto_               => 1500);
  END;
*/

















 
