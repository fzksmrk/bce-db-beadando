SELECT
    CONCAT(vezetek_nevek.nev, ' ', kereszt_nevek.nev) AS teljes_nev
  , vezetek_nevek.nev                                 AS vezetek_nev
  , kereszt_nevek.nev                                 AS kereszt_nev
FROM "hairdresser-ods".vezetek_nevek
         CROSS JOIN "hairdresser-ods".kereszt_nevek