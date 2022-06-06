
--      
alter session set "_ORACLE_SCRIPT"=true;


-- Create the user GERENTEPV 
create user GERENTEPV
  identified by oracle;
-- Grant/Revoke system privileges 
grant alter session to GERENTEPV;
grant create procedure to GERENTEPV;
grant create sequence to GERENTEPV;
grant create trigger to GERENTEPV with admin option;
grant create type to GERENTEPV with admin option;


-- Create the user CORDINADOR_PV
create user CORDINADOR_PV
  identified by oracle;
-- Grant/Revoke system privileges 
grant create session to CORDINADOR_PV with admin option;
grant select any sequence to CORDINADOR_PV with admin option;
grant select any table to CORDINADOR_PV with admin option;
grant select any transaction to CORDINADOR_PV with admin option;



-- Create the user ENCARGADO_INVENTARIO_PV
create user ENCARGADO_INVENTARIO_PV
  identified by oracle;
-- Grant/Revoke object privileges 
grant execute on INACTIVAR_BODEGA to ENCARGADO_INVENTARIO_PV;
grant execute on INACTIVAR_CODIGO_BARRAS_PRODUCTOS to ENCARGADO_INVENTARIO_PV;
grant execute on INACTIVAR_DETALLE_FACTURA to ENCARGADO_INVENTARIO_PV;
grant execute on INACTIVAR_DETALLE_INVENTARIO to ENCARGADO_INVENTARIO_PV;
grant execute on INACTIVAR_DETALLE_ROBO_DAÑO to ENCARGADO_INVENTARIO_PV;
grant execute on INACTIVAR_FACTURA to ENCARGADO_INVENTARIO_PV;
grant execute on INACTIVAR_INVENTARIO to ENCARGADO_INVENTARIO_PV;
grant execute on INACTIVAR_PRODUCTO to ENCARGADO_INVENTARIO_PV;
grant execute on INACTIVAR_ROBO_DAÑO to ENCARGADO_INVENTARIO_PV;
grant execute on INACTIVAR_SEDE to ENCARGADO_INVENTARIO_PV;
grant execute on INSERTAR_BODEGA to ENCARGADO_INVENTARIO_PV;
grant execute on INSERTAR_CODIGO_BARRAS to ENCARGADO_INVENTARIO_PV;
grant execute on INSERTAR_DETALLE_FACTURA to ENCARGADO_INVENTARIO_PV;
grant execute on INSERTAR_DETALLE_INVENTARIO to ENCARGADO_INVENTARIO_PV;
grant execute on INSERTAR_DETALLE_ROBO_DAÑO to ENCARGADO_INVENTARIO_PV;
grant execute on INSERTAR_FACTURA to ENCARGADO_INVENTARIO_PV;
grant execute on INSERTAR_FAMILIA to ENCARGADO_INVENTARIO_PV;
grant execute on INSERTAR_INVENTARIO to ENCARGADO_INVENTARIO_PV;
grant execute on INSERTAR_PRODUCTO to ENCARGADO_INVENTARIO_PV;
grant execute on INSERTAR_ROBO_DAÑO to ENCARGADO_INVENTARIO_PV;
grant execute on INSERTAR_SEDE to ENCARGADO_INVENTARIO_PV;
grant execute on MODIFICAR_BODEGA to ENCARGADO_INVENTARIO_PV;
grant execute on MODIFICAR_CODIGO_BARRAS to ENCARGADO_INVENTARIO_PV;
grant execute on MODIFICAR_DETALLE_INVENTARIO to ENCARGADO_INVENTARIO_PV;
grant execute on MODIFICAR_DETALLE_ROBO_DAÑO to ENCARGADO_INVENTARIO_PV;
grant execute on MODIFICAR_FACTURA to ENCARGADO_INVENTARIO_PV;
grant execute on MODIFICAR_INVENTARIO to ENCARGADO_INVENTARIO_PV;
grant execute on MODIFICAR_PRODUCTO to ENCARGADO_INVENTARIO_PV;
grant execute on MODIFICAR_ROBO_DAÑO to ENCARGADO_INVENTARIO_PV;
grant execute on MODIFICAR_SEDE to ENCARGADO_INVENTARIO_PV;
grant select, insert, update, delete, alter on PV_BODEGA to ENCARGADO_INVENTARIO_PV;
grant select, insert, update, delete, alter on PV_CODIGO_BARRAS_PRODUCTOS to ENCARGADO_INVENTARIO_PV;
grant select, insert, update, delete, alter on PV_DETALLE_FACTURA to ENCARGADO_INVENTARIO_PV;
grant select, insert, update, delete, alter on PV_DETALLE_INVENTARIO to ENCARGADO_INVENTARIO_PV;
grant select, insert, update, delete, alter on PV_DETALLE_ROBO_DAÑO to ENCARGADO_INVENTARIO_PV;
grant select, insert, update, delete, alter on PV_FACTURA to ENCARGADO_INVENTARIO_PV;
grant select, insert, update, delete, alter on PV_FAMILIA to ENCARGADO_INVENTARIO_PV;
grant select, insert, update, delete, alter on PV_HISTORIAL_PRECIOS_PRODUCTO to ENCARGADO_INVENTARIO_PV;
grant select, insert, update, delete, alter on PV_INVENTARIO to ENCARGADO_INVENTARIO_PV;
grant select, insert, update, delete, alter on PV_PRODUCTO to ENCARGADO_INVENTARIO_PV;
grant select, insert, update, delete, alter on PV_ROBO_DAÑO to ENCARGADO_INVENTARIO_PV;
grant select, insert, update, delete, alter on PV_SEDE to ENCARGADO_INVENTARIO_PV;
-- Grant/Revoke role privileges 
grant connect to ENCARGADO_INVENTARIO_PV with admin option;
grant encargados_inventarios_pv to ENCARGADO_INVENTARIO_PV with admin option;
-- Grant/Revoke system privileges 
grant create session to ENCARGADO_INVENTARIO_PV with admin option;
grant select any table to ENCARGADO_INVENTARIO_PV with admin option;
-- Set the user's default roles 
alter user ENCARGADO_INVENTARIO_PV
  default role connect;



