from control.matlab import*
from control import step_info
import numpy as np
import matplotlib.pyplot as plt
from system_analysis import*

num = [1]
den = [1,1]
sys= tf(num,den)

print('G(s)= ', sys)



#stability
stability(num, den)

#insert plots needed here

step_response(num, den)


#shows plots
plt.show()