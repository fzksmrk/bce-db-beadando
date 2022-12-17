SELECT
    DATE_TRUNC('month', idopont::TIMESTAMP)
  , status__c
  , COUNT(idopont.id)
  , SUM(szolgaltatas.ar)
FROM idopont
         LEFT JOIN szolgaltatas ON idopont.szolgaltatas = szolgaltatas.id
GROUP BY 1, 2
HAVING status__c = 'MEGTORTENT'