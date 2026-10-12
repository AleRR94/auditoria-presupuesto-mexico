WITH pct_sector AS (
    SELECT 
        desc_ramo AS Sector, 
        ROUND(SUM(monto_pagado), 2) AS Suma_Pagado
    FROM presupuesto 
    GROUP BY desc_ramo
)
SELECT 
    Sector, 
    Suma_Pagado, 
    ROUND((Suma_Pagado / (SELECT SUM(Suma_Pagado) FROM pct_sector)) * 100, 2) AS Porcentaje 
FROM pct_sector
ORDER BY Suma_Pagado DESC;
