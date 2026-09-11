# Auditoría Presupuestaria: Desviaciones y Calidad del Gasto Público (Gasto por trimestre 2026)

## 📌 Descripción del Proyecto
En este proyecto se pretende evaluar la eficiencia operativa del gasto público en México durante un trimestre. A través de un enfoque analítico híbrido, se revisó el cumplimiento del presupuesto federal para detectar subejercicios nominales, se evaluó la centralización de los recursos y también la calidad del gasto (burocracia vs inversión en el futuro). 

Para este trabajo se utilizaron miles de registros oficiales mediante **SQL (SQLite)** para la agregación masiva, **Python (Pandas)** para el cálculo automatizado de variaciones porcentuales y **Tableau** para el diseño de un tablero interactivo.

## 📂 Fuente de Datos
Debido a la gran dimensión de la base de datos original, la cual supera los límites de almacenamiento de GitHub, los datos crudos no se pudieron adjuntar a este repositorio. Puede descargar la base de datos oficial y actualizada directamente desde el portal de Datos Abiertos del Gobierno de México: https://www.datos.gob.mx/dataset/presupuesto_egresos_federacion_avance_gasto_trimestre/resource/92911c98-8886-480a-91be-e1a95ecec456.  

## 📊 Tablero Interactivo (Tableau)
👉 [**Haz clic aquí para interactuar con el Dashboard en Tableau Public** (https://public.tableau.com/shared/QPS2MMQKH?:display_count=n&:origin=viz_share_link)

---

## 🎯 Metodología

### 📊 1. Análisis Descriptivo (SQL y Python)
* **Consolidación de la Promesa vs. Realidad:** Agregación de datos a nivel estatal y federal en SQL para calcular medias aritméticas y sumas acumuladas de montos aprobados frente a montos pagados, utilizando funciones `COALESCE` para blindar la integridad matemática contra valores nulos.
* **Variación Automatizada (Python):** Modelado de la variación porcentual real sobre data limpia utilizando la librería Pandas para identificar los estados con mayores recortes presupuestarios.

### 🔍 2. Análisis Diagnóstico (SQL y Tableau)
* **Clasificación Estructural:** Agrupación y ordenamiento de los Ramos (Sectores) federales y estatales de mayor a menor impacto presupuestal para identificar el nivel de centralización del gasto.
* **Calidad del Gasto (Estructura de Grupos):** Clasificación de las partidas en tres grandes bloques financieros (*Gasto Corriente/Operativo*, *Ramo 28 - Participaciones* y *Gasto de Capital/Inversión Pura*) [2.1] utilizando funciones de ventana (`PARTITION BY`) para diagnosticar la asfixia presupuestaria de la infraestructura.

### 🎯 3. Análisis Prescriptivo (Conclusiones de la Auditoría)
* **Recomendaciones de Control:** Formulación de propuestas y hallazgos clave orientados a la optimización de los recursos, la transparencia en la reasignación de partidas presupuestales y el fortalecimiento de la inversión pública.

---

## 📖 Glosario de Términos

* **Monto Aprobado:** Presupuesto original asignado y publicado en el papel por el Congreso al inicio del ciclo fiscal.
* **Monto Pagado:** Desembolso de dinero real y final ejecutado por la federación al cierre del trimestre.
* **Gasto Corriente / Operativo:** Recursos destinados a mantener la maquinaria burocrática diaria (nóminas, operación administrativa, subsidios y pensiones) [2.1].
* **Gasto de Capital / Inversión:** Fondos públicos dirigidos estrictamente a la construcción de infraestructura, bienes públicos y proyectos de desarrollo a futuro (carreteras, hospitales, escuelas) [2.1].
* **Ramo 28 (Participaciones):** Recursos federales no etiquetados que se transfieren a los estados; historial macroeconómico demuestra que suelen consumirse en gasto corriente y no en infraestructura.
* **Subejercicio:** Desviación presupuestaria donde el dinero pagado es menor al aprobado, revelando recortes o ineficiencia en la ejecución del gasto [2.1].


