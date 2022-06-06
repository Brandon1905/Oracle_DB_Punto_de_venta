create or replace noneditionable procedure RESPALDOS is
  handle     number;
  nombre_dmp varchar2(30);
  nombre_log varchar2(30);
  DIA        NUMBER;
begin
  SELECT EXTRACT(DAY FROM sysdate) into DIA FROM dual;
  nombre_dmp := 'Respaldo_pv_' || DIA || '.dmp';
  nombre_log := 'export_pv.log';

  --ELIMINAR VIEJO
  UTL_FILE.fremove('RESPALDO', nombre_dmp);
  UTL_FILE.fremove('RESPALDO', nombre_log);
  commit;

  --INSERTAR NUEVO

  handle := dbms_datapump.open(operation   => 'EXPORT',
                               job_mode    => 'SCHEMA',
                               remote_link => NULL,
                               job_name    => 'Respaldo',
                               version     => 'LATEST');

  dbms_datapump.add_file(handle    => handle,
                         filename  => nombre_dmp,
                         directory => 'RESPALDO');

  DBMS_DATAPUMP.add_file(handle    => handle,
                         filename  => nombre_log,
                         directory => 'RESPALDO',
                         filetype  => DBMS_DATAPUMP.KU$_FILE_TYPE_LOG_FILE);

  DBMS_DATAPUMP.metadata_filter(handle => handle,
                                name   => 'SCHEMA_EXPR',
                                value  => '= ''PV''');

  dbms_datapump.start_job(handle);
  dbms_datapump.detach(handle);
end RESPALDOS;
/
