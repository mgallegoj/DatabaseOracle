/************************************************************************************
Descripción: Package para procedimiento para cambiar STATUS a "Pagado" y
			 para job que cambia STATUS a "Vencido" si no pagó a tiempo.
			 si STATUS es "Sin pagar"
Autor:       Manuel Alejandro Gallego Jiménez
Fecha:       17-10-2023 (DD/MM/AA)
IdGestión:   
@copyright: 
************************************************************************************/

CREATE OR REPLACE PACKAGE PKG_DISCOUNT_REGISTRATION IS
	  -- Declaraciones de procedimientos
	  PROCEDURE UpdateStatus(p_property_id INTEGER);
	  PROCEDURE UpdateDiscountStatusForID(p_id NUMBER);
	  PROCEDURE CheckAndUpdateStatus;
END PKG_DISCOUNT_REGISTRATION;