from control.matlab import*
from control import step_info
import numpy as np
import matplotlib.pyplot as plt

num = [1,4]
den = [1,1,4]
sys = tf(num,den)
print('G(s)= ', sys)
den1=[1,1,4,0]
sys1=tf(num,den1) # tf for ramp response
Tf=15# plot range
T=np.arange(0,Tf,0.1)

#step resonse
plt.figure(figsize=(20, 10))
y1, t1=step(sys,T)
info = step_info(sys)#step response parameters
print()
print('Rise Time(sec) = ', info['RiseTime'])
print('Overshoot(%)', info['Overshoot'])
print('Peak Time(sec) = ', info['PeakTime'])
print('Settling Time (sec) =', info['SettlingTime'])
print('Steady State Value = ', info['SteadyStateValue'])
I1=np.ones(np.shape(y1))
plt.plot(t1,y1,color='r',linewidth=2); plt.plot(t1,I1,linewidth =2); plt.grid()
plt.title('Step Response', fontsize=20)
plt.show()

#impulse response
plt.figure(figsize=(20, 10))
y2, t2=impulse(sys,T)
I2=np.zeros(np.shape(y2))
plt.plot(t2,y2,color='r',linewidth=2); plt.plot(t2,I2,linewidth =2); plt.grid()
plt.title('Impulse Response', fontsize=20)
plt.show()

#ramp response
plt.figure(figsize=(20, 10))
y3, t3=impulse(sys1,T)
plt.plot(t3,y3,color='r',linewidth=2); plt.plot(t3,t3,linewidth =2); plt.grid()
plt.title('Ramp Response', fontsize=20)
plt.show()

#pole-zero plot
plt.figure(figsize=(20, 10))
p, z=pzmap(sys, grid=True)
plt.title('Pole-Zero Plot', fontsize = 20)
print()
print('Poles: ',p)
print('Zeros',z)
plt.show()

#Bode Plot
plt.figure(figsize=(20, 10))
mag, phase, omega = bode(sys, linewidth=2, color='r')
plt.title('Bode Plot', fontsize=20)
plt.show()

#stability margins

gm, pm, wg, wp = margin(sys)
print()
print('Gain Margin(Gm)(db): ', gm)
print('Phase Margin(Gm)(deg.): ', pm)
print('Gain Crossover Frequency(Wg)(rad/sec): ', wg)
print('Phase Crossover Frequency(Pm)(rad/sec): ', wp)

#nyquist plot

#plt.axis('equal')
#R1,I,W=nyquist(sys,color='r',linewidth=2)
#plt.title('Nyquist PLot', fontsize=20)
#plt.show()

#nichols plot

plt.figure(figsize=(20,10))
nichols(sys)
plt.title('Nichols Plot', fontsize=20)
plt.show()

#root locus plot
plt.figure(figsize=(20,10))
plt.axis('equal')
R2, K=rlocus(sys, xlim=[-10,0])
plt.title('Root Locus', fontsize=20)
plt.show()