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


