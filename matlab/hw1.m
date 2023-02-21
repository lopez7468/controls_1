

%12
g = zpk([-15 -26 -72],[0 -55 -56 roots([1 5 30])' roots([1 27 52])'], 5)
gf = tf(g)

%13
b=conv(10000, [1 5])
c = conv(b,[1 70]);

d = conv([1 0],[1 45])
e = conv([1 7 110], [1 55])
f = conv(d,e)
g = conv(f,[1 6 95])

[r,p,k] = residue(c,g)




