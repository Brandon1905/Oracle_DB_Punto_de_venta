create or replace noneditionable procedure JOB_LIMITE_PROVEEDOR_CORDINADOR is

  aux varchar2(1000);
begin
  FOR SED IN (SELECT P.PROVEEDORES_ID,
                     P.CEDULA_JURIDICA,
                     P.NOMBRE_EMPRESA,
                     P.SALDO,
                     P.LIMITE_DE_CREDITO
                FROM PV_PROVEEDORES P
               WHERE (P.LIMITE_DE_CREDITO * 0.70) >= P.SALDO) LOOP
    AUX := AUX ||
           '-------------------------------------------------------------- ' ||
           CHR(10);
    AUX := AUX || 'ID DEL PROVEEDOR: ' || SED.PROVEEDORES_ID || CHR(10);
    AUX := AUX || 'CEDULA JURIDICA: ' || SED.CEDULA_JURIDICA || CHR(10);
    AUX := AUX || 'NOMBRE DEL PROVEEDOR: ' || SED.NOMBRE_EMPRESA || CHR(10);
    AUX := AUX || 'SALDO: ' || SED.SALDO || CHR(10);
    AUX := AUX || 'LIMITE DEL CREDITO: ' || SED.LIMITE_DE_CREDITO ||
           CHR(10);
  END LOOP;

  FOR SED IN (select U.CORREO FROM pv_usuarios U WHERE U.ROL = 'GERENTE') LOOP
    send_mail_test.mail_test(msg_to      => SED.CORREO,
                             msg_subject => 'PROVEEDORES CON 70% DEL CREDITO PERMITIDO',
                             msg_text    => AUX);
  END LOOP;

  -- Realizar un proceso que notifique al gerente cuando este cerca de un 70% del límite 
  -- permitido en las cuentas por pagar a proveedores, la notificación debe ser una sola 
  -- y que incluya a todos los proveedores.

  -- TRUNC(sysdate) + 1 +1/ (24)  
end JOB_LIMITE_PROVEEDOR_CORDINADOR;
/
