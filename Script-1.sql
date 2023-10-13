CREATE TABLE TRANSACCIONES (
    ID_TRANSACCION INTEGER,
    NUM_TRANSACCION VARCHAR2(20) NOT NULL, 
    TIPO_TRANSACCION VARCHAR2(50) NOT NULL,
    FECHA TIMESTAMP NOT NULL,
    CONSTRAINT PK_TRANSACCIONES PRIMARY KEY(NUM_TRANSACCION)
);
​
CREATE TABLE CLIENTES(
    DOCUMENTO VARCHAR2(10),
    NOMBRE VARCHAR2(50) NOT NULL,
    CORREO VARCHAR2(50) NOT NULL,
    DIRECCION VARCHAR2(50) NOT NULL,
    CELULAR VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_CLIENTES PRIMARY KEY (DOCUMENTO)
);
​
CREATE TABLE TIPOS_DE_CUENTAS (
    ID_TIPOCUENTA INTEGER,
    TIPO VARCHAR2(30) NOT NULL,
    INTERES NUMBER NOT NULL,
    CONSTRAINT PK_TIPO_DE_CUENTA PRIMARY KEY (ID_TIPOCUENTA)
);
​
CREATE TABLE CUENTAS (
    ID_CUENTA INTEGER not null,
    numero_de_cuenta varchar (20) not null,
    saldo float default 0,
    titular varchar2(50) not null,
    tipo_de_cuenta INTEGER not null,
    CONSTRAINT PK_cuentas PRIMARY KEY (ID_CUENTA),
    CONSTRAINT FK_clientes FOREIGN KEY (titular) REFERENCES clientes(documento),
    CONSTRAINT FK_tipo_de_cuenta FOREIGN KEY (tipo_de_cuenta) REFERENCES tipos_de_cuentas(id_tipocuenta)
);
​
CREATE TABLE CONSIGNACIONES (
    ID_CUENTA INTEGER,
    NUM_TRANSACCION VARCHAR2(20),
    CUENTA_DESTINO VARCHAR2(50) NOT NULL,
    MONTO_CONSIGNACION NUMBER NOT NULL,
    CONSTRAINT PK_CONSIGNACIONES PRIMARY KEY (ID_CUENTA, NUM_TRANSACCION),
    CONSTRAINT FK_CONSIGNACIONES_TRANSACCIONES FOREIGN KEY (NUM_TRANSACCION) REFERENCES TRANSACCIONES(NUM_TRANSACCION),
    CONSTRAINT FK_CONSIGNACIONES_CUENTAS FOREIGN KEY (ID_CUENTA) REFERENCES CUENTAS(ID_CUENTA)
);
​
CREATE TABLE RETIROS (
    ID_CUENTA INTEGER,
    NUM_TRANSACCION VARCHAR2(20),
    MONTO_RETIRO NUMBER NOT NULL,
    CONSTRAINT PK_RETIROS PRIMARY KEY (ID_CUENTA, NUM_TRANSACCION),
    CONSTRAINT FK_RETIROS_TRANSACCIONES FOREIGN KEY (NUM_TRANSACCION) REFERENCES TRANSACCIONES(NUM_TRANSACCION),
    CONSTRAINT FK_RETIROS_CUENTAS FOREIGN KEY (ID_CUENTA) REFERENCES CUENTAS(ID_CUENTA)
);
​
​
CREATE TABLE SUCURSALES (
     ID_SUCURSAL INTEGER,
     DIRECCION VARCHAR2(50),
     TELEFONO VARCHAR2(15),
     CIUDAD VARCHAR2(30),
     ID_CUENTA integer not null, 
     CONSTRAINT PK_SUCURSALES PRIMARY KEY (ID_SUCURSAL),
     CONSTRAINT FK_CUENTA_SUCURSAL FOREIGN KEY (ID_CUENTA) REFERENCES CUENTAS(ID_CUENTA)
);

-------------------------------
-- INDICES
CREATE UNIQUE INDEX IX_NUMERO_DE_CUENTA ON CUENTAS(NUMERO_DE_CUENTA);
CREATE UNIQUE INDEX IX_TIPO_DE_CUENTA ON TIPOS_DE_CUENTAs(TIPO);

