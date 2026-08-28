WITH totales_ramos_federal AS (
    SELECT 
        desc_ramo AS Sector,
        
        -- Medias de cada ramo por estado, tanto aprobado como pagado
        ROUND(AVG(COALESCE(monto_aprobado, 0)), 2) AS Media_Ap_Ramo_Federal,
        ROUND(AVG(COALESCE(monto_pagado, 0)), 2) AS Media_Pa_Ramo_Federal,
        
        -- Suma de cada estado, tanto aprobado como pagado
        SUM(COALESCE(monto_aprobado, 0)) AS Suma_Ap_Ramo_Federal,
        SUM(COALESCE(monto_pagado, 0)) AS Suma_Pa_Ramo_Federal,
        
        -- Suma total de todo lo asignado a cada estado para sacar el porcentaje local
        SUM(SUM(COALESCE(monto_aprobado, 0))) OVER() AS Total_Ap_Federal,
        SUM(SUM(COALESCE(monto_pagado, 0))) OVER() AS Total_Pa_Federal
        
    FROM presupuesto
    GROUP BY desc_ramo
)
SELECT 
    Sector,
    Media_Ap_Ramo_Federal,
    ROUND(Suma_Ap_Ramo_Federal, 2) AS Total_Ap_Federal,
    -- Porcentaje de cada ramo respecto a lo aprobado total para cada estado
    ROUND((Suma_Ap_Ramo_Federal / Total_Ap_Federal) * 100.00, 2) AS Pct_Aprobado,
    
    Media_Pa_Ramo_Federal,
    ROUND(Suma_Pa_Ramo_Federal, 2) AS Total_Pa_Federal,
    -- Porcentaje de cada ramo respecto a lo pagado total por cada estado
    ROUND((Suma_Pa_Ramo_Federal / Total_Pa_Federal) * 100.00, 2) AS Pct_Pagado
FROM totales_ramos_federal
ORDER BY Total_Pa_Federal DESC;
