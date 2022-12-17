with base as (SELECT DISTINCT
                  ugyfel
              FROM idopont
              WHERE idopont::date BETWEEN '2022-12-01' AND '2022-12-31')
select count(ugyfel) from base
