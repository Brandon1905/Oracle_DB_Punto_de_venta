create or replace noneditionable function CANTIDAD_ACCIONES(CANTIDAD_PRODUCTOS IN NUMBER,PRODUCTO_ACCIONES IN NUMBER) return number is
 RESULTADO number:=0;
 I number:=0;
begin
    while RESULTADO + PRODUCTO_ACCIONES <= CANTIDAD_PRODUCTOS loop
      
         RESULTADO := RESULTADO + PRODUCTO_ACCIONES;
         I := I + 1;
    
    end loop;
  
  return(I);
end CANTIDAD_ACCIONES;
/
