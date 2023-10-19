/************************************************************************************
Descripción: BODY, package para procedimiento para cambiar STATUS a "Pagado" y
			 para job que cambia STATUS a "Vencido" si no pagó a tiempo.
			 si STATUS es "Sin pagar"
Autor:       Manuel Alejandro Gallego Jiménez
Fecha:       17-10-2023 (DD/MM/AA)
IdGestión:   
@copyright: 
************************************************************************************/


CREATE OR REPLACE PACKAGE BODY PKG_DISCOUNT_REGISTRATION IS
	-- Procedimiento que cambia STATUS a "Pagado" si su valor era "Sin pagar"
	PROCEDURE UpdateStatus(p_property_id INTEGER) IS
	BEGIN
		UPDATE APP_PAGO_PREDIAL.PGP_DISCOUNT_REGISTRATION
		SET STATUS = 'Pagado'
		WHERE ID_PROPERTY = p_property_id AND STATUS = 'Sin pagar';
		COMMIT;
	END UpdateStatus;

	-- Procedimiento, JOB para actualizar el estado después de "DEADLINE_DATE"
	-- Creo un procedimiento que recibe un lote individual y realiza la actualizacion
	PROCEDURE UpdateDiscountStatusForID(p_id NUMBER) IS
		max_retries CONSTANT NUMBER := 2; -- Número máximo de reintentos
		retry_count NUMBER := 0; -- Contador de reintentos
	BEGIN
		-- Inicia un bucle para los reintentos
		WHILE retry_count < max_retries LOOP
			-- Logica principal
			UPDATE APP_PAGO_PREDIAL.PGP_DISCOUNT_REGISTRATION
			SET STATUS = 'Vencido'
			WHERE ID_DISCOUNT_REGISTRATION = p_id;
			COMMIT;
			EXIT;
		END LOOP;
	EXCEPTION
		WHEN OTHERS THEN
			-- Se produjo un error, realiza un rollback o maneja el error como sea necesario
			ROLLBACK;
			-- Incrementa el contador de reintentos
		    retry_count := retry_count + 1;
	END UpdateDiscountStatusForID;

	-- Procedimiento para realizar el procesamiento por lotes en general
	PROCEDURE CheckAndUpdateStatus IS
		v_default_date DATE := TO_DATE('2023-11-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'); 
		CURSOR cur_discounts IS
		SELECT  ID_DISCOUNT_REGISTRATION
		FROM APP_PAGO_PREDIAL.PGP_DISCOUNT_REGISTRATION
		WHERE STATUS = 'Sin pagar' AND v_default_date > DEADLINE_DATE;
		TYPE id_tab_type IS TABLE OF NUMBER;
		ids id_tab_type;
		-- Tamaño del lote
		BATCH_SIZE CONSTANT NUMBER := 1;
	BEGIN
		OPEN cur_discounts;
		LOOP
			FETCH cur_discounts BULK COLLECT INTO ids LIMIT BATCH_SIZE;
			EXIT WHEN ids.COUNT = 0;
	        -- Llamar al procedimiento que actualiza un lote individual
	        FOR i IN 1..ids.COUNT LOOP
	        	UpdateDiscountStatusForID(ids(i));
	        END LOOP;
		END LOOP;
	    CLOSE cur_discounts;
	END CheckAndUpdateStatus;

END PKG_DISCOUNT_REGISTRATION;