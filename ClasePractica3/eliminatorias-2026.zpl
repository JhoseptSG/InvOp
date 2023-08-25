
#definir variables

set I := {1..10};
var x[I*I] integer;
var p[I] integer;
var y[I] binary;
param M := 100;

#funcion objetivo

maximize max_puntaje: p[1];

#reestricciones

subto pasaron_6: sum <i> in I with i != 1: y[i] >= 6;

subto pi_biendef: forall <i> in I:  sum <j> in I with i != j: (3*x[i,j]+2-x[i,j]-x[j,i]) == p[i]  ;

subto maximo2V: forall <i,j> in I*I: x[i,j]<=2 ;

subto solo2Partidos: forall <i,j> in I*I: x[i,j] + x[j,i]<=2 ;

subto p_y_BienDef_1: forall <i> in I: p[1]-p[i] <= M*(1-y[i]) ; 

subto p_y_BienDef_2: forall <i> in I: p[i]-p[1] <= M*y[i]-1 ;

subto todos_x_mayores_a_0 : forall <i,j> in I*I : x[i,j] >= 0 ; 

subto todos_p_mayores_a_0 : forall <i> in I : p[i] >= 0;

#read /home/clinux01/Escritorio/clasePractica3/eliminatorias-2026.zpl
