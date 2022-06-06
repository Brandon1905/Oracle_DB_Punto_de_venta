create or replace noneditionable procedure JOB_LIMITE_CLIENTE_CORDINADOR is

  AUX varchar2(1000);
begin
  FOR SED IN (SELECT C.CLIENTE_ID,
                     C.CEDULA,
                     C.NOMBRE,
                     C.CREDITO_ACTUAL,
                     C.CREDITO_MAX
                FROM PV_CLIENTE C
               WHERE C.CREDITO_ACTUAL >= (C.CREDITO_MAX * 0.85)) LOOP
    AUX := AUX ||
           '-------------------------------------------------------------- ' ||
           CHR(10);
    AUX := AUX || 'ID DEL CLIENTE: ' || SED.CLIENTE_ID || CHR(10);
    AUX := AUX || 'CEDULA DEL CLIENTE: ' || SED.CEDULA || CHR(10);
    AUX := AUX || 'NOMBRE DEL CLIENTE: ' || SED.NOMBRE || CHR(10);
    AUX := AUX || 'CREDITO ACTUAL DEL CLIENTE: ' || SED.CREDITO_ACTUAL ||
           CHR(10);
    AUX := AUX || 'CREDITO MAXIMO DEL CLIENTE: ' || SED.CREDITO_MAX ||
           CHR(10);
  END LOOP;

  FOR SED IN (select U.CORREO FROM pv_usuarios U WHERE U.ROL = 'COORDINADOR') LOOP
    send_mail_test.mail_test(msg_to      => SED.CORREO,
                             msg_subject => 'CLIENTES CON 85% DEL CREDITO PERMITIDO',
                             msg_text    => AUX);
  END LOOP;

  -- Realizar un proceso que notifique al coordinador con todos los clientes que
  -- estén con un 85% o más del saldo permitido en las cuentas por pagar.

  -- TRUNC(sysdate) + 1 +1/ (24)
end JOB_LIMITE_CLIENTE_CORDINADOR;
/
