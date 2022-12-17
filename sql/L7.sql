SELECT
    count(idopont.id)
, alkalmazott.nev
FROM idopont
left join alkalmazott on alkalmazott.id = idopont.alkalmazott
WHERE CONCAT(alkalmazott::varchar, '__', ugyfel::varchar) IN (SELECT
                                                                  CONCAT(alkalmazott.id::varchar, '__', u.id::varchar)
                                                              FROM alkalmazott
                                                                       INNER JOIN ugyfel u ON alkalmazott.nev = u.nev)
  AND status__c = 'MEGTORTENT'
group by 2
order by 1 desc

