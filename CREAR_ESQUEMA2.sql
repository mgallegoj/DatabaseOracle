-- ESTE ES EL QUE VA A TENER ACCESO A LOS SINONIMOS


--Ejecutar desde usuario system
-- CREAR TABLESPACES Y DATAFILES
CREATE TABLESPACE "TSTALLER2" DATAFILE 'C:\app\Chiefpc\product\21c\oradata\XE\TSTALLER2.DBF' SIZE 1000M;
CREATE TEMPORARY TABLESPACE "TSTALLER2_TEMP" TEMPFILE 'C:\app\Chiefpc\product\21c\oradata\XE\TSTALLER2_TEMP.DBF' SIZE 1000M;

--CREAR USUARIO
CREATE USER TALLER2 IDENTIFIED BY 1234 DEFAULT TABLESPACE TSTALLER2 TEMPORARY TABLESPACE TSTALLER2_TEMP;

--Dar permisos
GRANT CONNECT, RESOURCE TO TALLER2;



-- DAR ACCESO SOBRE EL PAQUETE DE EXPOSICIÓN DEL ESQUEMA PRINCIPAL
GRANT SELECT ON TALLER1.SYN_TRANSACCIONES TO TALLER2;


-- ELIMINAR TABLESPACE Y TABLESPACE TEMPORAL
--DROP TABLESPACE TSTALLER2 INCLUDING CONTENTS AND DATAFILES;
--DROP TABLESPACE TSTALLER2_TEMP INCLUDING CONTENTS AND DATAFILES;
-- Borrar usuario y todo su contenido
--DROP USER PRUEBA CASCADE;