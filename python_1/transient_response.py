
from control.matlab import*
from control import step_info
import numpy as np
import matplotlib.pyplot as plt
from system_analysis import*



zeta_wn = 1
wd = 2

theta = np.arctan(zeta_wn/wd)
zeta = np.sin(theta)
wn = wd/np.sqrt(1-zeta**2)

num = wn**2
den = [1, 2*zeta_wn, wn**2]

Gapprox = tf(num, den)
P1 = -50;
G1 = zpk([], [P1],[-P1]);
Gsys= G1*Gapprox

step_response(num, den)
#plt.figure(figsize=(20, 10))
#y1, t1=step(Gapprox,T)
#y2, t2=step(Gsys, T)

#I1=np.ones(np.shape(y1))
#I2=np.ones(np.shape(y2))
#plt.plot(t1,y1,color='r',linewidth=2); plt.plot(t1,I1,linewidth =2); plt.grid()
#plt.title('Step Response', fontsize=20)
#plt.plot(t2,y2,color='b',linewidth=2); plt.plot(t2,I2,linewidth =2);


