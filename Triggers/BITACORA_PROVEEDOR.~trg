create or replace noneditionable trigger BITACORA_PROVEEDOR
  after insert or update or delete
  on pv_proveedores 
  for each row
declare
  -- local variables here
begin

CASE
    WHEN INSERTING THEN

     INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('INSERTO' , USER, SYSDATE, 'PV_PROVEEDOR','',
      '-ID proveedor: ' || :NEW.proveedores_id || ' -Limite de credito: ' || :NEW.limite_de_credito || ' -Nombre de la empresa: ' || :NEW.nombre_empresa 
|| ' -Cedula juridica: ' || :NEW.cedula_juridica || ' -Preferencias: ' || :NEW.preferencias || ' -Direccion: ' || :NEW.direccion 
|| ' -Telefono: ' || :NEW.telefono || ' -Fax: ' || :NEW.fax || ' -Email: ' || :NEW.email || ' -Saldo: ' || :NEW.saldo 
|| ' -Fecha de ingreso: ' || :NEW.fecha_ingreso_empresa_como_proveedor || ' -Cuenta bancaria: ' || :NEW.cuenta_bancaria || ' -Estado: ' || :NEW.estado);

      
    WHEN UPDATING THEN
     
  INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('MODIFICO' , USER, SYSDATE, 'PV_PROVEEDOR',
'-ID proveedor: ' || :OLD.proveedores_id || ' -Limite de credito: ' || :OLD.limite_de_credito || ' -Nombre de la empresa: ' || :OLD.nombre_empresa 
|| ' -Cedula juridica: ' || :OLD.cedula_juridica || ' -Preferencias: ' || :OLD.preferencias || ' -Direccion: ' || :OLD.direccion 
|| ' -Telefono: ' || :OLD.telefono || ' -Fax: ' || :OLD.fax || ' -Email: ' || :OLD.email || ' -Saldo: ' || :OLD.saldo 
|| ' -Fecha de ingreso: ' || :OLD.fecha_ingreso_empresa_como_proveedor || ' -Cuenta bancaria: ' || :OLD.cuenta_bancaria || ' -Estado: ' || :OLD.estado,
     
'-ID proveedor: ' || :NEW.proveedores_id || ' -Limite de credito: ' || :NEW.limite_de_credito || ' -Nombre de la empresa: ' || :NEW.nombre_empresa 
|| ' -Cedula juridica: ' || :NEW.cedula_juridica || ' -Preferencias: ' || :NEW.preferencias || ' -Direccion: ' || :NEW.direccion 
|| ' -Telefono: ' || :NEW.telefono || ' -Fax: ' || :NEW.fax || ' -Email: ' || :NEW.email || ' -Saldo: ' || :NEW.saldo 
|| ' -Fecha de ingreso: ' || :NEW.fecha_ingreso_empresa_como_proveedor || ' -Cuenta bancaria: ' || :NEW.cuenta_bancaria || ' -Estado: ' || :NEW.estado);


    WHEN DELETING THEN

  INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('ELIMINO' , USER, SYSDATE, 'PV_PROVEEDOR',
'-ID proveedor: ' || :OLD.proveedores_id || ' -Limite de credito: ' || :OLD.limite_de_credito || ' -Nombre de la empresa: ' || :OLD.nombre_empresa 
|| ' -Cedula juridica: ' || :OLD.cedula_juridica || ' -Preferencias: ' || :OLD.preferencias || ' -Direccion: ' || :OLD.direccion 
|| ' -Telefono: ' || :OLD.telefono || ' -Fax: ' || :OLD.fax || ' -Email: ' || :OLD.email || ' -Saldo: ' || :OLD.saldo 
|| ' -Fecha de ingreso: ' || :OLD.fecha_ingreso_empresa_como_proveedor || ' -Cuenta bancaria: ' || :OLD.cuenta_bancaria || ' -Estado: ' || :OLD.estado,
      '');
       
      
  END CASE;
end BITACORA_PROVEEDOR;
/
