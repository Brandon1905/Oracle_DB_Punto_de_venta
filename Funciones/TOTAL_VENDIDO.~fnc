create or replace noneditionable function TOTAL_VENDIDO return FLOAT is
  FunctionResult FLOAT;
begin
SELECT SUM(F.TOTAL) INTO FunctionResult
FROM PV_FACTURA F
WHERE TRUNC(FECHA) = TRUNC(sysdate - INTERVAL '0' DAY)AND (F.TIPO_FACTURA = 'FAC' OR F.TIPO_FACTURA = 'CPC' OR F.TIPO_FACTURA = 'fac' 
OR F.TIPO_FACTURA = 'cpc' );

  return(FunctionResult);
end TOTAL_VENDIDO;
/
