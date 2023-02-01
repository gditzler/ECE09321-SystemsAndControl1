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

t = 0:0.001:1.5;
Tp = .15;
PO = .5;
yfv= 1.5;

% damping frequency 
wd = pi/Tp; 
% damping ratio 
zeta = sqrt(log(PO)^2/(pi^2+log(PO)^2));
% natural frequency 
wn = wd/(sqrt(1-zeta^2));
% real part of the pole 
sigma = wn*zeta;
% related to the angle 
beta = sqrt(1-zeta^2);
% angle of the pole 
theta = acos(zeta);
% the gain of the system
alpha = wn^2*yfv;
f = (1 - 1/beta*exp(-sigma*t).*sin(wd*t+theta))*yfv;
g = @(x) (1 - 1/beta*exp(-sigma*x).*sin(wd*x+theta))*yfv;

figure; 
hold on;
box on
plot(t, f, 'LineWidth', 2)
plot([.15 .15], [0 2.25], 'LineWidth', 2)
plot(Tp, yfv*(1+exp(-sigma*Tp)), 'rx', 'LineWidth', 4)  
text(Tp+.02, .5, 'T_p = 0.15 s', 'FontSize', 22)
ylim([0, 2.5])
xlabel('Time (seconds)')
set(gca, 'fontsize', 20)
