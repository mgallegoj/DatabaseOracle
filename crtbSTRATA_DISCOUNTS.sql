/************************************************************************************
Descripción: Tabla encargada de almacenar los tipos de descuentos por estrato
Autor:       Manuel Alejandro Gallego Jiménez
Fecha:       12-10-2023 (DD/MM/AA)
IdGestión:   
@copyright: 
************************************************************************************/

CREATE TABLE APP_PAGO_PREDIAL.PGP_STRATA_DISCOUNT
(
ID_STRATUM_DISCOUNT				INTEGER,
STRATUM_DISCOUNT				INTEGER 		NOT NULL,
CONSTRAINT PK_STRDIS PRIMARY KEY(ID_STRATUM_DISCOUNT),
CONSTRAINT CK_STRDIS_STRATUMDISCOUNT_01 CHECK (STRATUM_DISCOUNT IN (20, 30, 40))
)
/
COMMENT ON TABLE APP_PAGO_PREDIAL.PGP_STRATA_DISCOUNT IS 'All the information about discounts of properties';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_STRATA_DISCOUNT.ID_STRATUM_DISCOUNT IS 'Id of the discount applied for stratum';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_STRATA_DISCOUNT.STRATUM_DISCOUNT IS 'Specific discount (20 30 40)';
/