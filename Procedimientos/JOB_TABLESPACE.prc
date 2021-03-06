create or replace noneditionable procedure JOB_TABLESPACE is

  aux varchar2(1000);
begin
  FOR SED IN (select fs.tablespace_name,
                     (df.totalspace - fs.freespace),
                     fs.freespace,
                     df.totalspace,
                     round(100 * (fs.freespace / df.totalspace))
                from (select tablespace_name,
                             round(sum(bytes) / 1048576) TotalSpace
                        from dba_data_files
                       group by tablespace_name) df,
                     (select tablespace_name,
                             round(sum(bytes) / 1048576) FreeSpace
                        from dba_free_space
                       group by tablespace_name) fs
               where df.tablespace_name = fs.tablespace_name
                 AND round(100 * (fs.freespace / df.totalspace)) < 16
              
              --df.totalspace - fs.freespace > ANY (df.totalspace *0,85)
              ) LOOP
    AUX := AUX ||
           '-------------------------------------------------------------- ' ||
           CHR(10);
    AUX := AUX || 'NOMBRE DEL TABLESPACE: ' || SED.TABLESPACE_NAME ||
           CHR(10);
    AUX := AUX || 'ESPACIO LIBRE: ' || SED.freespace || CHR(10);
    AUX := AUX || 'ESPACIO TOTAL: ' || SED.totalspace || CHR(10);
  END LOOP;

  FOR SED IN (select U.CORREO
                FROM pv_usuarios U
               WHERE U.ROL = 'GERENTE'
                  OR U.ROL = 'CORDINADOOR') LOOP
    send_mail_test.mail_test(msg_to      => SED.CORREO,
                             msg_subject => 'TABLESPACE CON UN 85% DE SU TAMA?O',
                             msg_text    => AUX);
  END LOOP;

  -- Verificar el tama?o de los tablespace, el cual no debe de exceder en un 85% su tama?o. Este proceso se 
  -- ejecutar? todos los d?as, notificar en caso de que exista inconsistencia

end JOB_TABLESPACE;
/
