### Ejercicio 9
Hay I distritos y cada uno tiene "pᵢ" alumnos, solo se pueden ubicar las escuelas en "J" sitios de la ciudad. 
"dᵢⱼ" ≥ 0 la distancia desde el centro del distrito i hasta el sitio j. 
En un sitio cabe a lo sumo un colegio y cada distrito debe tener asignado un colegio.
Cada colegio construido debe ser asignado al menos a un distrito y como mucho a 2. 
"cⱼ" = costo de construir el colegio j. 
"F" = constante de proporcionalidad "pᵢ" a la cantidad total de alumnos. 

Costo_j = c_j +F * s_j donde s_j es la suma de las poblaciones de los distritos asociados a ese colegio. 
B = presupuesto designado a construir todos los colegios. 
T_j = capacidad de alumnos soportado por el colegio construido en j. 
los distritos u y v deben ser atentidos por 2 colegios distintos. 

#### Modelo de programacion lineal. 
Variables:
X_ij = Binaria { 1 si el distrito i tiene asignado el colegio construido en el sitio j 0 sino} 
W_j = Binaria {1 si el colegio j es construido 0 sino}

W_j = 1 <--> sum de i en {I} X_i_j >= 1 para todo j en {J}
Funcion objetivo: minimizar sumatoria de (i,j) en {I}*{J} de d_ij * x_ij 

Reestricciones: 

forall i en {I}: sum de j en {J} d_ij = 1    
forall j en {J}: sum de i en {I} x_ij >= W_j 
forall j en {J}: sum de i en {I} x_ij <= 2 * W_j 
sum j en {J}: c_j * W_j  + sum i en {I} x_ij * pi * F * <= B
forall j en {J}: sum de i en {I} x_ij * p_i <= T_j 
forall j en {J}: x_u_j + x_v_j <= 1 
forall j en {J}: sum de i en {I} X_i_j >= W_j y sum de i en {I} X_i_j <= 2*(W_j) 






