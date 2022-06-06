create or replace noneditionable procedure INSERTAR_SERVICIO(tipo_              VARCHAR2,
                                                             numero_referencia_ NUMBER,
                                                             monto_             FLOAT,
                                                             USUARIO_ID         NUMBER) is
  conteo_ number;
begin

  select count(*)
    into conteo_
    from PV_USUARIOS f
   where f.usuarios_id = USUARIO_ID;

  if conteo_ > 0 then
  
    INSERT INTO PV_SERVICIO
      (TIPO, NUMERO_REFERENCIA, MONTO, ESTADO, PV_USUARIO_ID)
    VALUES
      (tipo_, numero_referencia_, monto_, 'A', USUARIO_ID);
  
  END IF;

end INSERTAR_SERVICIO;
/
