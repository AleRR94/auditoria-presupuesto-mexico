# Auditoría Presupuestaria: Desviaciones y calidad del Gasto Público (Gasto por trimestre abril - junio 2026)

## 📌 Descripción
En este proyecto se pretende evaluar la eficiencia operativa del gasto público en México durante el trimestre de abril a junio. A través de un enfoque analítico híbrido. Para este trabajo se utilizaron miles de registros oficiales mediante **SQL (SQLite)** para la agregación masiva, **Python (Pandas)** para el cálculo automatizado de variaciones porcentuales y **Tableau** para el diseño de un tablero interactivo.

## Meta SMART:
Analizar y evaluar la calidad del gasto público federal (burocracia vs. inversión) en cada estado y sector, corroborando si lo entregado fue lo que se había pactado previamente, o si en su defecto, hubo ejercicios nominales.

### Preguntas SMART:
* ¿Cuánto dinero se gastó en cada estado y sector respectivamente? 

* ¿Cuánto se destinó a inversión/capital y cuánto a gasto corriente?

* ¿Se respetaron los acuerdos presupuestarios?

* ¿Hubo eficiencia y calidad en los gastos?

---

## 🎯 Metodología y fases del análisis

### 📊 1. Análisis Descriptivo (SQL y Python)
* **Promesa vs. Realidad:** Agregación de datos del gobierno federal en SQL para calcular medias aritméticas y sumas acumuladas de montos aprobados frente a montos pagados, utilizando funciones 'COALESCE' para blindar la integridad matemática contra valores nulos.
* **Variación Automatizada (Python):** Modelado de la variación porcentual real sobre datos limpios utilizando la librería Pandas para identificar los estados con mayores recortes presupuestarios.

### 🔍 2. Análisis Diagnóstico (SQL y Tableau)
* **Clasificación Estructural:** Agrupación y ordenamiento de los Ramos (Sectores) federales y estatales de mayor a menor impacto presupuestal para identificar el nivel de centralización del gasto.
* **Calidad del Gasto (Estructura de Grupos):** Clasificación de las partidas en tres bloques financieros (*Gasto Corriente/Operativo*, *Ramo 28 - Participaciones* y *Gasto de Capital/Inversión*) [2.1] utilizando la función 'PARTITION BY', para diagnosticar la asfixia presupuestaria de la infraestructura.

### 🎯 3. Análisis Prescriptivo (Conclusiones de la Auditoría)
* **Recomendaciones de Control:** Formulación de propuestas y hallazgos clave orientados a la optimización de los recursos, la transparencia en la reasignación de partidas presupuestales y el fortalecimiento de la inversión pública.

---

## 📊 Dashboard Interactivo (Tableau)
<img width="1920" height="1041" alt="2026-10-01 (1)" src="https://github.com/user-attachments/assets/965e437f-be67-4229-990a-e1e1d8a8c3b4" />

👉 [**Haz clic aquí para interactuar con el Dashboard en Tableau Public** (https://public.tableau.com/shared/QPS2MMQKH?:display_count=n&:origin=viz_share_link)

## ✨ Conclusiones generales e insights


## 📂 Fuente de Datos
Debido a la gran dimensión de la base de datos original, la cual supera los límites de almacenamiento de GitHub, los datos crudos no se pudieron adjuntar a este repositorio. Puede descargar la base de datos oficial y actualizada directamente desde el portal de Datos Abiertos del Gobierno de México: https://www.datos.gob.mx/dataset/presupuesto_egresos_federacion_avance_gasto_trimestre/resource/92911c98-8886-480a-91be-e1a95ecec456.  

## 📖 Glosario de Términos

* **Monto Aprobado:** Presupuesto original asignado y publicado en el papel por el Congreso al inicio del ciclo fiscal.
* **Monto Pagado:** Desembolso de dinero real y final ejecutado por la federación al cierre del trimestre.
* **Gasto Corriente / Operativo:** Recursos destinados a mantener la maquinaria burocrática diaria (nóminas, operación administrativa, subsidios y pensiones) [2.1].
* **Gasto de Capital / Inversión:** Fondos públicos dirigidos estrictamente a la construcción de infraestructura, bienes públicos y proyectos de desarrollo a futuro (carreteras, hospitales, escuelas) [2.1].
* **Ramo 28 (Participaciones):** Recursos federales no etiquetados que se transfieren a los estados; historial macroeconómico demuestra que suelen consumirse en gasto corriente y no en infraestructura.
* **Subejercicio:** Desviación presupuestaria donde el dinero pagado es menor al aprobado, revelando recortes o ineficiencia en la ejecución del gasto [2.1].


