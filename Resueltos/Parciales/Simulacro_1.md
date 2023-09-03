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
- forall <d,f> in <D,F> T<sub>df</sub> <= ∑<sub>i,j</sub> in <I * J>: X<sub>ijdf</sub>


## Ejercicio 3 - Fábrica

### Modelo de Programación Lineal
- A = {1..N} actividades de inversión
- M = {1..48}
- S = {1..3}
- K = {1..6}
- l<sub>i</sub> = duración de la actividad i.
- m<sub>i</sub> = mínimo de inversión en la actividad i.
- r<sub>i</sub> = retorno de la actividad i por peso invertido por mes de duración.

**Variables:**
- X<sub>i_m1_m2</sub> = cantidad de dinero invertida en la actividad i en el mes m1 hasta el mes m2.
- Y<sub>i_m1_m2</sub> = si se invierte en la actividad i en el mes m1 hasta el mes m2.
- CI<sub>m</sub> = capital en el mes i post impuestos.
- C<sub>m</sub> = capital en el mes i pre impuestos.
- I<sub>m</sub> = impuesto en el mes i. (2..48)
- F<sub>s_m</sub> = binaria si está en el segmento s
- L<sub>k_m</sub> = Son los coeficientes de la combinación lineal entre los extremos del intervalo correspondiente.

### Función Objetivo
- maximizar C<sub>49</sub>.

### Restricciones:
- forall <i> in <A>: ∑<sub>m1,m2</sub> in <M,M>: Y<sub>i,m1,m2</sub> <= 1
- forall <i,m1,m2> in <A/B,M,M> with m2 < m1 + l<sub>i</sub> - 1: Y<sub>i,m1,m2</sub> == 0
- forall <i,m1,m2> in <B,M,M> with m2 > m1 + u<sub>i</sub> - 1: Y<sub>i,m1,m2</sub> == 0

- forall <m1> in <M>: ∑<sub>i,m2</sub> in <A,M>: X<sub>i_m1_m2</sub> <= CI<sub>m1</sub>
- forall <m> in {2..49}: C<sub>m</sub> = C<sub>m-1</sub> - ∑<sub>i,m2</sub> in <A,M> Y<sub>i,m-1,m2</sub> + ∑<sub>i,m1</sub> in <A,M> (Y<sub>i,m1,m-1</sub>) * r<sub>i</sub> * (m1-m+1)
- C<sub>1</sub> = C = CI<sub>1</sub>
- forall <i,m1,m2> in <A,M,M>: m<sub>i</sub> * Y<sub>i_m1_m2</sub> <= X<sub>i_m1_m2</sub> <= M*Y<sub>i_m1_m2</sub>
- forall <m> in {2..48} = CI<sub>m</sub> == C<sub>m</sub> - I<sub>m</sub>

- forall <m> in {2..48}: ∑<sub>s</sub> in {S}: F<sub>s_m</sub> = 1
- forall <m,s> in {2..48} x {S}: F<sub>s_m</sub> = L<sub>2s-1_m</sub> + L<sub>2s_m</sub>
- forall <m,k> in {2..48} x {K}: L<sub>k_m</sub> >= 0
- forall <m> in {2..48} C<sub>m</sub> == 0 * L<sub>1_m</sub> + 2000 * L<sub>2_m</sub> + 2000 * L<sub>3_m</sub> + 5000 * L<sub>4_m</sub> + 5000 * L<sub>5_m</sub> + 500 000 * L<sub>6_m</sub>
- forall <m> in {2..48} I<sub>m</sub> = 0 * L<sub>1_m</sub> + 20 * L<sub>2_m</sub> + 20 * L<sub>3_m</sub> + 65 * L<sub>4_m</sub> + 65 * L<sub>5_m</sub> + 9965 * L<sub>6_m</sub>





