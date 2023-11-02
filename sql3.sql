-- Создание и заполнение таблицы из примера

CREATE TABLE transfers (
  "from" INTEGER,
  "to" INTEGER,
  amount INTEGER,
  tdate DATE
);

INSERT INTO transfers VALUES 
(1, 2, 500, '2023-02-23'),
(2, 3, 300, '2023-03-01'),
(3, 1, 200, '2023-03-05'),
(1, 3, 400, '2023-04-05');


-- Запрос

WITH RECURSIVE periods AS (
    SELECT
        acc,
        tdate AS dt_from,
        COALESCE(LEAD(tdate) OVER (PARTITION BY acc ORDER BY tdate), '3000-01-01') AS dt_to,
        SUM(amount) OVER (PARTITION BY acc ORDER BY tdate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS balance
    FROM (
        SELECT
            "from" AS acc,
            tdate,
            -amount AS amount
        FROM
            transfers
        UNION ALL
        SELECT
            "to" AS acc,
            tdate,
            amount
        FROM
            transfers
    ) AS transfers_extended
)
SELECT
    acc,
    dt_from,
    dt_to,
    balance
FROM
    periods
ORDER BY
    acc,
    dt_from