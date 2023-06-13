-- Defining the model name

{{ config(
  materialized='table',
  alias='survival_rate'
) }}


-- Using CTE to calculate survival rate

WITH passengers AS (
  SELECT
    COUNT(*) AS total_passengers,
    SUM(CASE WHEN Survived = 1 THEN 1 ELSE 0 END) AS survived_passengers,
    SUM(CASE WHEN Survived = 0 THEN 1 ELSE 0 END) AS deceased_passengers
  FROM
    {{ ref('titanic') }}
)
SELECT
  total_passengers,
  survived_passengers,
  deceased_passengers,
  (survived_passengers / total_passengers) AS survival_rate
FROM
  passengers