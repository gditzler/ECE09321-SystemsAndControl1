% MIT License
% 
% Copyright (c) 2023 Gregory Ditzler
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
clc;
clear;
close all; 

% step size when we plot the time response. a value of 5 works well
step = 5; 
% define the system function  
G = tf([1, 0], [1, 12, 32]); 
% define the step function 
S = tf(1, [1, 0, 0]);
% Y = G*S; 
Y = series(G, S);
% use matlab to get the impulse response of Y. this is the solution 
[y_matlab, t] = impulse(Y);
% define the by-hand solution. 
y_solution = @(t) (1/32 - exp(-4*t)/16 + exp(-8*t)/32);

% plot the reponses
figure; 
hold on; 
box on; 
grid on; 
plot(t(1:step:end), y_solution(t(1:step:end)), 'ro')
plot(t, y_matlab, 'b')
legend({'Pen ''n Paper Solution', 'Matlab Solution'}, 'FontSize', 15, 'Location', 'Best');
xlabel('Time (s)', 'FontSize', 15);
ylabel('System Output', 'FontSize', 15);
set(gca, 'FontSize', 15);

% NOTE...
% the system function define by Y is not simplified. you can check this by
% printing out Y and you should see:
%   Y =
%               s
%     ---------------------
%     s^4 + 12 s^3 + 32 s^2
%  
%   Continuous-time transfer function.
%
% clearly, this function can be simplified by cancelling the `s` in the numerator  
% of the system function. we can call minreal() to reduce the system function
% down. 
Y_simplified = minreal(Y);
Y_simplified