# Conjuntos 
set I := {1..4};
set J := {1..5}; 
set S := {1..3};
set K := {1..6};

# Parametros 
param R[I] := <1> 5 , <2> 7, <3> 4 , <4> 6 ;
param L[I] := <1> 2, <2> 2.5, <3> 1.7, <4> 3;
param IC[I]:= <1> 1 , <2> 0.7, <3> 1.5 , <4> 0.5 ;
param CP[J]:= <1> 0.9 , <2> 0.8, <3> 1.2 , <4> 1 , <5> 1.1 ;
param Eps := 0.001;

# Variables 
var Y[I*J] real; #Cantidad de toneladas extraidas 
var X[I*J] binary; #1 si use la mina ese año 0 si no 
var IA[J] real; # Indicador ambiental 
var CA[J] real; # Costo calculado del indicador ambiental F
var T[I] integer; # Ultimo año que use la mina  i
var F[S*J] binary; # En que segmentoe esta IA 
var V[K*J] real; # Coeficientes de combinacion lineal 

# Funcion objetivo: 
#Ganancia en millones #ton producidas por 10 millones cada una - todas las regalias por minas abiertas - costo ambiental por año.
maximize ganancia: (sum <i,j> in I*J : Y[i,j]*10) - (sum <i> in I : T[i]*R[i]) - (sum <j> in J : CA[j]) ;   

# reestricciones 
subto maximo_3minas: forall <j> in J : sum <i> in I : X[i,j] <= 3 ; 
subto Rel_TconX: forall <i,j> in I*J : T[i] >= j*X[i,j] ; 
subto Rel_YconX: forall <i,j> in I*J : Y[i,j] <= X[i,j] * L[i] ; 

subto todasinicianabiertas: forall <i> in I : T[i] >= 1; 

subto MinimoIA: forall <j> in J: IA[j] >= (sum <i> in I : Y[i,j] ) * 2 / 3  ; 

subto IAen1segmento: forall <j> in J: ( sum <s> in S : F[s,j] ) == 1 ;

subto coef_menoresaF: forall <s,j> in S*J: V[2*s-1,j]+V[2*s,j] == F[s,j] ;

subto IA_EslacombLineal : forall <j> in J: IA[j] == V[2,j] * 2 + V[3,j] * 2 + V[4,j] * 4 + V[5,j] * 4 + V[6,j] * 5 ; 
subto CA_EslacombLineal : forall <j> in J: CA[j] == V[2,j] * 4 + V[3,j] * 7 + V[4,j] * 13 + V[5,j] * 27 + V[6,j] * 32 ; 

subto seg_2_izq : forall <j> in J : V[3,j] <= 1 - Eps  ;
subto seg_3_izq : forall <j> in J : V[5,j] <= 1 - Eps ;

subto pureza_pedida: forall <j> in J: ( sum <i> in I : Y[i,j] *( IC[i] - CP[j] )  ) >= 0 ;

subto coef_mayoresa0: forall <k,j> in K*J :  V[k,j] >= 0 ;