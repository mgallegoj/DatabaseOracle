/************************************************************************************
Descripción: Tabla encargada de almacenar la información sobre
			 los propietarios de las viviendas
Autor:       Manuel Alejandro Gallego Jiménez
Fecha:       12-10-2023 (DD/MM/AA)
IdGestión:   
@copyright: 
************************************************************************************/

CREATE TABLE APP_PAGO_PREDIAL.PGP_OWNER
(
DOCUMENT						VARCHAR2(15),
DOCUMENT_TYPE					VARCHAR2(9)		NOT NULL, 
FIRST_NAME						VARCHAR2(15)	NOT NULL,
LAST_NAME						VARCHAR2(15) 	NOT NULL,
OVER_60							VARCHAR2(2)		NOT NULL,
HEAD_OF_HOUSEHOLD				VARCHAR2(2)		NOT NULL,
UNENPLOYED						VARCHAR2(2)		NOT NULL,
CONSTRAINT PK_OWNER PRIMARY KEY(DOCUMENT),
CONSTRAINT CK_OWNER_DOCUMENTTYPE_01 CHECK (DOCUMENT_TYPE IN ('CC', 'TI', 'CE', 'Pasaporte', 'VR', 'RCN')),
CONSTRAINT CK_OWNER_OVER60_02 CHECK (OVER_60 IN ('Si', 'No')),
CONSTRAINT CK_OWNER_HEADHOUSEHOLD_03 CHECK (HEAD_OF_HOUSEHOLD IN ('Si', 'No')),
CONSTRAINT CK_OWNER_UNENPLOYED_04 CHECK (UNENPLOYED IN ('Si', 'No'))
);

COMMENT ON TABLE APP_PAGO_PREDIAL.PGP_OWNER IS 'Information about all the owners with house';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_OWNER.DOCUMENT IS 'Id of owner';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_OWNER.DOCUMENT_TYPE IS 'Type of the owners id, it can be CC, TI, CE, Pasaporte, VR or RCN';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_OWNER.FIRST_NAME IS 'First name of the owner';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_OWNER.LAST_NAME IS 'Last name of the owner';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_OWNER.OVER_60 IS 'Si or No if the owner is older than 60';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_OWNER.HEAD_OF_HOUSEHOLD IS 'Si or No if the owner is head of household';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_OWNER.UNENPLOYED IS 'Si or No if the owner is unenployed';