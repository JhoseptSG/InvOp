### Ejercicio 9
Hay I distritos y cada uno tiene "pᵢ" alumnos, solo se pueden ubicar las escuelas en "J" sitios de la ciudad. 
"dᵢⱼ" ≥ 0 la distancia desde el centro del distrito i hasta el sitio j. 
En un sitio cabe a lo sumo un colegio y cada distrito debe tener asignado un colegio.
Cada colegio construido debe ser asignado al menos a un distrito y como mucho a 2. 
"cⱼ" = costo de construir el colegio j. 
"F" = constante de proporcionalidad "pᵢ" a la cantidad total de alumnos. 

- Costoⱼ = cⱼ + F * sⱼ, donde sⱼ es la suma de las poblaciones de los distritos asociados a ese colegio.
- B: Presupuesto designado para construir todos los colegios.
- Tⱼ: Capacidad de alumnos soportada por el colegio construido en j.
- Los distritos u y v deben ser atendidos por 2 colegios distintos. 

### Modelo de Programación Lineal

**Variables:**
- Xᵢⱼ: Binaria { 1 si el distrito i tiene asignado el colegio construido en el sitio j, 0 en caso contrario }
- Wⱼ: Binaria { 1 si el colegio j es construido, 0 en caso contrario }

Se cumple que Wⱼ = 1 ⇔ Σᵢ Xᵢⱼ ≥ 1, para todo j ∈ {J}

**Función Objetivo:**
Minimizar Σᵢⱼ dᵢⱼ * Xᵢⱼ

**Restricciones:**

Para cada i ∈ {I}:
- Σⱼ dᵢⱼ = 1

Para cada j ∈ {J}:
- Σᵢ Xᵢⱼ ≥ Wⱼ
- Σᵢ Xᵢⱼ ≤ 2 * Wⱼ
- cⱼ * Wⱼ + Σᵢ Xᵢⱼ * pᵢ * F ≤ B
- Σᵢ Xᵢⱼ * pᵢ ≤ Tⱼ
- Xᵤⱼ + Xᵥⱼ ≤ 1
- Σᵢ Xᵢⱼ ≥ Wⱼ y Σᵢ Xᵢⱼ ≤ 2 * Wⱼ







