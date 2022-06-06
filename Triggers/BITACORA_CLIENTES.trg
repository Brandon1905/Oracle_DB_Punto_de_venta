create or replace noneditionable trigger BITACORA_CLIENTES
  after insert or update or delete
  on pv_cliente 
  for each row
declare
  -- local variables here
begin

CASE
    WHEN INSERTING THEN

     INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('INSERTO' , USER, SYSDATE, 'CLIENTE','',
'-ID CLIENTE: ' ||:NEW.cliente_id || ' -Cedula: ' ||:NEW.cedula || ' -Nombre: ' ||:NEW.nombre || ' -Apellidos: ' ||:NEW.apellidos   
|| ' -Tipo: ' ||:NEW.tipo || ' -Preferencias: ' ||:NEW.preferencias || ' -Estado civil: ' ||:NEW.estado_civil || ' -Direccion: ' ||:NEW.direccion    
|| ' -Telefono: ' ||:NEW.telefono || ' -Nacionalidad: ' ||:NEW.nacionalidad || ' -Referencia: ' ||:NEW.residencia || ' -Fax: ' ||:NEW.fax   
|| ' -Sexo: ' ||:NEW.sexo || ' -Fecha nacimiento: ' ||:NEW.fecha_nacimiento || ' -Puesto: ' ||:NEW.puesto || ' -Empresa dinde labora: ' ||:NEW.empresa_donde_labora   
|| ' -Seguro: ' ||:NEW.posee_seguro || ' -Escolariadad: ' ||:NEW.escolaridad || ' -Fecha de ingreso: ' ||:NEW.fecha_ingreso_empresa_como_cliente || ' -Credito maximo: ' ||:NEW.credito_max   
|| ' -Credito actual: ' ||:NEW.credito_actual || ' -Estado: ' ||:NEW.estado || ' -Correo electronico: ' ||:NEW.correo_electronico ||' -Acciones: ' || :NEW.ACCIONES);

      
    WHEN UPDATING THEN

  INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('MODIFICO' , USER, SYSDATE, 'CLIENTE',
      '-ID CLIENTE: ' ||:OLD.cliente_id || ' -Cedula: ' ||:OLD.cedula || ' -Nombre: ' ||:OLD.nombre || ' -Apellidos: ' ||:OLD.apellidos   
|| ' -Tipo: ' ||:OLD.tipo || ' -Preferencias: ' ||:OLD.preferencias || ' -Estado civil: ' ||:OLD.estado_civil || ' -Direccion: ' ||:OLD.direccion    
|| ' -Telefono: ' ||:OLD.telefono || ' -Nacionalidad: ' ||:OLD.nacionalidad || ' -Referencia: ' ||:OLD.residencia || ' -Fax: ' ||:OLD.fax   
|| ' -Sexo: ' ||:OLD.sexo || ' -Fecha nacimiento: ' ||:OLD.fecha_nacimiento || ' -Puesto: ' ||:OLD.puesto || ' -Empresa dinde labora: ' ||:OLD.empresa_donde_labora   
|| ' -Seguro: ' ||:OLD.posee_seguro || ' -Escolariadad: ' ||:OLD.escolaridad || ' -Fecha de ingreso: ' ||:OLD.fecha_ingreso_empresa_como_cliente || ' -Credito maximo: ' ||:OLD.credito_max   
|| ' -Credito actual: ' ||:OLD.credito_actual || ' -Estado: ' ||:OLD.estado || ' -Correo electronico: ' ||:OLD.correo_electronico ||' -Acciones: ' || :OLD.ACCIONES,
      
      '-ID CLIENTE: ' ||:NEW.cliente_id || ' -Cedula: ' ||:NEW.cedula || ' -Nombre: ' ||:NEW.nombre || ' -Apellidos: ' ||:NEW.apellidos   
|| ' -Tipo: ' ||:NEW.tipo || ' -Preferencias: ' ||:NEW.preferencias || ' -Estado civil: ' ||:NEW.estado_civil || ' -Direccion: ' ||:NEW.direccion    
|| ' -Telefono: ' ||:NEW.telefono || ' -Nacionalidad: ' ||:NEW.nacionalidad || ' -Referencia: ' ||:NEW.residencia || ' -Fax: ' ||:NEW.fax   
|| ' -Sexo: ' ||:NEW.sexo || ' -Fecha nacimiento: ' ||:NEW.fecha_nacimiento || ' -Puesto: ' ||:NEW.puesto || ' -Empresa dinde labora: ' ||:NEW.empresa_donde_labora   
|| ' -Seguro: ' ||:NEW.posee_seguro || ' -Escolariadad: ' ||:NEW.escolaridad || ' -Fecha de ingreso: ' ||:NEW.fecha_ingreso_empresa_como_cliente || ' -Credito maximo: ' ||:NEW.credito_max   
|| ' -Credito actual: ' ||:NEW.credito_actual || ' -Estado: ' ||:NEW.estado || ' -Correo electronico: ' ||:NEW.correo_electronico ||' -Acciones: ' || :NEW.ACCIONES);

    WHEN DELETING THEN

  INSERT INTO PV_BITACORA(ACTIVIDAD,EJECUTOR,FECHA,TABLA,DATOS_ANTIGUOS,DATOS_NUEVOS)
      VALUES('ELIMINO' , USER, SYSDATE, 'CLIENTE',
            '-ID CLIENTE: ' ||:OLD.cliente_id || ' -Cedula: ' ||:OLD.cedula || ' -Nombre: ' ||:OLD.nombre || ' -Apellidos: ' ||:OLD.apellidos   
|| ' -Tipo: ' ||:OLD.tipo || ' -Preferencias: ' ||:OLD.preferencias || ' -Estado civil: ' ||:OLD.estado_civil || ' -Direccion: ' ||:OLD.direccion    
|| ' -Telefono: ' ||:OLD.telefono || ' -Nacionalidad: ' ||:OLD.nacionalidad || ' -Referencia: ' ||:OLD.residencia || ' -Fax: ' ||:OLD.fax   
|| ' -Sexo: ' ||:OLD.sexo || ' -Fecha nacimiento: ' ||:OLD.fecha_nacimiento || ' -Puesto: ' ||:OLD.puesto || ' -Empresa dinde labora: ' ||:OLD.empresa_donde_labora   
|| ' -Seguro: ' ||:OLD.posee_seguro || ' -Escolariadad: ' ||:OLD.escolaridad || ' -Fecha de ingreso: ' ||:OLD.fecha_ingreso_empresa_como_cliente || ' -Credito maximo: ' ||:OLD.credito_max   
|| ' -Credito actual: ' ||:OLD.credito_actual || ' -Estado: ' ||:OLD.estado || ' -Correo electronico: ' ||:OLD.correo_electronico || ' -Acciones: ' || :OLD.ACCIONES,
      '');
       
  END CASE;
  
end BITACORA_CLIENTES;
/
