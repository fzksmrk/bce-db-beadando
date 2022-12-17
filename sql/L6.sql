SELECT
    alkalmazott.id
  , alkalmazott.nev
  , u.id
  , u.nev
FROM alkalmazott
         INNER JOIN ugyfel u ON alkalmazott.nev = u.nev