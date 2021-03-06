create or replace noneditionable procedure JOB_CLIENTE_SALDO_PENDIENTE is

  aux varchar2(1000);
begin
  FOR SED IN (SELECT C.CLIENTE_ID, C.CEDULA, C.NOMBRE, C.CREDITO_ACTUAL
                FROM PV_CLIENTE C
               WHERE C.CREDITO_ACTUAL > 0
                 and exists
               (SELECT *
                        FROM PV_CUENTAS_POR_COBRAR P
                       WHERE P.PV_CLIENTE_ID = C.CLIENTE_ID
                         AND EXISTS
                       (SELECT *
                                FROM PV_ABONOS A
                               WHERE A.PV_CUENTAS_POR_COBRAR_ID =
                                     P.CUENTAS_POR_COBRAR_ID
                                 AND ((CAST(SYSDATE AS DATE) -
                                     CAST(A.FECHA AS DATE)) * 1440) >= 43800
                               ORDER BY A.FECHA DESC
                               FETCH NEXT 1 ROWS ONLY))
              
              ) LOOP
    AUX := AUX ||
           '-------------------------------------------------------------- ' ||
           CHR(10);
    AUX := AUX || 'ID DEL CLIENTE: ' || SED.CLIENTE_ID || CHR(10);
    AUX := AUX || 'CEDULA DEL CLIENTE: ' || SED.CEDULA || CHR(10);
    AUX := AUX || 'NOMBRE DEL CLIENTE: ' || SED.NOMBRE || CHR(10);
    AUX := AUX || 'CREDITO ACTUAL DEL CLIENTE: ' || SED.CREDITO_ACTUAL ||
           CHR(10);
  END LOOP;

  FOR SED IN (select U.CORREO
                FROM pv_usuarios U
               WHERE U.ROL = 'COORDINADOR'
                  OR U.ROL = 'GERENTE') LOOP
    send_mail_test.mail_test(msg_to      => SED.CORREO,
                             msg_subject => 'CLIENTES CON SALDO PENDIENTE',
                             msg_text    => AUX);
  END LOOP;

  -- Notificar al gerente, coordinador cuando exista un cliente que tenga saldo pendiente y 
  -- su ?ltimo pago haya sido realizado con m?s de un mes de antig?edad.

  -- TRUNC(sysdate) + 1 +1/ (24)
end JOB_CLIENTE_SALDO_PENDIENTE;
/
