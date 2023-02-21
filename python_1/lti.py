from control.matlab import*
from control import step_info
import numpy as np
import matplotlib.pyplot as plt
from system_analysis import*

num = [1, 4]
den = [1,1,4,2]
bruh =np.polymul([1, 4], [1,1,4,2])
bruh=conv(num, den)

print(bruh)
sys = tf(num,den)
print('G(s)= ', sys)

Tf=15# plot range
T=np.arange(0,Tf,0.1)

#stability
stability(num, den)

#insert plots needed here
#step_response(num, den)



plt.show()