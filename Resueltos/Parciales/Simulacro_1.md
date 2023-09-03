

## Ejercicio 2 - Fabrica

### Modelo de Programación Lineal
- J := {1..3}
- I := {1..N}
- P_j = Producto j 
- v_j = Precio unitario del producto j. real 
- e_ij = nivel de experticia del candidato i para producir P_j.  real 
- g_i = la remuneracion pretendida por turno trabajado del candidato i.
- t_ij = cantidad de unidades que elabora i de  P_j.

**Variables:**
- X<sub>ijdf</sub> : 1 si el trabajador i produce j en el dia d franja f 0 sino. 
- Y<sub>i</sub>  : 1 si el candidato i es contratado 0 si no. 
### Función Objetivo
- maximizar sum ijdf en {I*J*S*F} X<sub>ijdf</sub> * (v_j * t_ij - g_i) ;

### Restricciones:
- forall <i,d> in <I,S> : sum <j,f> in <J,F> : X<sub>ijdf</sub> <= 1. 
- forall <i> in <I> : sum <j,d,f> in <J,S,F> : 3 <= X<sub>ijdf</sub> <= 5.
- forall <i,d> in <I,S> : sum <j> in J : (X<sub>ijd3</sub> + X<sub>ij(d+1)1</sub> )<= 1.
- forall <j,d,f> in <J,S,F> : sum <i> in <I> : ( X<sub>ijdf</sub> * e_ij ) >= 0.6 
- forall <j> in <J> : sum <i,d,f> in <I,D,F> : ( l_j <= X<sub>ijdf</sub> * t_ij <= u_j )
- forall <j,d,f> in <J,S,F> : sum <i> in <I> : ( X<sub>ijdf</sub> * t_ij ) <= E_j
- sum <i> in <G> : Y_i = |G| * Y_g1 ; (g1 alguien dentro del grupo)
- sum <i> in <H> : Y_i <= N/2
- forall <d,f> in <S,F> : X_i3df - X_i1df <= 10 y X_i1df - X_i3df <= 10
- 


**Parte 2**
a. 
- T_d_f = Variable auxiliar extra. 
- maximizar T_d_f.  
- forall <d,f> in <D,F> T_k <= sum <i,j> in <I * J> : X_ijdf ;

b. 








