create or replace noneditionable procedure JOB_INDICES_MALOS is
  AUX varchar2(10000);
begin
  FOR SED IN (SELECT D.OWNER, D.INDEX_NAME, D.TABLESPACE_NAME, D.STATUS
                FROM DBA_INDEXES D
               WHERE STATUS = 'UNUSABLE') LOOP
    AUX := AUX || 'OWNER' || SED.owner || chr(10);
    AUX := AUX || 'INDEX: ' || SED.index_name || chr(10);
    AUX := AUX || 'NOMBRE DEL TABLESPACE: ' || SED.tablespace_name ||
           chr(10);
    AUX := AUX || 'ESTADO: ' || SED.STATUS || chr(10);
  END LOOP;

  FOR SED IN (select U.CORREO FROM pv_usuarios U WHERE U.ROL = 'COORDINADOR') LOOP
    send_mail_test.mail_test(msg_to      => SED.CORREO,
                             msg_subject => 'INDICES MALOS.',
                             msg_text    => AUX);
  END LOOP;

  -- En ocasiones los índices se dañan, verificar y notificar cuando esto sucede. Este 
  -- proceso se ejecutará todos los días, notificar en caso de que exista inconsistencia
  -- TRUNC(sysdate)+1 +1/ (24)
end JOB_INDICES_MALOS;
/
