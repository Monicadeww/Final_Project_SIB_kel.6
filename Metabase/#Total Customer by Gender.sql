#Total Customer by Gender
SELECT
  gender,
  COUNT(Id) AS customer_count
FROM
  customer
GROUP BY
  gender;