SELECT 
    entidad_federativa AS Estado,
    ROUND(SUM(COALESCE(monto_aprobado, 0)), 2) AS Total_Aprobado,
    ROUND(SUM(COALESCE(monto_pagado, 0)), 2) AS Total_Pagado,
    
    -- Diferencia entre lo pagado y lo aprobado
    ROUND(SUM(COALESCE(monto_pagado, 0)) - SUM(COALESCE(monto_aprobado, 0)), 2) AS Diferencia_Pesos

FROM presupuesto
GROUP BY entidad_federativa
ORDER BY Diferencia_Pesos ASC; -- Odenar de mayor recorte a menor recorte
