### Ejercicio 9
- Hay I distritos y cada uno tiene "pᵢ" alumnos, solo se pueden ubicar las escuelas en "J" sitios de la ciudad. 
- "dᵢⱼ" ≥ 0 la distancia desde el centro del distrito i hasta el sitio j. 
- En un sitio cabe a lo sumo un colegio y cada distrito debe tener asignado un colegio.
- Cada colegio construido debe ser asignado al menos a un distrito y como mucho a 2. 
- "cⱼ" = costo de construir el colegio j. 
- "F" = constante de proporcionalidad "pᵢ" a la cantidad total de alumnos. 

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

**Restricciones:**

Para cada j ∈ {J}:
- Σᵢ Xᵢⱼ ≥ Wⱼ
- Σᵢ Xᵢⱼ ≤ 2 * Wⱼ
- cⱼ * Wⱼ + Σᵢ Xᵢⱼ * pᵢ * F ≤ B
- Σᵢ Xᵢⱼ * pᵢ ≤ Tⱼ
- Xᵤⱼ + Xᵥⱼ ≤ 1

### Ejercicio 10 - Viajante de Comercio

En este ejercicio, se tienen N ciudades que se quieren recorrer todas, pasando a lo sumo una vez por cada ciudad y terminando en la ciudad inicial.

- Dᵢⱼ: distancia entre la ciudad i y la ciudad j

**Variables:**
- Xᵢⱼ: {1 si se viaja de la ciudad i a la ciudad j, 0 en caso contrario}
- uᵢ: Número natural que indica el orden de visita de la ciudad i.

**Función Objetivo:** 
Minimizar Σᵢ=1 to N : Σⱼ = 1 to N : Xᵢⱼ * Dᵢⱼ 

**Restricciones:**
- Para cada i ∈ {1..N} : Σⱼ = 1 to N con i ≠ j: Xᵢⱼ = 1        (Se sale de cada ciudad exactamente una vez)
- Para cada i ∈ {1..N} : Σⱼ = 1 to N con i ≠ j: Xⱼᵢ = 1        (Se llega a cada ciudad exactamente una vez)
- 1 ≤ uᵢ ≤ n
- Para cada i ∈ {1..N} y j ∈ {1..N} con i ≠ j: uᵢ - uⱼ + N * Xᵢⱼ ≤ N-1

La última restricción es trivialmente verdadera si Xᵢⱼ es 0. 

Si Xᵢⱼ es 1, entonces uᵢ - uⱼ ≤ -1, lo cual implica que uᵢ debe ser visitada antes que uⱼ. Dado que uᵢ está limitada a n valores, esto significa que la ciudad i debe ser visitada exactamente en el turno anterior al de la ciudad j.

## Ejercicio 11 - Distribución de Alfiles en un Tablero de Ajedrez

El objetivo de este ejercicio es determinar la mayor cantidad de alfiles que se pueden ubicar en un tablero de ajedrez 8x8 siguiendo ciertas reglas.

### Variables
- X<sub>ij</sub>: {1 si se coloca 1 alfil en la casilla (i,j), 0 si no}

### Función Objetivo
Maximizar Σ<sub>i=1 to 8</sub> Σ<sub>j=1 to 8</sub> X<sub>ij</sub>

### Restricciones
Para cada j en {0,7}:
- Σ<sub>i=1 to 8-j</sub> X<sub>i+j,i</sub> <= 2 (la diagonal hacia abajo a la derecha suma a lo sumo 2)
- Σ<sub>i=1 to 8-j</sub> X<sub>i,i+j</sub> <= 2 (la diagonal hacia arriba a la derecha suma a lo sumo 2)
- Σ<sub>i=1 to 8-j</sub> X<sub>9-i-j,i</sub> <= 2 (la diagonal hacia abajo a la izquierda suma a lo sumo 2)
- Σ<sub>i=1 to 8-j</sub> X<sub>9-i,i+j</sub> <= 2 (la diagonal hacia arriba a la izquierda suma a lo sumo 2)


















