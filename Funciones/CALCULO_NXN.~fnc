create or replace noneditionable function CALCULO_NXN(NX IN INTEGER, XN IN INTEGER, CANTIDAD_PRODUCTO IN NUMBER) return INTEGER is
 RESULTADO INTEGER:=0;
 I INTEGER:=0;
begin
    while RESULTADO + NX <= CANTIDAD_PRODUCTO loop
   
         RESULTADO := RESULTADO + NX;
         I := I + 1;

    end loop;
    
    I := (I * XN)+(CANTIDAD_PRODUCTO - (I * NX));
    
  return(I);
end CALCULO_NXN;
/
