WITH globales AS (
    -- Calcular el dinero total del país
    SELECT 
        SUM(COALESCE(monto_aprobado, 0)) AS Gran_Total_Aprobado,
        SUM(COALESCE(monto_pagado, 0)) AS Gran_Total_Pagado
    FROM presupuesto
),
totales_por_ramo AS (
    -- Sumar por sector
    SELECT 
        desc_ramo AS Sector,
        ROUND(AVG(COALESCE(monto_aprobado, 0)), 2) AS Media_Ap,
        ROUND(AVG(COALESCE(monto_pagado, 0)), 2) AS Media_Pa,
        SUM(COALESCE(monto_aprobado, 0)) AS Sum_Aprobado,
        SUM(COALESCE(monto_pagado, 0)) AS Sum_Pagado
    FROM presupuesto
    GROUP BY desc_ramo
)
-- Calcular porcentajes
SELECT 
    t.Sector,
    t.Media_Ap,
    ROUND(t.Sum_Aprobado, 2) AS SumTotal_Aprobado,
    ROUND((t.Sum_Aprobado / g.Gran_Total_Aprobado) * 100, 2) AS Pct_Aprobado,
    
    t.Media_Pa,
    ROUND(t.Sum_Pagado, 2) AS SumTotal_Pagado,
    ROUND((t.Sum_Pagado / g.Gran_Total_Pagado) * 100, 2) AS Pct_Pagado
FROM totales_por_ramo t
CROSS JOIN globales g 
ORDER BY t.Sum_Aprobado DESC;
