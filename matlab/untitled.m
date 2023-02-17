cla;
num= [ 1 2 3 ]
den=[2 3 4 5]
tx=length(step(num,den));
t=0:tx-1; ft=ones(1,tx); %creates step function
step(num, den); hold on; plot(t,ft,'r'); hold off; grid;