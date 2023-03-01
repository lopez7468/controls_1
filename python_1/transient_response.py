from control.matlab import*
from control import step_info
import numpy as np
import matplotlib.pyplot as plt


Tf=20# plot range
T=np.arange(0,Tf,0.1)

zeta_wn = 10
wd = 2

theta = np.arctan(zeta_wn/wd)
zeta = np.sin(theta)
wn = wd/np.sqrt(1-zeta**2)

num = wn**2
den = [1, 2*zeta_wn, wn**2]

Gapprox = tf(num, den)
P1 = -5;
G1 = zpk([], [P1],[-P1]);
Gsys= G1*Gapprox



y1, t1=step(Gapprox,T)
y2, t2=step(Gsys, T)


plt.plot(t1,y1,'r') 


plt.title('Step Response')
plt.plot(t2,y2,'b') 


plt.grid()
plt.show()


