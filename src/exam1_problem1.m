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
% 
clc
clear
close all 

tp = 0.15; 
yfv = 1.5;
yp = 1.75; 

po = (yp - yfv)/yfv;
zeta = sqrt(log(po)^2/(pi^2+log(po)^2)); 
wd = pi/tp;
theta = acos(zeta);
wn = wd/sqrt(1-zeta^2);
sigma = zeta*wn;
alpha = wn^2*yfv;

sys = tf(alpha, [1, 2*zeta*wn, wn^2]);
[y, t] = step(sys, 0:0.001:1.5); 

figure;
hold on; 
grid on; 
box on; 
plot(t, y, 'LineWidth', 3) 
plot([tp tp], [0 yp], 'LineWidth', 3)
ylim([0, 2.25])
xlabel('Time (s)', 'FontSize', 22)
ylabel('Step Response', 'FontSize', 22)
set(gca, 'FontSize', 22)