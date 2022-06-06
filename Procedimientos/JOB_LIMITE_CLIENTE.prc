create or replace noneditionable procedure JOB_LIMITE_CLIENTE is
  aux varchar2(1000);
begin
  FOR SED IN (SELECT C.CLIENTE_ID,
                     C.CEDULA,
                     C.NOMBRE,
                     C.CREDITO_ACTUAL,
                     C.CREDITO_MAX,
                     C.CORREO_ELECTRONICO
                FROM PV_CLIENTE C
               WHERE C.CREDITO_ACTUAL >= (C.CREDITO_MAX * 0.85)) LOOP
    AUX := '';
    AUX := AUX ||
           'SU CREDITO ACTUAL CUENTA CON UN 85% DEL CREDITO MAXIMO PERMITIDO EN SUS CUENTAS POR COBRAR' ||
           CHR(10);
    AUX := AUX || 'SE ADJUNTAN DATOS:' || CHR(10);
    AUX := AUX || 'ID DEL CLIENTE: ' || SED.CLIENTE_ID || CHR(10);
    AUX := AUX || 'CEDULA DEL CLIENTE: ' || SED.CEDULA || CHR(10);
    AUX := AUX || 'NOMBRE DEL CLIENTE: ' || SED.NOMBRE || CHR(10);
    AUX := AUX || 'CREDITO MAXIMO DEL CLIENTE: ' || SED.CREDITO_MAX ||
           CHR(10);
    AUX := AUX || 'CREDITO ACTUAL DEL CLIENTE: ' || SED.CREDITO_ACTUAL ||
           CHR(10);
  
    send_mail_test.mail_test(msg_to      => SED.CORREO_ELECTRONICO,
                             msg_subject => 'CLIENTE CON 85% DEL CREDITO PERMITIDO',
                             msg_text    => AUX);
  END LOOP;

  -- Realizar un proceso que notifique a los clientes que cuenten con un 85% o 
  -- más de su saldo permitido en las cuentas por cobrar

  -- TRUNC(sysdate) + 1 +1/ (24)  
end JOB_LIMITE_CLIENTE;
/
