
#Defino variables

set I := {1..10}; #cantidad de equipos  
var x[I*I] integer; #cantidad de partidos que gano i contra j 
var p[I] integer; #cantidad de puntos del equipo i 
var y[I] binary; # 1 si el equipo 1 clasifico 0 sino
param M := 100; # variable suficientemente grande pues cada equipo puede ganar hasta 54 puntos. 


#funcion objetivo

maximize max_puntaje: p[1]; #tomo i = 1 como argentina y calculo la maxima cantidad de puntos con la que argentina no clasifica 


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
