create or replace noneditionable procedure JOB_DESCUENTOS_VENCIDOS is

  AUX varchar2(1000);
begin
  FOR SED IN (SELECT D.DESCUENTOS_ID, D.DESCUENTO, D.FECHA_VENCIMIENTO
                FROM PV_DESCUENTOS D
               WHERE ((CAST(SYSDATE AS DATE) -
                     CAST(FECHA_VENCIMIENTO AS DATE)) * 1440) <= 10080
                 AND 0 >= ((CAST(SYSDATE AS DATE) -
                     CAST(FECHA_VENCIMIENTO AS DATE)) * 1440)
                 AND D.ESTADO = 'A'
              
              ) LOOP
    AUX := AUX ||
           '-------------------------------------------------------------- ' ||
           CHR(10);
    AUX := AUX || 'ID DEL DESCUENTO: ' || SED.DESCUENTOS_ID || CHR(10);
    AUX := AUX || 'DESCUENTO DEL: ' || SED.DESCUENTO || '%' || CHR(10);
    AUX := AUX || 'FECHA DE VENCIMIENTO: ' || SED.FECHA_VENCIMIENTO ||
           CHR(10);
  END LOOP;

  FOR SED IN (select U.CORREO
                FROM pv_usuarios U
               WHERE U.ROL = 'GERENTE'
                  OR U.ROL = 'COORDINADOR') LOOP
    send_mail_test.mail_test(msg_to      => SED.CORREO,
                             msg_subject => 'DESCUENTOS CERCA DE VENCER',
                             msg_text    => AUX);
  END LOOP;

  -- Se requiere que una vez a la semana se verifique los descuentos planeados, si se 
  -- define uno para productos cerca de vencer o bien para productos con mucha 
  -- antigüedad, incluir los productos al detalle automáticamente

  -- TRUNC(sysdate) + 8 +1/ (24)
end JOB_DESCUENTOS_VENCIDOS;
/
