create or replace noneditionable procedure JOB_AYUDA_MERCADEO_VENCIMIENTO is

  aux varchar2(1000);
begin
  FOR SED IN (SELECT P.PRODUCTO_ID, P.NOMBRE, P.FECHA_VENCIMIENTO
                FROM PV_PRODUCTO P
               WHERE 0 >= ((CAST(SYSDATE AS DATE) -
                     CAST(FECHA_VENCIMIENTO AS DATE)) * 1440)
                 AND ((CAST(SYSDATE AS DATE) -
                     CAST(FECHA_VENCIMIENTO AS DATE)) * 1440) <= 10080) LOOP
    AUX := AUX ||
           '-------------------------------------------------------------- ' ||
           CHR(10);
    AUX := AUX || 'ID DEL PRODUCTO: ' || SED.PRODUCTO_ID || CHR(10);
    AUX := AUX || 'NOMBRE DEL PRODUCTO: ' || SED.NOMBRE || CHR(10);
    AUX := AUX || 'FECHA DE VENCIMIENTO: ' || SED.FECHA_VENCIMIENTO ||
           CHR(10);
  END LOOP;

  FOR SED IN (select U.CORREO FROM pv_usuarios U WHERE U.ROL = 'COORDINADOR') LOOP
    send_mail_test.mail_test(msg_to      => SED.CORREO,
                             msg_subject => 'PRODUCTOS A VENCERSE A UNA SEMANA',
                             msg_text    => AUX);
  END LOOP;

  -- En miras de ayudar al departamento de mercadeo se solicita implementar un 
  -- procedimiento que se ejecute cada semana, el cual me indique por separado cuales 
  -- de los productos que están por vencerse (a una semana)
  -- TRUNC(sysdate) + 8 +1/ (24)

end JOB_AYUDA_MERCADEO_VENCIMIENTO;
/
