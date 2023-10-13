CREATE TABLE TRANSACCIONES (
    ID_TRANSACCION INTEGER,
    NUM_TRANSACCION VARCHAR2(20) NOT NULL, 
    TIPO_TRANSACCION VARCHAR2(50) NOT NULL,
    FECHA TIMESTAMP NOT NULL,
    CONSTRAINT PK_TRANSACCIONES PRIMARY KEY(NUM_TRANSACCION)
);

CREATE TABLE NO_TRANSACCIONES (
    ID_TRANSACCION INTEGER,
    NUM_TRANSACCION VARCHAR2(20) NOT NULL, 
    TIPO_TRANSACCION VARCHAR2(50) NOT NULL,
    FECHA TIMESTAMP NOT NULL,
    CONSTRAINT PK_NO_TRANSACCIONES PRIMARY KEY(NUM_TRANSACCION)
);