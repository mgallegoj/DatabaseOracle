/************************************************************************************
Descripción: Job encargado de la ejecución automatica del procedure CheckAndUpdateStatus
Autor:       Manuel Alejandro Gallego Jiménez
Fecha:       18-10-2023 (DD/MM/AA)
IdGestión:   
@copyright: 
************************************************************************************/

BEGIN
  DBMS_SCHEDULER.create_job (
    job_name        => 'VALIDATION_JOB',
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'BEGIN PKG_DISCOUNT_REGISTRATION.CheckAndUpdateStatus; END;',
    start_date      => TRUNC(SYSDATE) + INTERVAL '0 00:00:00' DAY TO SECOND, -- Comienza hoy a las 00:00
    repeat_interval => 'FREQ=DAILY; BYHOUR=00; BYMINUTE=0; BYSECOND=0', -- Diariamente a las 00:00
    enabled         => TRUE
  );
END;
