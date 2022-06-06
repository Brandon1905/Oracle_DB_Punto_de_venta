create or replace noneditionable function TOTAL_FACTURA(FACTURA_ID_ IN number) return FLOAT is
  FunctionResult FLOAT;
begin
  SELECT F.TOTAL INTO FunctionResult
  FROM PV_FACTURA F
  WHERE F.FACTURA_ID = FACTURA_ID_;
  return(FunctionResult);
end TOTAL_FACTURA;
/
