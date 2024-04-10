-- TRANSACTION

-- Una transacción en SQL es una secuencia de operaciones que se realizan como una sola unidad lógica y atómica de trabajo. Esto significa que todas las operaciones dentro de la transacción se ejecutan completamente o ninguna de ellas se ejecuta. Las transacciones en SQL generalmente se utilizan para garantizar la consistencia de los datos y la integridad de la base de datos.

START TRANSACTION;

-- Operaciones SQL aquí

COMMIT; -- Confirma las operaciones realizadas en la transacción

-- O bien:

ROLLBACK; -- Deshace todas las operaciones realizadas en la transacción


START TRANSACTION
    [transaction_characteristic [, transaction_characteristic] ...]

transaction_characteristic: {
    WITH CONSISTENT SNAPSHOT
  | READ WRITE
  | READ ONLY
}

BEGIN [WORK]
COMMIT [WORK] [AND [NO] CHAIN] [[NO] RELEASE]
ROLLBACK [WORK] [AND [NO] CHAIN] [[NO] RELEASE]
SET autocommit = {0 | 1}