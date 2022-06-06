create or replace noneditionable function ENCRIPTADO(DATO in varchar2) return varchar2 is
  encriptado RAW(128);
begin
  encriptado  := utl_raw.cast_to_raw(DATO);
  return(encriptado);
end ENCRIPTADO;
/
