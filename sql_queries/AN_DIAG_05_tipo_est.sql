WITH tipo_gasto_estatal AS (
	SELECT 
		entidad_federativa AS Estado,
		desc_tipogasto AS Tipo_gasto,
		ROUND(AVG(COALESCE(monto_aprobado,0)),2) AS Media_Aprobado,
		ROUND(AVG(COALESCE(monto_pagado,0)),2) AS Media_Pagado,
		
		SUM(COALESCE(monto_aprobado,0)) AS Sum_Aprobado,
		SUM(COALESCE(monto_pagado,0)) AS Sum_Pagado,
		
		SUM(SUM(COALESCE(monto_aprobado,0))) OVER(PARTITION BY entidad_federativa) AS Sum_Total_Ap,
		SUM(SUM(COALESCE(monto_pagado,0))) OVER(PARTITION BY entidad_federativa) AS Sum_Total_Pa
	FROM presupuesto
	GROUP BY entidad_federativa,desc_tipogasto
)

SELECT
	Estado,
	Tipo_gasto,
	Media_Aprobado,
	ROUND(Sum_Aprobado) AS Total_Aprobado,
	ROUND((Sum_Aprobado / Sum_Total_Ap)*100,2) AS pct_Ap,
	
	Media_Pagado,
	ROUND (Sum_Pagado) AS Total_Pagado,
	ROUND((Sum_Pagado / Sum_Total_Pa)*100,2) AS pct_Pa
FROM tipo_gasto_estatal
ORDER BY Estado,Total_Pagado DESC;
	
