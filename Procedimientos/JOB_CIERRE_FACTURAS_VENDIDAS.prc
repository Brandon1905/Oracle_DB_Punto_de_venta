create or replace noneditionable procedure JOB_CIERRE_FACTURAS_VENDIDAS is

  aux  varchar2(1000);
  aux2 varchar2(1000);
begin

  FOR SED IN (SELECT F.PV_USUARIO_ID, F.FECHA
                FROM PV_FACTURA F
               WHERE TRUNC(F.FECHA) = TRUNC(sysdate - INTERVAL '0' DAY)
                 AND (F.TIPO_FACTURA = 'FAC' OR F.TIPO_FACTURA = 'CPC' OR
                      F.TIPO_FACTURA = 'fac' OR F.TIPO_FACTURA = 'cpc')
               GROUP BY F.PV_USUARIO_ID, F.FECHA
              
              ) LOOP
    AUX := AUX ||
           '-------------------------------------------------------------- ' ||
           CHR(10);
    AUX := AUX || 'FECHA: ' || SYSDATE || CHR(10);
    AUX := AUX || 'TOTAL VENDIDO: ' ||
           TOTAL_VENDIDO_USUARIO(SED.PV_USUARIO_ID, SED.FECHA) || CHR(10);
    AUX := AUX || 'CAJERO: ' || SED.PV_USUARIO_ID || CHR(10);
  
  END LOOP;

  AUX := 'TOTAL VENDIDO EN EL DIA: ' || TOTAL_VENDIDO() || '.' || CHR(10) || AUX ||
         CHR(10);
  AUX := 'CIERRE DIARIO DE LAS VENTAS EJECUTADO POR EL SISTEMAS PUNTO DE VENTA.' ||
         CHR(10) || AUX;

  FOR SED IN (select U.CORREO
                FROM pv_usuarios U
               WHERE U.ROL = 'GERENTE'
                  OR U.ROL = 'COORDINADOR') LOOP
    send_mail_test.mail_test(msg_to      => SED.CORREO,
                             msg_subject => 'CIERRE DE LAS FACTURAS VENDIDAS',
                             msg_text    => AUX);
  END LOOP;

  FOR SED IN (SELECT F.PV_USUARIO_ID, F.FECHA
                FROM PV_FACTURA F
               WHERE TRUNC(F.FECHA) = TRUNC(sysdate - INTERVAL '0' DAY)
                 AND (F.TIPO_FACTURA = 'DVL' OR F.TIPO_FACTURA = 'dvl')
               GROUP BY F.PV_USUARIO_ID, F.FECHA
              
              ) LOOP
    AUX2 := AUX2 ||
            '-------------------------------------------------------------- ' ||
            CHR(10);
    AUX2 := AUX2 || 'FECHA: ' || SYSDATE || CHR(10);
    AUX2 := AUX2 || 'TOTAL DEVUELTO: ' ||
            TOTAL_DEVOLUCION_USUARIO(SED.PV_USUARIO_ID, SED.FECHA) ||
            CHR(10);
    AUX2 := AUX2 || 'CAJERO: ' || SED.PV_USUARIO_ID || CHR(10);
  
  END LOOP;

  AUX2 := 'TOTAL DEVUELTO EN EL DIA: ' || TOTAL_DEVOLUCION() || '.' ||
          CHR(10) || AUX2 || CHR(10);
  AUX2 := 'CIERRE DIARIO DE LAS DEVOLUCIONES EJECUTADO POR EL SISTEMAS PUNTO DE VENTA.' ||
          CHR(10) || AUX2;
  FOR SED IN (select U.CORREO
                FROM pv_usuarios U
               WHERE U.ROL = 'GERENTE'
                  OR U.ROL = 'COORDINADOR') LOOP
    send_mail_test.mail_test(msg_to      => SED.CORREO,
                             msg_subject => 'CIERRE DE LAS DEVOLUCIONES',
                             msg_text    => AUX2);
  END LOOP;

  -- ? Se deber? incluir un proceso para realizar los cierres diarios, este cierre se ejecutar? 
  -- autom?ticamente y el resultado se la notificar? al coordinador y gerente. (Un cierre 
  -- es necesario, incluir los detalles b?sicos como fecha, cantidad vendido, devoluciones 
  -- y total, en el detalle del cierre se incluir? el cajero y cantidad vendida y devoluciones) 

  -- TRUNC(sysdate) + 1 +1/ (24)  
end JOB_CIERRE_FACTURAS_VENDIDAS;
/
