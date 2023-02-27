import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint

K = 3
u = 1
T = 4

start = 0 
stop = 25

increment = 1

t = np.arange(start, stop+1, increment)
y0 = 0

#y = K * U* (1-np.exp(-t/T)) solution to differential equation

#function that returns dx/dt
def system1order(y, t, K, T, u):
    dydt = (1/T) * (-y + K * u)
    return dydt

#solve ode
x = odeint(system1order, y0, t, args=(K, T, u))
print(x)

plt.plot(t,x)
plt.title('1. order Dynamic System dydt= (1/T) * (-y + K * u)')
plt.xlabel('t')
plt.ylabel('y(t)')
plt.grid()
plt.show() 

# theres a way to solve the diff eq discretly also 