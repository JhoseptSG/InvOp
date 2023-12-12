set M := {1..4};
set A := {1..5};
set S := {1..3}; 
set T := {1..6};

var x[M*A] real;
var y[M*A] binary;
var z[M*A] binary;
var amb[A] real;
var delta[S*A] binary;
var lambda[T*A] real;
var f[A] real;

param B[M] := <1> 2, <2> 2.5, <3> 1.7, <4> 3;
param Ind[M] := <1> 1, <2> 0.7, <3> 1.5, <4> 0.5;
param Reg[M] := <1> 5, <2> 7, <3> 4, <4> 6;
param Cal[A] := <1> 0.9, <2> 0.8, <3> 1.2, <4> 1, <5> 1.1;
param epsilon := 0.01;

maximize ganancia : (sum <m,a> in M *A : (10*x[m,a] - Reg[m] * z[m,a])) - sum <a> in A: (f[a]);

subto r1 : forall <a> in A: 
                sum <m> in M : y[m,a] <= 3;
subto r2 : forall <m,a> in M*A : 
                y[m,a] <= z[m,a];
subto r3 : forall <m,a> in M*{1..4} : 
                z[m,a+1] <= z[m,a];
subto r4 : forall <m,a> in M*A :
                x[m,a] <= B[m]*y[m,a];
subto r5 : forall <a> in A :
                sum <m> in M : (x[m,a]*Ind[m]) >= Cal[a] * (sum <m> in M : x[m,a]);
subto r6 : forall <a> in A :
                sum <m> in M : 2/3 * x[m,a] <=  amb[a];
subto r7 : forall <a> in A:
                amb[a] >= 0;
subto r8 : forall <a> in A:
                amb[a] <= 5;
subto r9 : forall <a> in A:
               sum <s> in S: (delta[s,a]) == 1;
subto r10 : forall <a> in A:
            lambda[1,a] + lambda[2,a] == delta[1,a];
subto r11 : forall <a> in A:
            lambda[3,a] + lambda[4,a] == delta[2,a];
subto r12 : forall <a> in A:
            lambda[5,a] + lambda[6,a] == delta[3,a];
subto r13 : forall <a> in A:
            amb[a] == 0*lambda[1,a] + 2*lambda[2,a] + 2*lambda[3,a] + 4*lambda[4,a] + 4*lambda[5,a] + 5*lambda[6,a];
subto r14 : forall <a> in A:
            f[a] == 0*lambda[1,a] + 4*lambda[2,a] + 7*lambda[3,a] + 13*lambda[4,a] + 27*lambda[5,a] + 32*lambda[6,a];
subto r15 : forall <a> in A:
            lambda[3,a] <= 1 - epsilon;
subto r16 : forall <a> in A:
            lambda[5,a] <= 1 - epsilon;
subto r17 : forall <m,a> in M * A:
            x[m,a] >= 0;
subto r18 : forall <a> in A:
            amb[a] >= 0;
subto r19 : forall <a> in A:
            f[a] >= 0;
subto r20 : forall <t,a> in T*A:
            lambda[t,a] >= 0;
