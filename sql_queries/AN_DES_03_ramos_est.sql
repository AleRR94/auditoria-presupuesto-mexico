WITH totales_ramos_estatal AS (
    SELECT 
        entidad_federativa AS Estado,
        desc_ramo AS Sector,
        
        -- Medias de cada ramo por estado, tanto aprobado como pagado
        ROUND(AVG(COALESCE(monto_aprobado, 0)), 2) AS Media_Aprobada_Ramo_Estatal,
        ROUND(AVG(COALESCE(monto_pagado, 0)), 2) AS Media_Pagada_Ramo_Estatal,
        
        -- Suma de cada estado, tanto aprobado como pagado
        SUM(COALESCE(monto_aprobado, 0)) AS Suma_Aprobada_Ramo_Estatal,
        SUM(COALESCE(monto_pagado, 0)) AS Suma_Pagada_Ramo_Estatal,
        
        -- Suma total de todo lo asignado a cada estado para sacar el porcentaje local
        SUM(SUM(COALESCE(monto_aprobado, 0))) OVER(PARTITION BY entidad_federativa) AS Total_Aprobado_Del_Estado,
        SUM(SUM(COALESCE(monto_pagado, 0))) OVER(PARTITION BY entidad_federativa) AS Total_Pagado_Del_Estado
        
    FROM presupuesto
    GROUP BY entidad_federativa, desc_ramo
)
SELECT 
    Estado,
    Sector,
    Media_Aprobada_Ramo_Estatal,
    ROUND(Suma_Aprobada_Ramo_Estatal, 2) AS Total_Aprobado_Ramo_Estatal,
    -- Porcentaje de cada ramo respecto a lo aprobado total para cada estado
    ROUND((Suma_Aprobada_Ramo_Estatal / Total_Aprobado_Del_Estado) * 100.00, 2) AS Pct_Participacion_Aprobado_Local,
    
    Media_Pagada_Ramo_Estatal,
    ROUND(Suma_Pagada_Ramo_Estatal, 2) AS Total_Pagado_Ramo_Estatal,
    -- Porcentaje de cada ramo respecto a lo pagado total por cada estado
    ROUND((Suma_Pagada_Ramo_Estatal / Total_Pagado_Del_Estado) * 100.00, 2) AS Pct_Participacion_Pagado_Local
FROM totales_ramos_estatal
ORDER BY Estado, Total_Pagado_Ramo_Estatal DESC;
