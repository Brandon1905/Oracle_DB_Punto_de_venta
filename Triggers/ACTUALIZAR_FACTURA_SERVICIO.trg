create or replace noneditionable trigger ACTUALIZAR_FACTURA_SERVICIO
  after insert
  on pv_servicio 
  for each row
declare
  -- local variables here
begin
  
INSERT INTO PV_FACTURA(PV_SERVICIO_ID,
                       FECHA,
                       TOTAL,
  
                     SUB_TOTAL,
                       DESCUENTO,
                       IMPUESTO,
                       FECHA_CANCELACION,
                       FECHA_VENCIMIENTO,
                       ESTADO_FACTURA,
                       TIPO_FACTURA,
                       ESTADO,
                       PV_USUARIO_ID)
VALUES(:NEW.SERVICIO_ID,SYSDATE,:NEW.MONTO,0,0,0,SYSDATE,SYSDATE,'C','SER','A',:NEW.PV_USUARIO_ID);                       
  
end ACTUALIZAR_FACTURA_SERVICIO;
/
