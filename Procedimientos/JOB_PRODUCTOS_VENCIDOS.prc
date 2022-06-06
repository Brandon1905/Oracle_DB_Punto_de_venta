create or replace noneditionable procedure JOB_PRODUCTOS_VENCIDOS is
  AUX  varchar2(1000);
  AUX2 varchar2(1000);
  AUX3 varchar2(1000);
begin
  SELECT SUM(P.COSTO)
    INTO AUX2
    FROM PV_PRODUCTO P
   WHERE P.FECHA_VENCIMIENTO <= SYSDATE;

  FOR SED IN (SELECT P.PRODUCTO_ID, P.NOMBRE, P.FECHA_VENCIMIENTO, P.COSTO
                FROM PV_PRODUCTO P
               WHERE P.FECHA_VENCIMIENTO <= SYSDATE) LOOP
    AUX := AUX ||
           '-------------------------------------------------------------- ' ||
           CHR(10);
    AUX := AUX || 'ID DEL PRODUCTO: ' || SED.PRODUCTO_ID || CHR(10);
    AUX := AUX || 'NOMBRE DEL PRODUCTO: ' || SED.NOMBRE || CHR(10);
    AUX := AUX || 'FECHA DE VENCIMIENTO: ' || SED.FECHA_VENCIMIENTO ||
           CHR(10);
    AUX := AUX || 'COSTO POR PRODUCTO: ' || SED.COSTO || CHR(10);
  END LOOP;
  AUX3 := 'EL TOTAL DE LOS PRODUCTOS VENCIDOS ES DE: ' || AUX2 || CHR(10) || AUX;

  FOR SED IN (select U.CORREO FROM pv_usuarios U WHERE U.ROL = 'CORDINADOOR') LOOP
    send_mail_test.mail_test(msg_to      => SED.CORREO,
                             msg_subject => 'PRODUCTOS VENCIDOS',
                             msg_text    => AUX3);
  END LOOP;

  -- Notificar al coordinador una lista de productos vencidos, esta notificación deberá 
  -- incluir también un total, para que el coordinador defina qué hacer con ellos.

  --TRUNC(sysdate) + 1 +1/ (24)

end JOB_PRODUCTOS_VENCIDOS;
/
