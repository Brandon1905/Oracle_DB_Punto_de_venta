create or replace noneditionable procedure JOB_PREMIAR_CLIENTES is

  aux varchar2(1000);
begin
  FOR SED IN (SELECT C.CLIENTE_ID, C.CEDULA, C.NOMBRE, C.APELLIDOS
                FROM PV_CLIENTE C
               WHERE EXISTS (select PV_CLIENTE_ID, count(*)
                        from PV_FACTURA
                       group by PV_CLIENTE_ID
                       ORDER BY PV_CLIENTE_ID ASC
                       FETCH FIRST 10 ROWS ONLY)) LOOP
    AUX := AUX ||
           '-------------------------------------------------------------- ' ||
           CHR(10);
    AUX := AUX || 'ID DEL CLIENTE: ' || SED.CLIENTE_ID || CHR(10);
    AUX := AUX || 'CEDULA: ' || SED.CEDULA || CHR(10);
    AUX := AUX || 'NOMBRE: ' || SED.NOMBRE || CHR(10);
    AUX := AUX || 'APELLIDOS: ' || SED.APELLIDOS || CHR(10);
  END LOOP;
  FOR SED IN (select U.CORREO FROM pv_usuarios U WHERE U.ROL = 'COORDINADOR') LOOP
    send_mail_test.mail_test(msg_to      => SED.CORREO,
                             msg_subject => 'CLIENTES PARA PREMAIR',
                             msg_text    => AUX);
  END LOOP;

  -- Se requiere premiar a los mejores clientes de la empresa, por este motivo, se deben obtener los 10 clientes 
  -- que m?s compren en la empresa y darles una orden de compra por 100 mil colones, este proceso se ejecutara 
  -- una vez cada 6 meses, se le notificara al coordinador de los clientes seleccionados

  --ADD_MONTHS(trunc(sysdate),6)+1/24
end JOB_PREMIAR_CLIENTES;
/
