#Definimos conjuntos útiles
set M := {1..4};
set A := {1..5};
set J := {"Regalia", "Limite", "Calidad"};
param calidad_hierro[A] := <1> 0.9, <2> 0.8, <3> 1.2, <4> 1, <5> 1.1;
set S := {1,2,3};
set K := {1..6};

#Definimos las variables
var x[M*A] real;
var y[M*A] binary;
var w[M*A] binary;
var z[A] real;
var d[K*A] binary; #delta
var l[K*A] real; #lambda

#parámetros
param t[J*M] :=                  |          1, 2, 3, 4|
		   |"Regalia" |         5, 7, 4, 6 |
		   | "Limite" |    2, 2.5, 1.7, 3 |
		   |"Calidad"| 1, 0.7, 1.5, 0.5 |;
param N := 4;

#función objetivo
maximize ganancia: sum <a> in A: (-y[1,a] * t["Regalia", 1] - y[2,a] * t["Regalia", 2] - y[3,a] * t["Regalia", 3] - y[4,a] * t["Regalia", 4]) - (sum <a> in A: (z[a])) + (sum <a,m> in A*M: (10*x[m,a]));

#restricciones
subto todasAbiertas: forall <m> in M: y[m,1] == 1;
subto positivasx: forall  <m,a> in M*A: x[m,a] >= 0;
subto limites1: forall  <m,a> in M*A: x[m,a] <= t["Limite",m]; # x esta en millones extraidos 
subto maxExplotadas: forall <a> in A: sum <m> in M: w[m,a] <= 3;
subto minasCerradas: forall <b, a, m> in A*A*M with b >= a: N*y[m,a] >= x[m,b]; #revisar
subto calidadHierro: forall <a> in A: sum <m> in M: x[m,a] * t['Calidad', m] >= (calidad_hierro[a] * sum <m> in M: x[m,a]);
subto unSegmento: forall <a> in A: sum <i> in S: d[i,a] == 1;
subto xValido1: forall <a> in A: l[1,a] + l[2,a] == d[1,a];
subto xValido2: forall <a> in A: l[3,a] + l[4,a] == d[2,a];
subto xValido3: forall <a> in A: l[5,a] + l[6,a] == d[3,a];
subto funcion1:  forall <a> in A: 2/3 * sum <m> in M: x[m,a] == 2*d[2,a]+2*d[3,a]+4*d[4,a]+4*d[5,a]+5*d[6,a];
subto funcion2:  forall <a> in A: z[a] == 4*d[2,a]+7*d[3,a]+13*d[4,a]+27*d[5,a]+32*d[6,a];
subto positivasd: forall <k,a> in K*A: d[k,a] >=0;
subto relacionWyX1: forall <m,a> in M*A: N*w[m,a] >= x[m,a];
subto relacionWyX2: forall <m,a> in M*A: w[m,a] <= x[m,a];