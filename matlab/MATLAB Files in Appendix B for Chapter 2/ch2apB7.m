% Nise, N.S. 
% Control Systems Engineering, 8th ed. 
% John Wiley & Sons, Hoboken, NJ, 07030
%
% Control Systems Engineering Toolbox Version 8.0 
% Copyright � 2019 by John Wiley & Sons, Inc.
%																													
% (ch2apB7): The partial-fraction expansion for F(s) = b(s)/a(s) can be found 
% using the [K,p,k] = residue(b,a) command (K = residue; p = roots of denominator; 
% k = direct quotient, which is found by dividing polynomials prior 
% to performing a partial-fraction expansion). We expand 
% F(s) = (7s^2+9s+12)/[s(s+7)(s^2+10s+100)] as an example. Using 
% the results from MATLAB yields: F(s) = [(0.2554 - 0.3382i)/(s+5.0000 - 8.6603i)] +  
% [(0.2554 + 0.3382i)/(s+5.0000 + 8.6603i)] - [0.5280/(s+7)] +[ 0.0171/s].

'(ch2apB7)'                         % Display label.
numf=[7 9 12];                      % Define numerator of F(s).
denf=conv(poly([0 -7]),[1 10 100]);          
                                    % Define denominator of F(s).
[K,p,k]=residue(numf,denf)          % Find residues and assign to K; 
                                    % find roots of denominator and 
                                    % assign to p; find
                                    % constant and assign to k.