-- Create the user CAJERO_PV
create user CAJERO_PV
  identified by oracle;
-- Grant/Revoke object privileges 
grant execute on INACTIVAR_ABONOS to CAJERO_PV;
grant execute on INACTIVAR_CLIENTE to CAJERO_PV;
grant execute on INACTIVAR_DETALLE_FACTURA to CAJERO_PV;
grant execute on INACTIVAR_DETALLE_TOMA_FISICA to CAJERO_PV;
grant execute on INACTIVAR_FACTURA to CAJERO_PV;
grant execute on INACTIVAR_PAGOS to CAJERO_PV;
grant execute on INACTIVAR_SERVICIO to CAJERO_PV;
grant execute on INACTIVAR_TIPO_PAGO to CAJERO_PV;
grant execute on INACTIVAR_TOMA_FISICA to CAJERO_PV;
grant execute on INSERTAR_ABONOS to CAJERO_PV;
grant execute on INSERTAR_CLIENTE to CAJERO_PV;
grant execute on INSERTAR_DETALLE_FACTURA to CAJERO_PV;
grant execute on INSERTAR_DETALLE_TOMA_FISICA to CAJERO_PV;
grant execute on INSERTAR_FACTURA to CAJERO_PV;
grant execute on INSERTAR_PAGOS to CAJERO_PV;
grant execute on INSERTAR_SERVICIO to CAJERO_PV;
grant execute on INSERTAR_TIPO_PAGO_DETALLE to CAJERO_PV;
grant execute on INSERTAR_TOMA_FISICA to CAJERO_PV;
grant execute on MODIFICAR_ABONOS to CAJERO_PV;
grant execute on MODIFICAR_CLIENTE to CAJERO_PV;
grant execute on MODIFICAR_DETALLE_TOMA_FISICA to CAJERO_PV;
grant execute on MODIFICAR_FACTURA to CAJERO_PV;
grant execute on MODIFICAR_PAGOS to CAJERO_PV;
grant execute on MODIFICAR_SERVICIO to CAJERO_PV;
grant execute on MODIFICAR_TIPO_PAGO_DETALLE to CAJERO_PV;
grant execute on MODIFICAR_TOMA_FISICA to CAJERO_PV;
grant select, insert, update, delete on PV_ABONOS to CAJERO_PV;
grant select, insert, update, delete on PV_CLIENTE to CAJERO_PV;
grant select, insert, update, delete on PV_DETALLE_FACTURA to CAJERO_PV;
grant select, insert, update, delete on PV_DETALLE_TOMA_FISICA to CAJERO_PV;
grant select, insert, update, delete on PV_FACTURA to CAJERO_PV;
grant select, insert, update, delete on PV_PAGOS to CAJERO_PV;
grant select, insert, update, delete on PV_SERVICIO to CAJERO_PV;
grant select, insert, update, delete on PV_TIPO_PAGO_DETALLE to CAJERO_PV;
grant select, insert, update, delete on PV_TOMA_FISICA to CAJERO_PV;
-- Grant/Revoke system privileges 
grant create session to CAJERO_PV with admin option;
grant select any table to CAJERO_PV with admin option;


