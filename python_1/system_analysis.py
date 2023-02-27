from control.matlab import*
from control import step_info
import numpy as np
import matplotlib.pyplot as plt



Tf=20# plot range
T=np.arange(0,Tf,0.1)

#stability margins
def stability(up, down):
    lti = tf(up,down)
    gm, pm, wg, wp = margin(lti)
    print()
    print('Gain Margin(Gm)(db): ', gm)
    print('Phase Margin(Gm)(deg.): ', pm)
    print('Gain Crossover Frequency(Wg)(rad/sec): ', wg)
    print('Phase Crossover Frequency(Pm)(rad/sec): ', wp)

#step resonse
def step_response(up, down):
    lti = tf(up,down)
    plt.figure(figsize=(20, 10))
    y1, t1=step(lti,T)
    info = step_info(lti)#step response parameters
    print()
    print('Rise Time(sec) = ', info['RiseTime'])
    print('Overshoot(%)', info['Overshoot'])
    print('Peak Time(sec) = ', info['PeakTime'])
    print('Settling Time (sec) =', info['SettlingTime'])
    print('Steady State Value = ', info['SteadyStateValue'])
    I1=np.ones(np.shape(y1))
    plt.plot(t1,y1,color='r',linewidth=2); plt.plot(t1,I1,linewidth =2); plt.grid()
    plt.title('Step Response', fontsize=20)
    
#impulse response
def impulse_response(up, down):
    lti = tf(up,down)
    plt.figure(figsize=(20, 10))
    y2, t2=impulse(lti,T)
    I2=np.zeros(np.shape(y2))
    plt.plot(t2,y2,color='r',linewidth=2); plt.plot(t2,I2,linewidth =2); plt.grid()
    plt.title('Impulse Response', fontsize=20)

#ramp response
def ramp_response(up, down):
    down.append(0)
    lti = tf(up,down)
    plt.figure(figsize=(20, 10))
    y3, t3=impulse(lti,T)
    plt.plot(t3,y3,color='r',linewidth=2); plt.plot(t3,t3,linewidth =2); plt.grid()
    plt.title('Ramp Response', fontsize=20)

#pole-zero plot
def pole_0_plot(up,down):
    lti = tf(up,down)
    plt.figure(figsize=(20, 10))
    p, z=pzmap(lti, grid=True)
    plt.title('Pole-Zero Plot', fontsize = 20)
    print()
    print('Poles: ',p)
    print('Zeros',z)

#Bode Plot
def bode_plot(up, down):
    lti = tf(up,down)
    plt.figure(figsize=(20, 10))
    mag, phase, omega = bode(lti, linewidth=2, color='r')
    plt.title('Bode Plot', fontsize=20)

#nyquist plot
def nyquist_plot(up, down):
    lti = tf(up,down)
    plt.figure(figsize=(15,15))
    plt.axis('equal')
    R1,I,W = nyquist(lti, color='r', linewidth=2)
    plt.title('Nyquist PLot', fontsize=20)

#nichols plot
def nichols_plot(up, down):
    lti = tf(up,down)
    plt.figure(figsize=(20,10))
    nichols(lti)
    plt.title('Nichols Plot', fontsize=20)

#root locus plot
def root_locus_plot(up, down):
    lti = tf(up,down)
    plt.figure(figsize=(20,10))
    plt.axis('equal')
    R2, K=rlocus(lti, xlim=[-10,0])
    plt.title('Root Locus', fontsize=20)

# multiplies 2 polynomials and outputs a list
def conv(poly1, poly2):
    a = np.polymul(poly1, poly2)
    b = a.tolist()
    return b
