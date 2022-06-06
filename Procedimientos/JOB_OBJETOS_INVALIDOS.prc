create or replace noneditionable procedure JOB_OBJETOS_INVALIDOS is
  AUX varchar2(10000);
begin
  FOR SED IN (select OWNER, OBJECT_NAME, OBJECT_TYPE, STATUS
                from DBA_OBJECTS
               where OWNER not in ('SYS', 'SYSTEM')
                 and STATUS = 'INVALID'
               order by OWNER, OBJECT_TYPE, OBJECT_NAME) LOOP
    AUX := AUX || 'OWNER: ' || SED.OWNER || chr(10);
    AUX := AUX || 'NOMBRE DEL OBJETO: ' || SED.OBJECT_NAME || chr(10);
    AUX := AUX || 'TIPO DE OBJETO: ' || SED.OBJECT_TYPE || chr(10);
    AUX := AUX || 'ESTADO: ' || SED.STATUS || chr(10);
  END LOOP;

  FOR SED IN (select U.CORREO FROM pv_usuarios U WHERE U.ROL = 'COORDINADOR') LOOP
    send_mail_test.mail_test(msg_to      => SED.CORREO,
                             msg_subject => 'OBJETOS INVALIDOS.',
                             msg_text    => AUX);
  END LOOP;

  -- Verifica si existen objetos inválidos. Este proceso se ejecutará todos los días 
  -- TRUNC(sysdate)+1 +1/ (24)
end JOB_OBJETOS_INVALIDOS;
/
