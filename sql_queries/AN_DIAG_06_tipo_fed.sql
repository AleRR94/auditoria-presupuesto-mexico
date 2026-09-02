WITH tipo_gasto_federal AS (
	SELECT
		desc_tipogasto AS Tipo_gasto,
		
		ROUND(AVG(COALESCE(monto_aprobado,0)),2) AS Media_Ap,
		ROUND(AVG(COALESCE(monto_pagado,0)),2) AS Media_Pa,
		
		SUM(COALESCE(monto_aprobado,0)) AS Sum_Aprobado,
		SUM(COALESCE(monto_pagado,0)) AS Sum_Pagado,
		
		SUM(SUM(COALESCE(monto_aprobado,0))) OVER() AS Total_Ap,
		SUM(SUM(COALESCE(monto_pagado,0))) OVER() AS Total_Pa
	FROM presupuesto
	GROUP BY desc_tipogasto
)

SELECT
	Tipo_gasto,
	Media_Ap,
	ROUND(Sum_Aprobado,2) AS SumTotal_Aprobado,
	ROUND((Sum_Aprobado / Total_Ap) * 100,2) AS Pct_Aprobado,
	
	Media_Pa,
	ROUND(Sum_Pagado,2) AS SumTotal_Pagado,
	ROUND((Sum_Pagado / Total_Pa) * 100,2) AS Pct_Pagado
FROM tipo_gasto_federal
ORDER BY Tipo_gasto,Sum_Pagado DESC;
	
