-- Create table
create table PV_USUARIOS
(
  usuarios_id NUMBER generated always as identity,
  usuario     NVARCHAR2(50),
  rol         NVARCHAR2(50),
  contraseña  NVARCHAR2(100),
  correo      NVARCHAR2(50),
  estado      NVARCHAR2(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column PV_USUARIOS.rol
  is 'Los roles deben de ser como mínimo: Gerente, Coordinador, Cajero,
Encargado de Inventario. ';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_USUARIOS
  add constraint PK_USUARIOS_ID primary key (USUARIOS_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_CLIENTE
(
  cliente_id                         NUMBER generated always as identity,
  cedula                             NUMBER not null,
  nombre                             VARCHAR2(50) not null,
  apellidos                          VARCHAR2(50) not null,
  tipo                               VARCHAR2(50) not null,
  preferencias                       VARCHAR2(50) not null,
  estado_civil                       VARCHAR2(50),
  direccion                          VARCHAR2(50),
  telefono                           NUMBER,
  nacionalidad                       VARCHAR2(50),
  residencia                         VARCHAR2(50),
  fax                                VARCHAR2(50),
  sexo                               VARCHAR2(50),
  fecha_nacimiento                   DATE,
  puesto                             VARCHAR2(50),
  empresa_donde_labora               VARCHAR2(50),
  posee_seguro                       VARCHAR2(50),
  escolaridad                        VARCHAR2(50),
  fecha_ingreso_empresa_como_cliente DATE not null,
  credito_max                        FLOAT not null,
  credito_actual                     FLOAT not null,
  estado                             VARCHAR2(1) not null,
  correo_electronico                 VARCHAR2(50),
  acciones                           NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_CLIENTE
  is 'Es la informacion necesaria del cliente para diferentes tipos de tramites.';
-- Add comments to the columns 
comment on column PV_CLIENTE.cliente_id
  is 'Identificador de la tabla';
comment on column PV_CLIENTE.tipo
  is 'EMPRESA O PERSONA';
comment on column PV_CLIENTE.preferencias
  is 'SI TIENE PREFERENCIAS SE LE PUEDEN HACER FACTURAS POR COBRAR';
comment on column PV_CLIENTE.direccion
  is 'Direccion de la del cliente ';
comment on column PV_CLIENTE.fecha_ingreso_empresa_como_cliente
  is 'Fecha de ingreso a la empresa como cliente.';
comment on column PV_CLIENTE.credito_max
  is 'Credito maximo del cliente.';
comment on column PV_CLIENTE.credito_actual
  is 'Credito actual del cliente.';
comment on column PV_CLIENTE.estado
  is 'Estado activo = A
estado inactivo = I';
comment on column PV_CLIENTE.acciones
  is 'Cantidad de acciones que tiene el cliente';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_CLIENTE
  add primary key (CLIENTE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );



-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_FAMILIA
(
  familia_id  NUMBER generated always as identity,
  tipo        VARCHAR2(20) not null,
  descripcion VARCHAR2(100),
  estado      VARCHAR2(1) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_FAMILIA
  is 'Tabla encargada de almacenar a las familias de productos.';
-- Add comments to the columns 
comment on column PV_FAMILIA.familia_id
  is 'Es el identificador de la tabla.';
comment on column PV_FAMILIA.tipo
  is 'Tipo de familia como lacteos, carnes, entre otros.';
comment on column PV_FAMILIA.descripcion
  is 'Descripcion del tipo de familia.';
comment on column PV_FAMILIA.estado
  is 'Estado activo = A
estado inactivo = I.';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_FAMILIA
  add primary key (FAMILIA_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_PROVEEDORES
(
  proveedores_id                       NUMBER generated always as identity,
  limite_de_credito                    FLOAT not null,
  nombre_empresa                       VARCHAR2(100) not null,
  cedula_juridica                      NUMBER not null,
  preferencias                         VARCHAR2(50),
  direccion                            VARCHAR2(500),
  telefono                             NUMBER not null,
  fax                                  VARCHAR2(30),
  email                                VARCHAR2(30) not null,
  saldo                                FLOAT not null,
  fecha_ingreso_empresa_como_proveedor DATE not null,
  cuenta_bancaria                      NUMBER not null,
  estado                               VARCHAR2(1) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_PROVEEDORES
  is 'Es la tabla encarga de mantener el registro referente a los proveedores. ';
-- Add comments to the columns 
comment on column PV_PROVEEDORES.proveedores_id
  is 'Es el identificador de la tabla.';
comment on column PV_PROVEEDORES.limite_de_credito
  is 'Es el limite de crédito del proveedor.';
comment on column PV_PROVEEDORES.nombre_empresa
  is 'Es el nombre del proveedor.';
comment on column PV_PROVEEDORES.cedula_juridica
  is 'Es la cédula juridica de la empresa a la cual pertenece el proveedor.';
comment on column PV_PROVEEDORES.preferencias
  is 'SI TIENE PREFERENCIAS SE LE PUEDEN HACER FACTURAS POR PAGAR';
comment on column PV_PROVEEDORES.direccion
  is 'Es la dirección del proveedor.';
comment on column PV_PROVEEDORES.telefono
  is 'Es el número de teléfono del proveedor.';
comment on column PV_PROVEEDORES.fax
  is 'Es el fax del proveedor.';
comment on column PV_PROVEEDORES.email
  is 'Es el email del proveedor.';
comment on column PV_PROVEEDORES.saldo
  is 'Es el saldo del proveedor.';
comment on column PV_PROVEEDORES.fecha_ingreso_empresa_como_proveedor
  is 'Es la fecha de ingreso de la empresa como proveedor.';
comment on column PV_PROVEEDORES.cuenta_bancaria
  is 'Es la cuenta bancaria del proveedor.';
comment on column PV_PROVEEDORES.estado
  is 'Estado activo = A
estado inactivo = I.';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_PROVEEDORES
  add primary key (PROVEEDORES_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_SEDE
(
  sede_id      NUMBER generated always as identity,
  nombre_local VARCHAR2(100) not null,
  direccion    VARCHAR2(500) not null,
  codigo       VARCHAR2(20) not null,
  estado       VARCHAR2(1) not null,
  descripcion  VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_SEDE
  is 'Es la tabla encarga de mantener el registro referente a las sedes.';
-- Add comments to the columns 
comment on column PV_SEDE.sede_id
  is 'Es el identificador de la tabla.';
comment on column PV_SEDE.nombre_local
  is 'Es el nombre del local.';
comment on column PV_SEDE.direccion
  is 'Es la dirección del local.';
comment on column PV_SEDE.codigo
  is 'Es el código del local.';
comment on column PV_SEDE.estado
  is 'Estado activo = A
estado inactivo = I.';
comment on column PV_SEDE.descripcion
  is 'Descripcion de la sede.';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_SEDE
  add primary key (SEDE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_SERVICIO
(
  servicio_id       NUMBER generated always as identity,
  tipo              VARCHAR2(100) not null,
  numero_referencia NUMBER,
  monto             FLOAT,
  estado            VARCHAR2(1),
  pv_usuario_id     NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_SERVICIO
  is 'Es la tabla encarga de mantener el registro referente a los servicios.';
-- Add comments to the columns 
comment on column PV_SERVICIO.servicio_id
  is 'Es el identificador de la tabla.';
comment on column PV_SERVICIO.tipo
  is 'Es el tipo de sercivio.';
comment on column PV_SERVICIO.numero_referencia
  is 'Es el número de referencia del servicio.';
comment on column PV_SERVICIO.monto
  is 'Es el monto a pagar por el servicio.';
comment on column PV_SERVICIO.estado
  is 'Estado activo = A
estado inactivo = I.';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_SERVICIO
  add primary key (SERVICIO_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_SERVICIO
  add constraint FK_PV_USUARIO_ID11 foreign key (PV_USUARIO_ID)
  references PV_USUARIOS (USUARIOS_ID);



-- ------------------------------------------------------------------------------------------
-- Create table
create table PV_PRODUCTO
(
  producto_id       NUMBER generated always as identity,
  pv_proveedor_id   NUMBER,
  pv_familia_id     NUMBER,
  nombre            VARCHAR2(50) not null,
  costo             FLOAT not null,
  fecha_de_ingreso  DATE not null,
  fecha_vencimiento DATE not null,
  impuestos         FLOAT not null,
  exento_impuesto   VARCHAR2(50),
  unidad_medida     VARCHAR2(50) not null,
  descripción       VARCHAR2(50),
  estado            VARCHAR2(1) not null,
  precio_venta      FLOAT
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
compress;
-- Add comments to the table 
comment on table PV_PRODUCTO
  is 'Es la tabla encarga de mantener el registro referente a los productos.';
-- Add comments to the columns 
comment on column PV_PRODUCTO.producto_id
  is 'Es el identificador de la tabla.';
comment on column PV_PRODUCTO.pv_proveedor_id
  is 'Es el identificador de la llave foranea de proveedor a la
que se relaciona este producto.';
comment on column PV_PRODUCTO.pv_familia_id
  is 'Es el identificador de la llave foranea de familia a la
que se relaciona este producto.';
comment on column PV_PRODUCTO.nombre
  is 'Es el nombre del producto.';
comment on column PV_PRODUCTO.costo
  is 'Es el costo del producto.';
comment on column PV_PRODUCTO.fecha_de_ingreso
  is 'Es la fecha de ingreso del producto.';
comment on column PV_PRODUCTO.fecha_vencimiento
  is 'Es la fecha de vencimiento del producto.';
comment on column PV_PRODUCTO.impuestos
  is 'Es el impuesto del producto.';
comment on column PV_PRODUCTO.exento_impuesto
  is 'Es para saber si el producto esta exento de impuesto.
S = SI
N = NO
';
comment on column PV_PRODUCTO.unidad_medida
  is 'Es la unidad de medida del producto.';
comment on column PV_PRODUCTO.descripción
  is 'Es la descriición del producto.';
comment on column PV_PRODUCTO.estado
  is 'Estado activo = A
estado inactivo = I.';
comment on column PV_PRODUCTO.precio_venta
  is 'Es el precio del producto.';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_PRODUCTO
  add primary key (PRODUCTO_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_PRODUCTO
  add constraint FK_PV_FAMILIA_ID5 foreign key (PV_FAMILIA_ID)
  references PV_FAMILIA (FAMILIA_ID);
alter table PV_PRODUCTO
  add constraint FK_PV_PROVEEDOR_ID4 foreign key (PV_PROVEEDOR_ID)
  references PV_PROVEEDORES (PROVEEDORES_ID);


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_BODEGA
(
  bodega_id  NUMBER generated always as identity,
  pv_sede_id INTEGER not null,
  nombre     VARCHAR2(50),
  direccion  VARCHAR2(50) not null,
  estado     VARCHAR2(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_BODEGA
  is 'Es la tabla encarga de mantener los productos que no se encuentran
en el inventario.';
-- Add comments to the columns 
comment on column PV_BODEGA.bodega_id
  is 'Identificador de la tabla';
comment on column PV_BODEGA.pv_sede_id
  is 'Es el identificador de la llave foranea de la sede a la
cual pertenece la bodega.';
comment on column PV_BODEGA.nombre
  is 'Nombre de la bodega para su referencia.';
comment on column PV_BODEGA.direccion
  is 'Direccion de la bodega.';
comment on column PV_BODEGA.estado
  is 'Estado activo = A
estado inactivo = I';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_BODEGA
  add primary key (BODEGA_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_BODEGA
  add constraint FK_PV_SEDE_ID foreign key (PV_SEDE_ID)
  references PV_SEDE (SEDE_ID);


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_INVENTARIO
(
  inventario_id NUMBER generated always as identity,
  pv_bodega_id  NUMBER not null,
  descripcion   VARCHAR2(100),
  fecha         DATE not null,
  estado        VARCHAR2(1) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_INVENTARIO
  is 'Tabla encargada de almacenar los inventarios por bodega.';
-- Add comments to the columns 
comment on column PV_INVENTARIO.inventario_id
  is 'Es el identificador de la tabla.';
comment on column PV_INVENTARIO.pv_bodega_id
  is 'Es el identificador de la llave foranea de la bodega a la que pertenece el invenrio.';
comment on column PV_INVENTARIO.descripcion
  is 'Descripcion del inventario.';
comment on column PV_INVENTARIO.fecha
  is 'Fecha en la que se creo el inventario.';
comment on column PV_INVENTARIO.estado
  is 'Estado activo = A
estado inactivo = I.';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_INVENTARIO
  add primary key (INVENTARIO_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_INVENTARIO
  add constraint FK_PV_BODEGA_ID foreign key (PV_BODEGA_ID)
  references PV_BODEGA (BODEGA_ID);


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_DETALLE_INVENTARIO
(
  detalle_inventario_id NUMBER generated always as identity,
  pv_producto_id        NUMBER not null,
  pv_inventario_id      NUMBER not null,
  cantidad              NUMBER not null,
  porciento_utilidad    FLOAT,
  porciento_máximo      FLOAT not null,
  estado                VARCHAR2(1) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_DETALLE_INVENTARIO
  is 'Tabla encargada de almacenas todos los productos de que tienen existencia en un inventario.';
-- Add comments to the columns 
comment on column PV_DETALLE_INVENTARIO.detalle_inventario_id
  is 'Es el identificador de la tabla.';
comment on column PV_DETALLE_INVENTARIO.pv_producto_id
  is 'Es el identificador de la llave foranea del producto que se va ha inventariar.';
comment on column PV_DETALLE_INVENTARIO.pv_inventario_id
  is 'Es el identificador de la llave foranea del inventario al que pertenece este detalle.';
comment on column PV_DETALLE_INVENTARIO.cantidad
  is 'Cantidad de productos por inventariar.';
comment on column PV_DETALLE_INVENTARIO.porciento_utilidad
  is 'Es el porcentaje de utilidad del producto.';
comment on column PV_DETALLE_INVENTARIO.porciento_máximo
  is 'Es el porcentaje máximo de descuento del producto.';
comment on column PV_DETALLE_INVENTARIO.estado
  is 'Estado activo = A
estado inactivo = I.';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_DETALLE_INVENTARIO
  add primary key (DETALLE_INVENTARIO_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_DETALLE_INVENTARIO
  add constraint FK_PV_INVENTARIO_ID foreign key (PV_INVENTARIO_ID)
  references PV_INVENTARIO (INVENTARIO_ID);
alter table PV_DETALLE_INVENTARIO
  add constraint FK_PV_PRODUCTOS_ID3 foreign key (PV_PRODUCTO_ID)
  references PV_PRODUCTO (PRODUCTO_ID);


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_PROMOCIONES
(
  promociones_id         NUMBER generated always as identity,
  pv_producto_id         NUMBER,
  cantidad_productos     NUMBER not null,
  estado                 VARCHAR2(1) not null,
  descripcion            VARCHAR2(100),
  pv_sede_id             NUMBER,
  cantidad_acciones      NUMBER,
  productos_nn_x_n       NUMBER,
  productos_n_x_nn       NUMBER,
  tipo                   NVARCHAR2(100),
  fecha_limite_promocion DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_PROMOCIONES
  is 'Es la tabla encarga de mantener el registro referente a las promociones.';
-- Add comments to the columns 
comment on column PV_PROMOCIONES.promociones_id
  is 'Es el identificador de la tabla.';
comment on column PV_PROMOCIONES.pv_producto_id
  is 'Es el identificador de la llave foranea del producto a la
que se relaciona esta promoción.';
comment on column PV_PROMOCIONES.cantidad_productos
  is 'Es la cantidad de productos en promociones.';
comment on column PV_PROMOCIONES.estado
  is 'Estado activo = A
estado inactivo = I.';
comment on column PV_PROMOCIONES.descripcion
  is 'MOTIVO DE LA PROMOCION';
comment on column PV_PROMOCIONES.cantidad_acciones
  is 'Cantidad de acciones que optine por la compra';
comment on column PV_PROMOCIONES.productos_nn_x_n
  is 'Son la cantidad de productos en caso de que este sea una promocion de 2x1 o 3x1 etc....';
comment on column PV_PROMOCIONES.tipo
  is 'TIPO DE PROMOCION:
AC = ACIONES
NXN = PRODUCTOS 2X1 ENTRE OTROS
';
comment on column PV_PROMOCIONES.fecha_limite_promocion
  is 'FECHA LIMITE DE LA PROMOCION';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_PROMOCIONES
  add primary key (PROMOCIONES_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_PROMOCIONES
  add constraint FK_PV_PRODUCTOS_ID6 foreign key (PV_PRODUCTO_ID)
  references PV_PRODUCTO (PRODUCTO_ID);
alter table PV_PROMOCIONES
  add constraint FK_PV_SEDE_ID6 foreign key (PV_SEDE_ID)
  references PV_SEDE (SEDE_ID);



-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_DESCUENTOS
(
  descuentos_id     NUMBER generated always as identity,
  pv_familia_id     NUMBER,
  pv_proveedor_id   NUMBER,
  pv_productos_id   NUMBER,
  pv_inventario_id  NUMBER not null,
  descuento         FLOAT not null,
  fecha_ingreso     DATE,
  fecha_vencimiento DATE not null,
  estado            VARCHAR2(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_DESCUENTOS
  is 'Es la tabla encarga de mantener los registros de los descuentos
que pueden presentar los productos. ';
-- Add comments to the columns 
comment on column PV_DESCUENTOS.descuentos_id
  is 'Es el identificador de la tabla.';
comment on column PV_DESCUENTOS.pv_familia_id
  is 'Es el identificador de la llave foranea de los descuentos a la
que se relaciona la familia de los productos.';
comment on column PV_DESCUENTOS.pv_proveedor_id
  is 'Es el identificador de la llave foranea de los descuentos a la
que se relaciona los proveedores.';
comment on column PV_DESCUENTOS.pv_productos_id
  is 'Es el identificador de la llave foranea de los descuentos a la
que se relaciona a los productos.';
comment on column PV_DESCUENTOS.descuento
  is 'porcentaje de descuento ';
comment on column PV_DESCUENTOS.fecha_ingreso
  is 'Fecha de ingreso de los decuentos.';
comment on column PV_DESCUENTOS.fecha_vencimiento
  is 'Fecha de vencimiento de los descuentos.';
comment on column PV_DESCUENTOS.estado
  is 'Estado activo = A
estado inactivo = I';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_DESCUENTOS
  add primary key (DESCUENTOS_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_DESCUENTOS
  add constraint FK_PV_FAMILIA_ID foreign key (PV_FAMILIA_ID)
  references PV_FAMILIA (FAMILIA_ID);
alter table PV_DESCUENTOS
  add constraint FK_PV_INVENTARIO_ID4 foreign key (PV_INVENTARIO_ID)
  references PV_INVENTARIO (INVENTARIO_ID);
alter table PV_DESCUENTOS
  add constraint FK_PV_PRODUCTOS_ID foreign key (PV_PRODUCTOS_ID)
  references PV_PRODUCTO (PRODUCTO_ID);
alter table PV_DESCUENTOS
  add constraint FK_PV_PROVEEDOR_ID2 foreign key (PV_PROVEEDOR_ID)
  references PV_PROVEEDORES (PROVEEDORES_ID);


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_FACTURA
(
  factura_id        NUMBER generated always as identity,
  pv_cliente_id     NUMBER,
  pv_servicio_id    NUMBER,
  pv_proveedor_id   NUMBER,
  fecha             DATE not null,
  total             FLOAT not null,
  sub_total         FLOAT not null,
  descuento         FLOAT not null,
  impuesto          FLOAT not null,
  fecha_cancelacion DATE,
  fecha_vencimiento DATE,
  estado_factura    VARCHAR2(9) not null,
  tipo_factura      VARCHAR2(3) not null,
  estado            VARCHAR2(1) not null,
  pv_sede_id        NUMBER,
  pv_usuario_id     NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_FACTURA
  is 'Tabla encargada de mantener el registro de todas las facturas, cuentas por pagar y cuentas por cobrar de las sedes.';
-- Add comments to the columns 
comment on column PV_FACTURA.factura_id
  is 'Es el identificador de la tabla.';
comment on column PV_FACTURA.pv_cliente_id
  is 'Es el identificador de la llave foranea del cliente a la que se le hace la factura en caso de ser necesario.';
comment on column PV_FACTURA.pv_servicio_id
  is 'Es el identificador de la llave foranea del servicio que se le hace en caso de ser necesario.';
comment on column PV_FACTURA.pv_proveedor_id
  is 'Es el identificador de la llave foranea del proveedor a la que se le hace la factura en caso de ser necesario.';
comment on column PV_FACTURA.fecha
  is 'Fecha en la que se realizo la factura.';
comment on column PV_FACTURA.total
  is 'Total a pagar por la factura.';
comment on column PV_FACTURA.sub_total
  is 'Sub total de la factura.';
comment on column PV_FACTURA.descuento
  is 'Descuento de la factura.';
comment on column PV_FACTURA.impuesto
  is 'Impuesto de la factura.';
comment on column PV_FACTURA.fecha_cancelacion
  is 'Fecha de cancelacion de la factura tomando en cuenta las CPP y CPC.';
comment on column PV_FACTURA.fecha_vencimiento
  is 'Fecha de Vencimiento de la factura tomando en cuenta las CPP y CPC.';
comment on column PV_FACTURA.estado_factura
  is 'Estado Pendiente = P 
Estado Cancelado = C';
comment on column PV_FACTURA.tipo_factura
  is 'Tipo de factura realizada (Factura = FAC
Cuentas por pagar = CPP
Cuentas por cobrar = CPC
Devolucion = DVL).
';
comment on column PV_FACTURA.estado
  is 'Estado activo = A
estado inactivo = I.';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_FACTURA
  add primary key (FACTURA_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_FACTURA
  add constraint FK_PV_CLIENTE_ID3 foreign key (PV_CLIENTE_ID)
  references PV_CLIENTE (CLIENTE_ID);
alter table PV_FACTURA
  add constraint FK_PV_PROVEEDOR_ID3 foreign key (PV_PROVEEDOR_ID)
  references PV_PROVEEDORES (PROVEEDORES_ID);
alter table PV_FACTURA
  add constraint FK_PV_SEDE_ID_ foreign key (PV_SEDE_ID)
  references PV_SEDE (SEDE_ID);
alter table PV_FACTURA
  add constraint FK_PV_SERVICIO_ID foreign key (PV_SERVICIO_ID)
  references PV_SERVICIO (SERVICIO_ID);
alter table PV_FACTURA
  add constraint FK_PV_USUARIO_ID foreign key (PV_USUARIO_ID)
  references PV_USUARIOS (USUARIOS_ID);
-- Grant/Revoke object privileges 
grant select, insert, update, delete on PV_FACTURA to CAJERO_PV;
grant insert, update, delete, alter, read on PV_FACTURA to CAJEROS_PV;
grant select, insert, update, delete, alter on PV_FACTURA to ENCARGADO_INVENTARIO_PV;
grant select, insert, update, delete, alter on PV_FACTURA to ENCARGADOS_INVENTARIOS_PV;



-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_CUENTAS_POR_PAGAR
(
  cuentas_por_pagar_id NUMBER generated always as identity,
  pv_factura_id        NUMBER not null,
  pv_proveedor_id      NUMBER,
  monto                FLOAT not null,
  fecha_registro       DATE,
  fecha_cancelacion    DATE,
  fecha_vencimiento    DATE not null,
  estado               VARCHAR2(1),
  monto_total          FLOAT
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_CUENTAS_POR_PAGAR
  is 'Es la tabla encarga de mantener los registros de las cuentas por
pagar de los proveedores y sus facturas.';
-- Add comments to the columns 
comment on column PV_CUENTAS_POR_PAGAR.cuentas_por_pagar_id
  is 'Identificador de la tabla.';
comment on column PV_CUENTAS_POR_PAGAR.pv_factura_id
  is 'Es el identificador de la llave foranea de la factura a la
que se relaciona la cuenta por pagar.';
comment on column PV_CUENTAS_POR_PAGAR.pv_proveedor_id
  is 'Es el identificador de la llave foranea de los proveedores a la
que se relacionan las cuentas por pagar.';
comment on column PV_CUENTAS_POR_PAGAR.monto
  is 'Monto CANCELADO de la cuenta por pagar.';
comment on column PV_CUENTAS_POR_PAGAR.fecha_registro
  is 'Fecha de registro  de la cuenta por pagar.';
comment on column PV_CUENTAS_POR_PAGAR.fecha_cancelacion
  is 'Fecha de cancelacion de la cuenta por pagar.';
comment on column PV_CUENTAS_POR_PAGAR.fecha_vencimiento
  is 'Fecha de vencimiento de las  de la cuenta por pagar.';
comment on column PV_CUENTAS_POR_PAGAR.estado
  is 'Estado activo = A
estado inactivo = I';
comment on column PV_CUENTAS_POR_PAGAR.monto_total
  is 'Monto total de la cuenta por pagar.';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_CUENTAS_POR_PAGAR
  add primary key (CUENTAS_POR_PAGAR_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_CUENTAS_POR_PAGAR
  add constraint FK_PV_FACTURA_ID2 foreign key (PV_FACTURA_ID)
  references PV_FACTURA (FACTURA_ID);
alter table PV_CUENTAS_POR_PAGAR
  add constraint FK_PV_PROVEEDOR_ID foreign key (PV_PROVEEDOR_ID)
  references PV_PROVEEDORES (PROVEEDORES_ID);

-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_CUENTAS_POR_COBRAR
(
  cuentas_por_cobrar_id NUMBER generated always as identity,
  pv_cliente_id         NUMBER not null,
  pv_factura_id         NUMBER not null,
  monto_total           FLOAT not null,
  fecha_registro        DATE,
  fecha_cancelacion     DATE,
  fecha_vencimiento     DATE not null,
  estado                VARCHAR2(1),
  monto                 FLOAT
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_CUENTAS_POR_COBRAR
  is 'Es la tabla encarga de mantener los registros de las cuentas por
cobrar de los clientes y sus facturas.';
-- Add comments to the columns 
comment on column PV_CUENTAS_POR_COBRAR.cuentas_por_cobrar_id
  is 'Identificador de la tabla';
comment on column PV_CUENTAS_POR_COBRAR.pv_cliente_id
  is 'Es el identificador de la llave foranea de los clientes a la
que se relacionan las cuentas por cobrar.';
comment on column PV_CUENTAS_POR_COBRAR.pv_factura_id
  is 'Es el identificador de la llave foranea de la factura a la
que se relaciona la cuenta por cobrar.';
comment on column PV_CUENTAS_POR_COBRAR.monto_total
  is 'Monto total de la cuenta por cobrar.';
comment on column PV_CUENTAS_POR_COBRAR.fecha_registro
  is 'Fecha de registro  de la cuenta por cobrar.';
comment on column PV_CUENTAS_POR_COBRAR.fecha_cancelacion
  is 'Fecha de cancelacion de la cuenta por cobrar.';
comment on column PV_CUENTAS_POR_COBRAR.fecha_vencimiento
  is 'Fecha de vencimiento de las  de la cuenta por cobrar.';
comment on column PV_CUENTAS_POR_COBRAR.estado
  is 'Estado activo = A
estado inactivo = I';
comment on column PV_CUENTAS_POR_COBRAR.monto
  is 'Monto CANCELADO de la cuenta por cobrar.';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_CUENTAS_POR_COBRAR
  add primary key (CUENTAS_POR_COBRAR_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_CUENTAS_POR_COBRAR
  add constraint FK_PV_CLIENTE_ID foreign key (PV_CLIENTE_ID)
  references PV_CLIENTE (CLIENTE_ID);
alter table PV_CUENTAS_POR_COBRAR
  add constraint FK_PV_FACTURA_ID foreign key (PV_FACTURA_ID)
  references PV_FACTURA (FACTURA_ID);


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_ABONOS
(
  abonos_id                NUMBER generated always as identity,
  pv_cuentas_por_cobrar_id NUMBER not null,
  monto                    FLOAT not null,
  fecha                    DATE not null,
  estado                   VARCHAR2(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_ABONOS
  is 'Es la tabla encarga de mantener el registro referente a los abonos
de las cuentas por cobrar de los clientes.';
-- Add comments to the columns 
comment on column PV_ABONOS.abonos_id
  is 'Identificador de la tabla';
comment on column PV_ABONOS.pv_cuentas_por_cobrar_id
  is 'Es el identificador de la llave foranea de la cuenta por cobrar a la
que se relaciona este abono.';
comment on column PV_ABONOS.monto
  is 'Monto del abono que se realice.';
comment on column PV_ABONOS.fecha
  is 'Fecha del abono';
comment on column PV_ABONOS.estado
  is 'Estado activo = A
estado inactivo = I';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_ABONOS
  add primary key (ABONOS_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_ABONOS
  add constraint FK_PV_CUENTAS_POR_COBRAR_ID foreign key (PV_CUENTAS_POR_COBRAR_ID)
  references PV_CUENTAS_POR_COBRAR (CUENTAS_POR_COBRAR_ID);


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_PAGOS
(
  pagos_id                NUMBER generated always as identity,
  pv_cuentas_por_pagar_id NUMBER not null,
  monto                   FLOAT not null,
  fecha                   DATE not null,
  estado                  VARCHAR2(1) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_PAGOS
  is 'Es la tabla encarga de mantener el registro referente a los pagos
de las cuentas por pagar a los proveedores. ';
-- Add comments to the columns 
comment on column PV_PAGOS.pagos_id
  is 'Es el identificador de la tabla.';
comment on column PV_PAGOS.estado
  is 'Estado activo = A
estado inactivo = I.';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_PAGOS
  add primary key (PAGOS_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_PAGOS
  add constraint FK_PV_CUENTAS_POR_PAGAR_ID foreign key (PV_CUENTAS_POR_PAGAR_ID)
  references PV_CUENTAS_POR_PAGAR (CUENTAS_POR_PAGAR_ID);


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_CODIGO_BARRAS_PRODUCTOS
(
  codigo_barras_producto_id NUMBER generated always as identity,
  pv_producto_id            NUMBER not null,
  codigo_barras             NUMBER not null,
  estado                    VARCHAR2(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
-- Add comments to the table 
comment on table PV_CODIGO_BARRAS_PRODUCTOS
  is 'Es la tabla encarga de mantener los distintos codigos de barras referente
a los productos.';
-- Add comments to the columns 
comment on column PV_CODIGO_BARRAS_PRODUCTOS.codigo_barras_producto_id
  is 'Identificador de la tabla';
comment on column PV_CODIGO_BARRAS_PRODUCTOS.pv_producto_id
  is 'Es el identificador de la llave foranea de los productos a la
que se relacionan los codigos de barras.';
comment on column PV_CODIGO_BARRAS_PRODUCTOS.codigo_barras
  is 'Codigo de barras.';
comment on column PV_CODIGO_BARRAS_PRODUCTOS.estado
  is 'Estado activo = A
estado inactivo = I';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_CODIGO_BARRAS_PRODUCTOS
  add primary key (CODIGO_BARRAS_PRODUCTO_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table PV_CODIGO_BARRAS_PRODUCTOS
  add constraint FK_PV_PRODUCTO_ID foreign key (PV_PRODUCTO_ID)
  references PV_PRODUCTO (PRODUCTO_ID);


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_HISTORIAL_PRECIOS_PRODUCTO
(
  historial_precios_producto_id NUMBER generated always as identity,
  pv_producto_id                NUMBER not null,
  precio_anterior               FLOAT not null,
  precio_nuevo                  FLOAT not null,
  estado                        VARCHAR2(1) default 'A' not null,
  fecha_cambio                  DATE not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_HISTORIAL_PRECIOS_PRODUCTO
  is 'Tabla encargada de almacenar el registro de cambio de precios de los prodectos.';
-- Add comments to the columns 
comment on column PV_HISTORIAL_PRECIOS_PRODUCTO.historial_precios_producto_id
  is 'Es el identificador de la tabla.';
comment on column PV_HISTORIAL_PRECIOS_PRODUCTO.pv_producto_id
  is 'Es el identificador de la llave foranea del producto que se le cambio el nombre.';
comment on column PV_HISTORIAL_PRECIOS_PRODUCTO.precio_anterior
  is 'Precio anterior al cambio.';
comment on column PV_HISTORIAL_PRECIOS_PRODUCTO.precio_nuevo
  is 'Precio nuevo del producto.';
comment on column PV_HISTORIAL_PRECIOS_PRODUCTO.estado
  is 'Estado activo = A
estado inactivo = I.';
comment on column PV_HISTORIAL_PRECIOS_PRODUCTO.fecha_cambio
  is 'Fecha en la que se realizo el cambio de precio.';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_HISTORIAL_PRECIOS_PRODUCTO
  add primary key (HISTORIAL_PRECIOS_PRODUCTO_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_HISTORIAL_PRECIOS_PRODUCTO
  add constraint FK_PV_PRODUCTOS_ID4 foreign key (PV_PRODUCTO_ID)
  references PV_PRODUCTO (PRODUCTO_ID);


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_DETALLE_FACTURA
(
  detalle_factura_id NUMBER generated always as identity,
  pv_producto_id     NUMBER not null,
  pv_factura_id      NUMBER not null,
  precio             FLOAT not null,
  impuesto           FLOAT,
  descuento          FLOAT,
  cantidad           NUMBER not null,
  estado             VARCHAR2(1) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table PV_DETALLE_FACTURA
  is 'Tabla encargada de guardar la informacion necesaria de una factura.';
-- Add comments to the columns 
comment on column PV_DETALLE_FACTURA.detalle_factura_id
  is 'Es el identificador de la tabla.';
comment on column PV_DETALLE_FACTURA.pv_producto_id
  is 'Es el identificador de la llave foranea de los productos a la que se relaciona la factura.';
comment on column PV_DETALLE_FACTURA.pv_factura_id
  is 'Es el identificador de la llave foranea de la factura a la que esta relacionada este detalle.';
comment on column PV_DETALLE_FACTURA.precio
  is 'Precio del producto en el momento de la compra.';
comment on column PV_DETALLE_FACTURA.impuesto
  is 'Impuesto del producto en el momento de la compra.';
comment on column PV_DETALLE_FACTURA.descuento
  is 'Descuento del producto en el momento de la compra.';
comment on column PV_DETALLE_FACTURA.cantidad
  is 'Cantidad de productos en el momento de la compra.';
comment on column PV_DETALLE_FACTURA.estado
  is 'Estado activo = A
estado inactivo = I.';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_DETALLE_FACTURA
  add primary key (DETALLE_FACTURA_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_DETALLE_FACTURA
  add constraint FK_PV_FACTURA_ID3 foreign key (PV_FACTURA_ID)
  references PV_FACTURA (FACTURA_ID);
alter table PV_DETALLE_FACTURA
  add constraint FK_PV_PRODUCTOS_ID2 foreign key (PV_PRODUCTO_ID)
  references PV_PRODUCTO (PRODUCTO_ID);


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_TOMA_FISICA
(
  toma_fisica_id NUMBER generated always as identity,
  descripcion    VARCHAR2(100) not null,
  fecha          DATE not null,
  estado         VARCHAR2(1) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_TOMA_FISICA
  add primary key (TOMA_FISICA_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_DETALLE_TOMA_FISICA
(
  detalle_toma_fisica_id NUMBER generated always as identity,
  pv_toma_fisica_id      NUMBER not null,
  pv_producto_id         NUMBER not null,
  pv_inventario_id       NUMBER not null,
  cantidad               NUMBER not null,
  estado                 VARCHAR2(1) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_DETALLE_TOMA_FISICA
  add primary key (DETALLE_TOMA_FISICA_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_DETALLE_TOMA_FISICA
  add constraint PV_INVENTARIO_ID foreign key (PV_INVENTARIO_ID)
  references PV_INVENTARIO (INVENTARIO_ID);
alter table PV_DETALLE_TOMA_FISICA
  add constraint PV_PRODUCTO_ID foreign key (PV_PRODUCTO_ID)
  references PV_PRODUCTO (PRODUCTO_ID);
alter table PV_DETALLE_TOMA_FISICA
  add constraint PV_TOMA_FISICA_ID foreign key (PV_TOMA_FISICA_ID)
  references PV_TOMA_FISICA (TOMA_FISICA_ID);


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_ROBO_DAÑO
(
  robo_daño_id NUMBER generated always as identity,
  pv_sede_id   NUMBER not null,
  fecha        DATE not null,
  tipo         VARCHAR2(2) not null,
  total        FLOAT not null,
  estado       VARCHAR2(1) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column PV_ROBO_DAÑO.tipo
  is 'ROBO = R DAÑO = D';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_ROBO_DAÑO
  add primary key (ROBO_DAÑO_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_ROBO_DAÑO
  add constraint FK_PV_SEDE_ID1 foreign key (PV_SEDE_ID)
  references PV_SEDE (SEDE_ID);


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_DETALLE_ROBO_DAÑO
(
  datelle_robo_daño_id NUMBER generated always as identity,
  pv_robo_daño_id      NUMBER not null,
  pv_producto_id       NUMBER not null,
  cantidad             FLOAT not null,
  valor                FLOAT not null,
  estado               VARCHAR2(1) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column PV_DETALLE_ROBO_DAÑO.datelle_robo_daño_id
  is '_';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_DETALLE_ROBO_DAÑO
  add primary key (DATELLE_ROBO_DAÑO_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PV_DETALLE_ROBO_DAÑO
  add constraint FK_PV_PRODUCTO_ID2 foreign key (PV_PRODUCTO_ID)
  references PV_PRODUCTO (PRODUCTO_ID);
alter table PV_DETALLE_ROBO_DAÑO
  add constraint FK_PV_PV_ROBO_DAÑO_ID foreign key (PV_ROBO_DAÑO_ID)
  references PV_ROBO_DAÑO (ROBO_DAÑO_ID);


-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_TIPO_PAGO_DETALLE
(
  tipo_pago_id        NUMBER generated always as identity,
  pv_factura_id       NUMBER not null,
  tipo_pago           VARCHAR2(50) not null,
  numero_de_documento VARCHAR2(50),
  monto               FLOAT not null,
  estado              VARCHAR2(1) not null
)
tablespace USERS
  pctfree 0
  initrans 1
  maxtrans 255
compress;
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_TIPO_PAGO_DETALLE
  add primary key (TIPO_PAGO_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table PV_TIPO_PAGO_DETALLE
  add constraint FK_FACTURA_ID foreign key (PV_FACTURA_ID)
  references PV_FACTURA (FACTURA_ID);



-- ------------------------------------------------------------------------------------------

-- Create table
create table PV_BITACORA
(
  bitacora_id    NUMBER generated always as identity,
  actividad      VARCHAR2(50),
  ejecutor       VARCHAR2(25),
  fecha          DATE,
  tabla          VARCHAR2(20),
  datos_antiguos VARCHAR2(1000),
  datos_nuevos   VARCHAR2(1000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column PV_BITACORA.actividad
  is 'Actividad realizada como insertar, modificar o eiminar';
comment on column PV_BITACORA.ejecutor
  is 'Usuario quien realizo la accion';
comment on column PV_BITACORA.fecha
  is 'Fecha en la que se hizo el cambio';
comment on column PV_BITACORA.tabla
  is 'Tabla a la cual se le estan haciendo cambios';
comment on column PV_BITACORA.datos_antiguos
  is 'En el caso de modificar o eliminar aqui hirian los datos ';
comment on column PV_BITACORA.datos_nuevos
  is 'En el caso de modificar o insertar aqui hirian los datos nuevos ';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PV_BITACORA
  add constraint PK_BITACORA primary key (BITACORA_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );



-- ------------------------------------------------------------------------------------------



-- ------------------------------------------------------------------------------------------



-- ------------------------------------------------------------------------------------------
