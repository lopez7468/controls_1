clear all; close all;

zeta_wn = 1;
wd = 2;

theta = atan(zeta_wn/wd);
zeta = sin(theta);
wn = wd/sqrt(1-zeta^2);

Gapprox = tf([wn^2],[1 2*zeta_wn wn^2])

P1 = -50;
G1 = zpk([],(P1),-P1);
Gsys= G1*Gapprox

figure(1)
step(Gsys, "b", Gapprox, 'r')

'matlab is dumb'

