WITH base AS (SELECT
                  ugyfel
                , idopont::date
                , LAG(idopont::date)
                  OVER (PARTITION BY ugyfel ORDER BY idopont::timestamp ASC)
                , idopont::date - LAG(idopont::date)
                                  OVER (PARTITION BY ugyfel ORDER BY idopont::timestamp ASC) AS days_diff
              FROM idopont
              WHERE status__c = 'MEGTORTENT'
                AND idopont::date >= '2022-01-01'
              ORDER BY 1, 2)
SELECT
    ugyfel
  , COUNT(days_diff)         AS number_of_visits
  , MIN(days_diff)           AS min_date_diff
  , ROUND(AVG(days_diff), 1) AS avg_date_diff
  , MAX(days_diff)           AS max_date_diff
FROM base
GROUP BY ugyfel
ORDER BY avg_date_diff ASC