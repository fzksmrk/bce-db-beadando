WITH base AS (SELECT
                  ugyfel
                , COUNT(alkalmazott) AS fodraszok_szama
              FROM idopont
              WHERE idopont::date >= '2022-01-01'
              GROUP BY 1)
   , histo AS (SELECT
                   fodraszok_szama
                 , COUNT(ugyfel) AS ugyf_szam
               FROM base
               GROUP BY 1
               ORDER BY 1 ASC)
   , possibilities AS (SELECT GENERATE_SERIES(1, 40) AS fodr)
SELECT
    fodr as fodraszok_szama
  , CASE
        WHEN ugyf_szam > 0 THEN ugyf_szam
        ELSE 0 END AS ugyfelek_szama_a_kategoriaban
FROM possibilities
         LEFT JOIN histo ON possibilities.fodr = histo.fodraszok_szama
ORDER BY fodr ASC

