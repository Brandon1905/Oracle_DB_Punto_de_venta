create or replace noneditionable procedure MODIFICAR_USUARIO(usuarios_id_ IN NUMBER,
                                                             usuario_     IN VARCHAR2,
                                                             rol_         IN VARCHAR2,
                                                             contraseņa_  IN VARCHAR2,
                                                             correo_      IN VARCHAR2) is
  CONTEO_ID NUMBER;
BEGIN

  SELECT COUNT(*)
    INTO CONTEO_ID
    FROM pv_usuarios B
   WHERE B.USUARIOS_ID = usuarios_id_;

  IF CONTEO_ID > 0 THEN
    update PV_USUARIOS
       set usuario    = usuario_,
           rol        = rol_,
           contraseņa = ENCRIPTADO(contraseņa_),
           correo     = correo_
    
     where usuarios_id = usuarios_id_;
  
  end if;
end MODIFICAR_USUARIO;
/
