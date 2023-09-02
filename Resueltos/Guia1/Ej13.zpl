# Conjunto 
set I := {"A","B","C"} ; 
set J := {1..3} ;
param Lim[I]:= <"A"> 700 , <"B"> 600, <"C"> 400 ;
param Req[J]:= <1> 800 , <2> 500 , <3> 400   ;
# parametros 
param Costo[I*J] := |1 , 2 , 3 |
                |"A"| 9 , 6 , 5 |
                |"B"| 7 , 4 , 9 |
                |"C"| 4 , 6 , 3 |;

# variables

var X[I*J] integer ; # cantidad  de kilos de arena de i a j 
var Y[I*J] integer ; # cantidad de camiones usados de i a j 
var C integer ; 
var Q binary ; 

# Funcion objetivo:

minimize costo: sum <i,j> in I*J:( X[i,j]*Costo[i,j] + C * 50 + Q *15 ); 

# Reestricciones: 

subto r1 : forall <i> in I : ( sum <j> in J : X[i,j]) <= Lim[i]  ; 
subto r2 : forall <j> in J : ( sum <i> in I : X[i,j]) == Req[j]  ; 
subto Nousomasde5 : C <= 5 ; 
subto rel_QC: Q >= C-4 ; 
subto rel_CY: (sum <i,j> in I*J : Y[i,j] ) == C   ; 
subto rel_XY: forall <i,j> in I*J : X[i,j] <= Y[i,j] * 600 ; 
