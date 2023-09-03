## Ejercicio 2 - Fábrica

### Modelo de Programación Lineal
- J := {1..3}
- I := {1..N}
- P<sub>j</sub> = Producto j
- v<sub>j</sub> = Precio unitario del producto j. real
- e<sub>ij</sub> = nivel de experticia del candidato i para producir P<sub>j</sub>. real
- g<sub>i</sub> = la remuneración pretendida por turno trabajado del candidato i.
- t<sub>ij</sub> = cantidad de unidades que elabora i de P<sub>j</sub>.

**Variables:**
- X<sub>ijdf</sub>: 1 si el trabajador i produce j en el día d franja f 0 sino.
- Y<sub>i</sub>: 1 si el candidato i es contratado 0 si no.

### Función Objetivo
- maximizar ∑<sub>ijdf</sub> en {I*J*S*F} X<sub>ijdf</sub> * (v<sub>j</sub> * t<sub>ij</sub> - g<sub>i</sub>);

### Restricciones:
- forall <i,d> in <I,S>: ∑<sub>j,f</sub> in <J,F>: X<sub>ijdf</sub> <= 1.
- forall <i> in <I>: ∑<sub>j,d,f</sub> in <J,S,F>: 3 <= X<sub>ijdf</sub> <= 5.
- forall <i,d> in <I,S>: ∑<sub>j</sub> in J: (X<sub>ijd3</sub> + X<sub>ij(d+1)1</sub>) <= 1.
- forall <j,d,f> in <J,S,F>: ∑<sub>i</sub> in <I>: (X<sub>ijdf</sub> * e<sub>ij</sub>) >= 0.6
- forall <j> in <J>: ∑<sub>i,d,f</sub> in <I,D,F>: (l<sub>j</sub> <= X<sub>ijdf</sub> * t<sub>ij</sub> <= u<sub>j</sub>)
- forall <j,d,f> in <J,S,F>: ∑<sub>i</sub> in <I>: (X<sub>ijdf</sub> * t<sub>ij</sub>) <= E<sub>j</sub>
- ∑<sub>i</sub> in <G>: Y<sub>i</sub> = |G| * Y<sub>g1</sub>; (g1 alguien dentro del grupo)
- ∑<sub>i</sub> in <H>: Y<sub>i</sub> <= N/2
- forall <d,f> in <S,F>: X<sub>i3df</sub> - X<sub>i1df</sub> <= 10 y X<sub>i1df</sub> - X<sub>i3df</sub> <= 10
- forall <i> in I: Y<sub>i</sub> <= ∑<sub>j,d,f</sub> in <J,D,F> X<sub>ijdf</sub> <= Y<sub>i</sub> * 5

**Parte 2**
a.
- T<sub>d_f</sub> = Variable auxiliar extra.
- maximizar T<sub>d_f</sub>.
- forall <d,f> in <D,F> T<sub>df</sub> <= ∑<sub>i,j</sub> in <I * J>: X<sub>ijdf</sub>;


## Ejercicio 3 - Fábrica

### Modelo de Programación Lineal
- A = {1..N} actividades de inversion
- M = {1..48}
- S = {1..3}
- K = {1..6}
- l_i = duracion de la actividad i.
- m_i = minimo de inversion en la actividad i. 
- r_i = retorno de la actividad i por peso invertido por mes de duracion. 

**Variables:**
- X_i_m1_m2 = cantidad de dinero invertida en la actividad i en el mes m1 hasta el mes m2.
- Y_i_m1_m2 = si se  invierte en la actividad i en el mes m1 hasta el mes m2.
- CI_m = capital en el mes i post impuestos.
- C_m =  capital en el mes i pre impuestos. 
- I_m =  impuesto en el mes i. (2..48)
- F_s_m = binaria si esta en el segmento s 
- L_k_m = Son los coeficientes de la combinación lineal entre los extremos del intervalo correspondiente.
### Función Objetivo
- maximizar C_49. 

### Restricciones: 
- forall <i> in <A> : sum <m1,m2> in <M,M> : Y_i,m1,m2 <= 1 ;
- forall <i,m1,m2> in <A/B,M,M>  with m2 < m1 + l_i -1: Y_i,m1,m2 == 0 ;
- forall <i,m1,m2> in <B,M,M>  with m2 > m1 + u_i -1: Y_i,m1,m2 == 0 ;

- forall <m1> in <M> : sum <i,m2> in <A,M> : X_i_m1_m2 <= CI_m1;
- forall <m> in {2..49} : C_m = C_(m-1) - sum <i,m2> in <A,M> Y_i,m-1,m2 + sum <i,m1> in <A,M> (Y_i,m1,m-1) * r_i * (m1-m+1)
- C_1 = C = CI_1
- forall <i,m1,m2> in <A,M,M> :   m_i * Y_i_m1_m2 <= X_i_m1_m2 <= M*Y_i_m1_m2  ; 
- forall <m> in {2..48} = CI_m == C_m - I_m


- forall <m> in {2..48} :  sum s in {S} : F_s_m = 1 
- forall <m,s> in {2..48} x {S} : F_s_m = L_2s-1_m + L_2s_m 
- forall <m,k> in {2..48} x {K} : L_k_m >= 0; 
- forall <m> in {2..48} C_m == 0 * L_1_m + 2000 * L_2_m + 2000 * L_3_m + 5000 * L_4_m + 5000 * L_5_m + 500 000 * L_6_m
- forall <m> in {2..48} I_m = 0 * L_1_m + 20 * L_2_m + 20 * L_3_m + 65 * L_4_m + 65 * L_5_m + 9965 * L_6_m




