
{{ config(
  materialized='view',
  alias='passenger_demographics'
) }}

-- Write the SQL query to analyze passenger demographics
SELECT
  Pclass,
  Sex,
  COUNT(*) AS passenger_count,
  AVG(Age) AS average_age
FROM
  {{ ref('titanic') }}
GROUP BY Pclass, Sex