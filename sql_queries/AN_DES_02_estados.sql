WITH calculo_totales AS (
    SELECT 
        entidad_federativa AS Estado,
        -- Media aprobada y pagada para cada estado
        ROUND(AVG(COALESCE(monto_aprobado, 0)), 2) AS Media_Ap_Estado,
		ROUND(AVG(COALESCE(monto_pagado, 0)), 2) AS Media_Pa_Estado,
        
        -- Suma total aprobada y pagada para cada estado
        SUM(COALESCE(monto_aprobado, 0)) AS Suma_Estado_Ap,
		SUM(COALESCE(monto_pagado, 0)) AS Suma_Estado_Pa,
        
        -- Suma global de todo el presupuesto del país
        SUM(SUM(COALESCE(monto_aprobado, 0))) OVER() AS Total_Global_Ap_Federacion,
		SUM(SUM(COALESCE(monto_pagado, 0))) OVER() AS Total_Global_Pa_Federacion
    FROM presupuesto
    GROUP BY entidad_federativa
)
SELECT 
    Estado,
    Media_Ap_Estado,
    ROUND(Suma_Estado_Ap, 2) AS Total_Aprobado_Pesos,
    -- Porcentaje de dinero que le tocó a cada estado
    ROUND((Suma_Estado_Ap / Total_Global_Ap_Federacion) * 100.00, 2) AS Porcentaje_Participacion_Ap,
	Media_Pa_Estado,
    ROUND(Suma_Estado_Pa, 2) AS Total_Pagado_Pesos,
	ROUND((Suma_Estado_Pa / Total_Global_Pa_Federacion) * 100.00, 2) AS Porcentaje_Participacion_Pa
FROM calculo_totales
ORDER BY Total_Pagado_Pesos DESC;
