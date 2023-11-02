WITH RECURSIVE Dates AS (
  SELECT CURDATE() AS check_date
  UNION ALL
  SELECT DATE_ADD(check_date, INTERVAL FLOOR(RAND() * 6) + 2 DAY) FROM Dates LIMIT 99
)

SELECT * FROM Dates;