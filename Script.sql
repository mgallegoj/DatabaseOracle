SELECT * FROM TALLER1.SYN_TRANSACCIONES;

SELECT * FROM TALLER1.NO_TRANSACCIONES;

INSERT INTO TALLER1.SYN_TRANSACCIONES (ID_TRANSACCION, NUM_TRANSACCION, TIPO_TRANSACCION, FECHA)
VALUES (14, 'TXN101', 'Depósito', TO_TIMESTAMP('2023-10-26 10:30:00', 'YYYY-MM-DD HH24:MI:SS'));

DROP TABLE TALLER1.TRANSACCIONES;