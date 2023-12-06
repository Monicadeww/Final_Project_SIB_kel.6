-- Query to compare successful and unsuccessful login attempts by month
SELECT
  DATE_TRUNC('month', lah.attempted_at) AS Attempt_month,
  SUM(CAST(lah.login_successful AS INT)) AS Successful_Attempts,
  SUM(CAST(NOT lah.login_successful AS INT)) AS Unsuccessful_Attempts
FROM
  login_attemps lah
GROUP BY
  Attempt_month
ORDER BY
  Attempt_month;