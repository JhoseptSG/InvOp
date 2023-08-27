## Ejercicio 9
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

## Ejercicio 10 - Viajante de Comercio

En este ejercicio, se tienen N ciudades que se quieren recorrer todas, pasando a lo sumo una vez por cada ciudad y terminando en la ciudad inicial.
### Modelo de Programación Lineal
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
### Modelo de Programación Lineal
**Variables:**
- X<sub>ij</sub>: {1 si se coloca 1 alfil en la casilla (i,j), 0 si no}

### Función Objetivo
Maximizar Σ<sub>i=1 to 8</sub> Σ<sub>j=1 to 8</sub> X<sub>ij</sub>

**Función Objetivo:** 
Para cada j en {0,7}:
- Σ<sub>i=1 to 8-j</sub> X<sub>i+j,i</sub> <= 2 (la diagonal hacia abajo a la derecha suma a lo sumo 2)
- Σ<sub>i=1 to 8-j</sub> X<sub>i,i+j</sub> <= 2 (la diagonal hacia arriba a la derecha suma a lo sumo 2)
- Σ<sub>i=1 to 8-j</sub> X<sub>9-i-j,i</sub> <= 2 (la diagonal hacia abajo a la izquierda suma a lo sumo 2)
- Σ<sub>i=1 to 8-j</sub> X<sub>9-i,i+j</sub> <= 2 (la diagonal hacia arriba a la izquierda suma a lo sumo 2)

## Ejercicio 12 - Rey Abandonado 
tablero de ajedrez de (n x n) y el rey esta en (s,t) y necesita llegar a (u,v) ambos validos. 

### Modelo de Programación Lineal
E = conjunto de casilleros ocupados por piezas enemigas(el rey no tiene que pasar por estos)
**Variables:**

x_i_j = {si el camino del rey pasa por la casilla (i,j) 0 si no} 

### Función Objetivo 

Minimizar: sum (i,j) en {1..n}x{1..n} x_i_j 

**Restricciones:**
- for all (i,j) en {E}: x_i_j = 0; 
- X_s_t = 1 y X_u_v = 1
forall (i,j) / (u,v) y (s,t)
8*x_i_j >= x_i+1_j + x_i_j+1 + x_i-1_j + x_i_j-1 + x_i+1_j+1 + x_i+1_j-1 + x_i-1_j+1 + x_i-1_j-1
si una casilla es 1 al menos alguna de las cercanas es 1.

## Ejercicio 13 - Compañía de Construcción

Este ejercicio trata sobre el transporte de arena desde los sitios (A, B, C) hasta los sitios (1, 2, 3).

### Modelo de Programación Lineal

**Variables:**

- X<sub>i,j</sub>: Cantidad de kilos de arena transportados por el camión que va desde el sitio i hasta el sitio j (siendo i, j elementos de {A, B, C} y {1, 2, 3} respectivamente).
- Y<sub>i,j</sub>: Cantidad de camiones que viajan desde el sitio i hasta el sitio j.
- C: Cantidad total de camiones utilizados.
- Q: Binario que indica si se utilizó el quinto camión o no.

**Función Objetivo:**

Minimizar: Σ<sub>i ∈ {A, B, C}</sub> Σ<sub>j ∈ {1, 2, 3}</sub> x<sub>i_j</sub> * C<sub>i_j</sub> + C * 50 + Q * 15

**Restricciones:**
- Para todo (i, j) en {A, B, C} x {1, 2, 3}:
  - X<sub>i,j</sub> <= 600
- Para todo j en {1, 2, 3}:
  - Σ<sub>i ∈ {A, B, C}</sub> X<sub>i_j</sub> <= 700
  - Σ<sub>i ∈ {A, B, C}</sub> X<sub>2_j</sub> <= 600
  - Σ<sub>i ∈ {A, B, C}</sub> X<sub>3_j</sub> <= 400
- Para todo i en {A, B, C}:
  - Σ<sub>j ∈ {1, 2, 3}</sub> X<sub>i_1</sub> >= 800
  - Σ<sub>j ∈ {1, 2, 3}</sub> X<sub>i_2</sub> >= 500
  - Σ<sub>j ∈ {1, 2, 3}</sub> X<sub>i_3</sub> >= 400
- C <= 5
- Q >= C - 4 (si C = 4, Q puede ser 0 o 1 pero como busco minimizar Q = 0 pues suma costo a algo que quiero minimizar)

- ∑ (i, j) en {A, B, C} x {1, 2, 3}: Y<sub>i_j</sub> = C
- Para todo (i, j) en {A, B, C} x {1, 2, 3}:
  - 0.0001 * Y<sub>i,j</sub> <= X<sub>i,j</sub> <= Y<sub>i,j</sub> * 600

## Ejercicio 14 - Sudoku

### Modelo de Programación Lineal

**Variables:**
- x<sub>ij</sub>: Número que se coloca en la casilla (i, j)

### Función Objetivo

Maximizar: Σ<sub>(i,j) ∈ {1..n} × {1..n}</sub> x<sub>ij</sub> (Note: La función objetivo podría ser tanto de maximización como de minimización en este caso, ya que no afecta la solución del Sudoku)

### Restricciones:

- Para cada i en {1..9}: Σ<sub>j ∈ {1..9}</sub> x<sub>ij</sub> = 45, Σ<sub>i ∈ {1..9}</sub> x<sub>ji</sub> = 45 (la suma de cada fila y columna es 45)
- Para cada i, j, k en {1..9} con k ≠ j: x<sub>ij</sub> ≠ x<sub>ik</sub> (no hay repeticiones en las filas)
- Para cada i, j, k en {1..9} con k ≠ i: x<sub>ij</sub> ≠ x<sub>kj</sub> (no hay repeticiones en las columnas)
- Para cada i, j en {2, 5, 8} × {2, 5, 8}: Σ<sub>k = i-1 hasta i+1</sub> Σ<sub>n = j-1 hasta j+1</sub> x<sub>kn</sub> = 45 (cada cuadrante suma 45)
- Para cada i, j, r1, r2 en {1..3} × {1..3} × {0, 3, 6} × {0, 3, 6}:
   - Para cada k, n en {1..3} × {1..3} con i ≠ k y j ≠ n: x<sub>i+r1,j+r2</sub> ≠ x<sub>k+r1,n+r2</sub> (ningún número se repite en un cuadrante)


## Ejercicio 15 - Módulos

El objetivo de este ejercicio es minimizar la siguiente función:

min z = |x| + |y| + |w|

### Modelo de Programación Lineal

**Variables:**
- T<sub>i</sub>: Número real

**Función Objetivo:**
min Σ<sub>i ∈ {1, 2, 3}</sub> T<sub>i</sub>

**Restricciones:**
- x + y ≤ 1
- 2x + w = 3
- T<sub>1</sub> ≥ x
- T<sub>1</sub> ≥ -x
- T<sub>2</sub> ≥ y
- T<sub>2</sub> ≥ -y
- T<sub>3</sub> ≥ z
- T<sub>3</sub> ≥ -z


















