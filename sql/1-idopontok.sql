WITH e AS (SELECT GENERATE_SERIES(1, 40) AS "emp")     -- létrehoz egy 40 elemű listát
   , d AS (SELECT
               GENERATE_SERIES
                   ('2010-01-01'::date
                   , '2023-01-30'::date
                   , '1 day'::interval) AS "date_day") -- létrehoz egy listát a kettő dátum között minden nappal
   , t AS (SELECT GENERATE_SERIES(1, 25) AS "ido")     -- 8-20 24 db 30 perces időpont
SELECT
    CAST(DATE(date_day) AS varchar) || ' ' || base_idopont.idopont AS idopont
  , emp                                             AS alkalmazott
  , CASE
        WHEN (RANDOM() * 99 + 1)::int < 50 THEN 1
        WHEN (RANDOM() * 99 + 1)::int < 85 THEN 2
        ELSE 3
        END                                         AS szolgaltatas -- 3 szolgáltatás különböző arányokkal forduljon elő
  , (RANDOM() * 20000 + 1)::int                     AS ugyfel -- random ügyfél 20.000 közül
  , '1'                                             AS uzlet -- hard coded for now
  , CASE
        WHEN FLOOR(RANDOM() * 100 + 1)::int < 85 THEN 'MEGTORTENT'
        WHEN FLOOR(RANDOM() * 100 + 1)::int < 93 THEN 'LEMONDTA'
        ELSE 'DELETE'
        END                                         AS status__c
FROM d
         LEFT JOIN t ON 1 = 1
         LEFT JOIN base_idopont ON t.ido = base_idopont.id
         LEFT JOIN e ON 1 = 1