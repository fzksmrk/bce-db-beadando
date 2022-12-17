WITH emp AS (SELECT
                 DATE_TRUNC('month', idopont::TIMESTAMP) AS honap
               , alkalmazott
               , status__c
               , COUNT(idopont.id)                       AS idopontok_szama
             FROM idopont
                      LEFT JOIN szolgaltatas ON idopont.szolgaltatas = szolgaltatas.id
             GROUP BY 1, 2, 3
             HAVING status__c = 'MEGTORTENT'),
     havi AS (SELECT
                  DATE_TRUNC('month', idopont::TIMESTAMP) AS honap
                , status__c
                , COUNT(idopont.id)
              FROM idopont
                       LEFT JOIN szolgaltatas ON idopont.szolgaltatas = szolgaltatas.id
              GROUP BY 1, 2
              HAVING status__c = 'MEGTORTENT'
              ORDER BY 3 DESC
              LIMIT 1)
SELECT
    alkalmazott.nev
  , idopontok_szama
FROM emp
         LEFT JOIN alkalmazott ON emp.alkalmazott = alkalmazott.id
WHERE emp.honap IN (SELECT honap FROM havi)
ORDER BY idopontok_szama DESC
LIMIT 1


