F=zpk([],[-1 -2 -2],2)

numf=2;
denf=poly([-1 -2 -2]);
[r,p,k]=residue(numf,denf)

F=tf([3],[1 2 5 0])

residue([3],[1 2 5 0])


residue(numf,denf)

syms s
f=ilaplace...
(3/(s*(s^2+2*s+5)));
pretty(f)

syms s
f=ilaplace...
(10/(s*(s+2)*(s+3)^2))
pretty(f)

syms s
C=1/(s*(s + 2))
C=ilaplace(C)

t=0:0.01:3; plot...
(t,(1/2 -1/2*exp (-2*t)))
laplace(C)
