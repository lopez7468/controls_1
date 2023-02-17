% Nise, N.S. 
% Control Systems Engineering, 8th ed. 
% John Wiley & Sons, Hoboken, NJ, 07030
%
% Control Systems Engineering Toolbox Version 8.0 
% Copyright © 2019 by John Wiley & Sons, Inc.
%   
% Chapter 2: Modeling in the Frequency Domain
%    
% (ch2apB1): Bit strings will be used to identify parts of this tutorial on the 
% computer output. Bit strings are represented by the text enclosed in 
% apostrophes, such as 'ab'. Comments begin with % and are ignored by MATLAB. 
% Numbers are entered without any other characters. Arithmetic can be 
% performed using the proper arithmetic operator. Numbers can be assigned
% using a left-hand argument and an equals sign. Finally, we can find the
% magnitude and angle of a complex number,Q using abs(Q) and angle(Q),
% respectively.

'(ch2apB1)'                         % Display label.
'How are you?'                      % Display string.
-3.96                               % Display scalar number -3.96.
-4+7i                               % Display complex number -4+7i.
-5-6j                               % Display complex number -5-6j.
(-4+7i)+(-5-6i)                     % Add two complex numbers and 
                                    % display sum.                                                                                                                                    
(-4+7j)*(-5-6j)                     % Multiply two complex numbers and                                                       
                                    % display product.
M=5                                 % Assign 5 to M and display.
N=6                                 % Assign 6 to N and display.
P=M+N                               % Assign M+N to P and display.
Q=3+4j                              % Define complex number, Q.
MagQ=abs(Q)                         % Find magnitude of Q.
ThetaQ=(180/pi)*angle(Q)            % Find the angle of Q in degrees.
