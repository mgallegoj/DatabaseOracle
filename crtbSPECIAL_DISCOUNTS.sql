/************************************************************************************
Descripción: Tabla encargada de almacenar el descuento especial
Autor:       Manuel Alejandro Gallego Jiménez
Fecha:       12-10-2023 (DD/MM/AA)
IdGestión:   
@copyright: 
************************************************************************************/

CREATE TABLE APP_PAGO_PREDIAL.PGP_SPECIAL_DISCOUNT
(
ID_SPECIAL_DISCOUNT				INTEGER,
SPECIAL_DISCOUNT				INTEGER 		NOT NULL,
CONSTRAINT PK_SPEDIS PRIMARY KEY(ID_SPECIAL_DISCOUNT),
CONSTRAINT CK_SPEDIS_SPECIALDISCOUNT_01 CHECK (SPECIAL_DISCOUNT IN (0, 5))
)

/
COMMENT ON TABLE APP_PAGO_PREDIAL.PGP_SPECIAL_DISCOUNT IS 'All the information about special discount';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_SPECIAL_DISCOUNT.ID_SPECIAL_DISCOUNT IS 'Id of the special discount applied';
COMMENT ON COLUMN APP_PAGO_PREDIAL.PGP_SPECIAL_DISCOUNT.SPECIAL_DISCOUNT IS 'Specific discount (5)';
/