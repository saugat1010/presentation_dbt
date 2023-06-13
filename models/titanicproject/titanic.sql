--Defining the model
{{ config(
  materialized='table',
  alias='titanic'
) }}

-- SQL query to create titanic model
SELECT *
FROM PRESENTATION.MYSCHEMA1.SAUGAT01TITANIC__CSV