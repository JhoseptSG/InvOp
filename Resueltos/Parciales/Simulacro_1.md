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












