/************************************************************************************
Descripción: Tabla encargada de almacenar la información sobre
			 los descuentos aplicados a cada vivienda
Autor:       Manuel Alejandro Gallego Jiménez
Fecha:       12-10-2023 (DD/MM/AA)
IdGestión:   
@copyright: 
************************************************************************************/

CREATE TABLE APP_PAGO_PREDIAL.PGP_DISCOUNT_REGISTRATION
(
ID_DISCOUNT_REGISTRATION		INTEGER,
NET_PAYMENT						INTEGER			NOT NULL, 
DEADLINE_DATE					DATE			NOT NULL,
STATUS							VARCHAR2(10) 	NOT NULL,
ID_PROPERTY						INTEGER 		UNIQUE NOT NULL,
DOCUMENT						VARCHAR2(15) 	NOT NULL,
ID_STRATUM_DISCOUNT				INTEGER 		NOT NULL,
ID_SPECIAL_DISCOUNT				INTEGER 		NOT NULL,
CONSTRAINT PK_DISREG PRIMARY KEY(ID_DISCOUNT_REGISTRATION),
CONSTRAINT CK_DISREG_NETPAYMENT_01 CHECK (NET_PAYMENT > 1 AND NET_PAYMENT <= 800000000),
CONSTRAINT FK_DISREG_PROPTY_01 FOREIGN KEY(ID_PROPERTY) REFERENCES APP_PAGO_PREDIAL.PGP_PROPERTY(ID_PROPERTY),
CONSTRAINT FK_DISREG_DOCMNT_02 FOREIGN KEY(DOCUMENT) REFERENCES APP_PAGO_PREDIAL.PGP_OWNER(DOCUMENT),
CONSTRAINT FK_DISREG_STRDIS_03 FOREIGN KEY(ID_STRATUM_DISCOUNT)  REFERENCES APP_PAGO_PREDIAL.PGP_STRATA_DISCOUNT(ID_STRATUM_DISCOUNT),
CONSTRAINT FK_DISREG_SPEDIS_04 FOREIGN KEY(ID_SPECIAL_DISCOUNT) REFERENCES APP_PAGO_PREDIAL.PGP_SPECIAL_DISCOUNT(ID_SPECIAL_DISCOUNT)
);



COMMENT ON TABLE APP_PAGO_PREDIAL.PGP_DISCOUNT_REGISTRATION IS 'All the information about discounts of properties';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_DISCOUNT_REGISTRATION.ID_DISCOUNT_REGISTRATION IS 'Id of the discount';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_DISCOUNT_REGISTRATION.NET_PAYMENT IS 'Amount to pay for the new tax';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_DISCOUNT_REGISTRATION.DEADLINE_DATE IS 'Deadline for the payment YYYY-MM-DD';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_DISCOUNT_REGISTRATION.STATUS IS 'Says if the payment was done or not ';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_DISCOUNT_REGISTRATION.ID_PROPERTY IS 'Id of the property';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_DISCOUNT_REGISTRATION.DOCUMENT IS 'Id of the property owner';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_DISCOUNT_REGISTRATION.ID_STRATUM_DISCOUNT IS 'Id of the discount applied for stratum';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_DISCOUNT_REGISTRATION.ID_SPECIAL_DISCOUNT IS 'Id of the discount applied for special case';




