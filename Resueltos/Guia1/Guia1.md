### Ejercicio 1 

Xi = cantidad de alimento 1,2 o 3 que sirvo en gramos 
Función objetivo: min  Σ( i = 1 a 3)  x_i * c_i / 30  
C_i = costo por 30 gramos 
S.A:  A_i_A  = vitamina A por 30 gramos del alimento i
Σ( i = 1 a 3) x_i >= 225 
Σ( i = 1 a 3) x_i * A_i_A / 30 >= 0.3g 
Σ( i = 1 a 3) x_i * A_i_B / 30 >= 0.12g 
Σ( i = 1 a 3) x_i * A_i_C / 30 >= 0.21g 

X_i E R 

### Ejercicio 2. 
Presupuesto: 1.000 millones de pesos 
Hay 6 proyectos. Por lo menos el 50% del proyecto de energía nuclear. 
Minimo 300 millones a energía solar 

Sol: 
Xi con i del 1 al 6. Cantidad de millones invertida en el proyecto i. 
U_i = utilidad neta de proyecto i 

Función objetivo: maximizar la sumatoria i en {1,...,6} U_i * X_i 

S.A: 
Sumatoria i en {1,...,6} X_i <= 1000
# invertir más de 300 millones en energía solar 
X_1 + X_2 >= 300 

financiar al menos el 50% de energía nuclear 
X_5 >= 200 

financió a lo sumo el proyecto completo 
0 <= X_i <= F_i 











Ejercicio 3 

Coloreo: un mapa de N regiones 
Quiero minimizar la cantidad de colores necesarios para pintar el mapa y que dos regiones limítrofes no sean pintadas del mismo color. 

X_i = color asignado a la región i
Y = maximo X_i == ‘cantidad de colores utilizados’ 
Función objetivo: minimizar Y
Notar que X_i está limitado a N pues no voy a necesitar más de n colores.
B= variable Binaria {0,1}
S.A:  para cada región i consideró el conjunto limítrofes i.(no está el mismo)

X_i != X_j para todo j en {limitrofes i} para todo i 

Para cada i en {1,...,N}  agrego estas ecuaciones para todo j en {limitrofes i} para todo i 
X_i - X_j <=  -1 + N(1-B) 
X_i - X_j >=  1 - NB

X_i >= 1 
Y >= X_i para todo 
Y en N >= 0 

Ejercicio 4

X_i = Binario se elige la ubicación i 
P_i = cantidad producida de Pi 
Función objetivo: maximizar la sumatoria de i en {1,2,3} de 
X_i * (P1 * B_i_1 + P2* B_i_2 + P3*B_i_3) 

S.A: 
# se elige una ubicación 
Sumatoria x1 + x2 + x3  = 1 

# no se producen más de la capacidad de la ubicación elegida
X1 * (p1+p2+p3) <= 200
X2 * (p1+p2+p3) <= 400
X3 * (p1+p2+p3) <= 300

V  = volumen producido = p1*0.5+p2*2+p3 en cm^3
x1*(V-150)*200 +x2*(V-250)*250 + x3*(V-200)*200   <= 90000



Ejercicio 5

M entero conocido quiero minimizar z = f(x,y) 
S.a: x!=y 
X-Y <=  - 1 + 10M(1-B)
X-Y >= 1 - 10MB 
B en {0,1}

|x|<=M  |y|<= M 

X <= M
X >= - M 
Y <= M 
Y >= - M

Ejercicio 6 

Min z <= max{f1(x) , … , fs(x) }
Ax <= b 
X >= 0 

Problema de programación lineal: 
Minimizar y 
y  >= f1(x) , … , y >= fs(x) 
 Ax <= b 
x>=0
(x en R^n) 
Y en R 

Ejercicio 7

a. X O Y        		 x != y       x + y = 1 
b. x → y       		 x <= y 
c. x ← → y    		 x = y 
d. -(x o y)     		-x y -y       x + y = 0 
e. (x o y) –> z      	 x <= z , y <= z
f. x→(y y z) 		 2x <= y + z 
g.  X ← → (y y z)	 2x = y + z 
h. X o (y y no z)           2x + ( y - z ) >= 1    
i. X1 y x2 y…y xn  	 x1+x2…+xn >= n 
j. (x1 y x2 … y xn ) ←→ y     			n* y =x1 + x2 + ...+ xn 
k. (x1 o x2 … o xn ) ← → y 			x1+x2,...+xn >= y      x1 + x2 … + xn <= y*n 


Ejercicio 8

X_i_j = matriz binaria de 1  y 0 arranco contrato en el año i hasta j 

Función objetivo: maximizar sum i en (1,..,4) j en {2,...,5} T * x_i_j
Restricciones: 
Para todo i en {1,...,4} 
X_i_2 + x_i_3 + x_i_4+x_i_5 <= 1   # si inició el contrato en el año i solo puedo elegir 1 fin

( a → -b)        
Para todo (i,j) ## no iniciar otro proyecto mientras dura el elegido
X_i_j   + X_m_n  < 2  para todo i < n < j  y para todo i < m .
(ambos 0 válidas ) (si la primera es 1 la 2da tiene que ser 0 ) (si la 2da es 1 la primera tiene que ser 0)
Rellenar valores de la tabla con negativos para evitar elegirlos pero poder iterar bien? 
Ejerci
