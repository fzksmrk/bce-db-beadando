WITH base AS (SELECT
                  COUNT(*) as count
                , RIGHT(idopont, 5) AS ido
                , status__c
              FROM idopont
              GROUP BY 2, 3)
   , summa AS (SELECT SUM(count) as summa, ido FROM base GROUP BY ido)
SELECT
  summa.ido
, round(count / summa * 100,1) as lemondasi_szazalek
FROM summa
         LEFT JOIN base ON base.ido = summa.ido
WHERE status__c = 'LEMONDTA'

