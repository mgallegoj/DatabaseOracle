/************************************************************************************
Descripción: BODY, package para procedimiento para cambiar STATUS a "Pagado" y
			 para job que cambia STATUS a "Vencido" si no pagó a tiempo.
Autor:       Manuel Alejandro Gallego Jiménez
Fecha:       17-10-2023 (DD/MM/AA)
IdGestión:   
@copyright: 
************************************************************************************/


CREATE OR REPLACE PACKAGE BODY PKG_DISCOUNT_REGISTRATION IS
	-- Procedure that changes STATUS to "Pagado" if its value was "Sin pagar".
	PROCEDURE UpdateStatus(p_property_id INTEGER) IS
	BEGIN
		UPDATE APP_PAGO_PREDIAL.PGP_DISCOUNT_REGISTRATION
		SET STATUS = 'Pagado'
		WHERE ID_PROPERTY = p_property_id AND STATUS = 'Sin pagar';
		COMMIT;
	END UpdateStatus;

	-- Procedure to update the status after "DEADLINE_DATE".
	-- Creates a procedure that receives an individual batch and performs the update.
	PROCEDURE UpdateDiscountStatusForID(p_id NUMBER) IS
		max_retries CONSTANT NUMBER := 2; -- Maximum number of retries
		retry_count NUMBER := 0; -- Retry counter
	BEGIN
		-- Initiates a loop for retries
		WHILE retry_count < max_retries LOOP
			UPDATE APP_PAGO_PREDIAL.PGP_DISCOUNT_REGISTRATION
			SET STATUS = 'Vencido'
			WHERE ID_DISCOUNT_REGISTRATION = p_id;
			COMMIT;
			EXIT;
		END LOOP;
	EXCEPTION
		WHEN OTHERS THEN
			-- An error occurred
			ROLLBACK;
		    retry_count := retry_count + 1;
	END UpdateDiscountStatusForID;

	-- Procedure for performing batch processing in general
	PROCEDURE CheckAndUpdateStatus IS
		v_default_date DATE := TRUNC(SYSDATE);
		CURSOR cur_discounts IS
		SELECT  ID_DISCOUNT_REGISTRATION
		FROM APP_PAGO_PREDIAL.PGP_DISCOUNT_REGISTRATION
		WHERE STATUS = 'Sin pagar' AND v_default_date > DEADLINE_DATE;
		TYPE id_tab_type IS TABLE OF NUMBER;
		ids id_tab_type;
		-- Batch size
		BATCH_SIZE CONSTANT NUMBER := 10;
	BEGIN
		OPEN cur_discounts;
		LOOP
			FETCH cur_discounts BULK COLLECT INTO ids LIMIT BATCH_SIZE;
			EXIT WHEN ids.COUNT = 0;
	        -- Call the procedure that updates an individual batch.
	        FOR i IN 1..ids.COUNT LOOP
	        	UpdateDiscountStatusForID(ids(i));
	        END LOOP;
		END LOOP;
	    CLOSE cur_discounts;
	END CheckAndUpdateStatus;

END PKG_DISCOUNT_REGISTRATION;