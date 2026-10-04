# Auditoría Presupuestaria: Desviaciones y calidad del Gasto Público (Gasto por trimestre abril - junio 2026)

## 📌 Descripción
En este proyecto se pretende evaluar la eficiencia operativa del gasto público en México durante el trimestre de abril a junio. A través de un enfoque analítico híbrido. Para este trabajo se utilizaron miles de registros oficiales mediante **SQL (SQLite)** para la agregación masiva, **Python (Pandas)** para el cálculo automatizado de variaciones porcentuales y **Tableau** para el diseño de un tablero interactivo.

## 🏁 Meta SMART:
Analizar y evaluar la calidad del gasto público federal (burocracia vs. inversión) en cada estado y sector, corroborando si lo entregado fue lo que se había pactado previamente, o si en su defecto, hubo ejercicios nominales.

### Preguntas SMART:
* ¿Cuánto dinero se gastó en cada estado y sector respectivamente? ¿Existe centralización? (*Ver resultados en el Dashboard Interactivo en Tableu Public*)

* ¿Cuánto se destinó a inversión/capital y cuánto a gasto corriente? (*Ver resultados en el Dashboard Interactivo en Tableu Public*)


* ¿Se respetaron los acuerdos presupuestarios establecidos con anterioridad?

* ¿Cuál fue el bloque financiero donde se direccionó la mayor parte del presupuesto?

---

## 🎯 Metodología y fases del análisis

### 📊 1. Análisis Descriptivo (SQL y Python)
* **Promesa vs. Realidad:** Agregación de datos del gobierno federal en SQL para calcular medias aritméticas y sumas acumuladas de montos aprobados frente a montos pagados, utilizando funciones `COALESCE` para blindar la integridad matemática contra valores nulos.
* **Variación Automatizada (Python):** Modelado de la variación porcentual real sobre datos limpios utilizando la librería Pandas para identificar los estados con mayores recortes presupuestarios.

### 🔍 2. Análisis Diagnóstico (SQL y Tableau)
* **Clasificación Estructural:** Agrupación y ordenamiento de los Ramos (Sectores) federales y estatales de mayor a menor impacto presupuestal para identificar el nivel de centralización del gasto.
* **Calidad del Gasto (Estructura de Grupos):** Clasificación de las partidas en tres bloques financieros (*Gasto Corriente/Operativo*, *Ramo 28 - Participaciones* y *Gasto de Capital/Inversión*) [2.1] utilizando la función `PARTITION BY`, para diagnosticar la asfixia presupuestaria de la infraestructura.

### 🎯 3. Análisis Prescriptivo (Conclusiones de la Auditoría)
* **Recomendaciones de Control:** Formulación de propuestas y hallazgos clave orientados a la optimización de los recursos, la transparencia en la reasignación de partidas presupuestales y el fortalecimiento de la inversión pública.

---

## 📊 Dashboard Interactivo (Tableau)
<img width="1920" height="1039" alt="2026-10-04 (1)" src="https://github.com/user-attachments/assets/565655c3-4f8d-4024-933d-7d060e6009fa" />


👉 [**Haz clic aquí para interactuar con el Dashboard en Tableau Public**] (https://public.tableau.com/shared/QPS2MMQKH?:display_count=n&:origin=viz_share_link)

## ✨ Conclusiones generales e insights
(Las siguientes conclusiones se limitan a lo que los datos dicen, ya que ahondar en cada sector o estado es bastante complejo y abarca muchos matices).

* A continuación, se enlistan los primeros cinco lugares de los sectores que implican el mayor gasto:
   - Aportaciones a Seguridad Social (a grandes rasgos, pensiones contributivas y jubilaciones).
   - Participaciones a Entidades Federativas y Municipios (Ramo 28, se reparte entre cada estado y este se gasta libremente dependiendo de lo que decida cada gobierno estatal).
   - Instituto Mexicano del Seguro Social (va dirigido a mantener la infraestructura hospitalaria, compra de medicamentos, pago de personal médico, pensiones, subsidios, guarderías, servicios sociales).
   - Aportaciones Federales para Entidades Federativas y Municipios (este gasto se divide a su vez en otros sectores y debe garantizar el bienestar de la población e infraestructura de cada estado).
   - Deuda Pública (es el pago al conjunto de obligaciones financieras del sector público).

* Se puede observar que el mayor gasto son las pensiones contributivas, esto nos arroja que el gasto si bien no es de mala calidad, nos dice que los adultos mayores son cada vez más y este fenómeno está causando un impacto directo a la economía.

* La salud es otro de los factores con mayor importancia dentro del presupuesto (puesto número 3,13 o 23), se considera un gasto acertado. Sin embargo, sectores como la educación (puesto número 10, 21 o 22) o los relacionados con la infraestructura y mejora de ciudades y desarrollo de zonas rurales (puesto número 15, 20 o 38), se están viendo relegados y se considera indispensable favorecer económicamente más estos puntos.

* No se respetó el acuerdo presupuestario acordado, la cantidad entregada fue mucho menor. En promedio, a cada sector se le entregó el 24.10% y por cada estado se le entregó el 27.74% de lo estipulado respectivamente.
 
* A primera vista pareciera que el gasto está centralizado en la CDMX, pero no es así. Como ya vimos el gasto más fuerte son las pensiones contributivas, y justo este es el primer rubro de mayor gasto en la CDMX, pero todo ese dinero no se queda ahí, se distribuye entre las sedes principales ubicadas en la capital, para después redistribuirse por el resto del país, así que se puede concluir que el dinero no está centralizado.

## 📂 Fuente de Datos
Debido a la gran dimensión de la base de datos original, la cual supera los límites de almacenamiento de GitHub, los datos crudos no se pudieron adjuntar a este repositorio. Puede descargar la base de datos oficial y actualizada directamente desde el portal de Datos Abiertos del Gobierno de México: https://www.datos.gob.mx/dataset/presupuesto_egresos_federacion_avance_gasto_trimestre/resource/92911c98-8886-480a-91be-e1a95ecec456.  

## 📖 Glosario de Términos

* **Monto Aprobado:** Presupuesto original asignado y publicado en el papel por el Congreso al inicio del ciclo fiscal.
* **Monto Pagado:** Desembolso de dinero real y final ejecutado por la federación al cierre del trimestre.
* **Gasto Corriente / Operativo:** Recursos destinados a mantener la maquinaria burocrática diaria (nóminas, operación administrativa, subsidios y pensiones) [2.1].
* **Gasto de Capital / Inversión:** Fondos públicos dirigidos estrictamente a la construcción de infraestructura, bienes públicos y proyectos de desarrollo a futuro (carreteras, hospitales, escuelas) [2.1].
* **Ramo 28 (Participaciones):** Recursos federales no etiquetados que se transfieren a los estados; historial macroeconómico demuestra que suelen consumirse en gasto corriente y no en infraestructura.
* **Subejercicio:** Desviación presupuestaria donde el dinero pagado es menor al aprobado, revelando recortes o ineficiencia en la ejecución del gasto [2.1].


