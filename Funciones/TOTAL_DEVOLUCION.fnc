create or replace noneditionable function TOTAL_DEVOLUCION return FLOAT is
  FunctionResult FLOAT;
begin
SELECT SUM(F.TOTAL) INTO FunctionResult
FROM PV_FACTURA F
WHERE TRUNC(F.FECHA) = TRUNC(sysdate - INTERVAL '0' DAY)
AND (F.TIPO_FACTURA = 'DVL' OR F.TIPO_FACTURA = 'dvl');

  return(FunctionResult);
end TOTAL_DEVOLUCION;
/
