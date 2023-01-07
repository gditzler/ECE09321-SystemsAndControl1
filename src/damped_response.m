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

t = 0:0.02:4; 
omega = 3; 
sigma = 2; 
y = @(t) exp(-sigma*t).*cos(omega*t);
f = @(t) 1 - exp(-sigma*t).*cos(2*omega*t);

% figure; 
% hold on; 
% box on; 
% grid on; 
% plot(t, y(t), 'b')
% plot(t, exp(-sigma*t), 'r')
% plot(t, .2*cos(omega*t), 'k')
% legend({'Reponse', 'Decay Envelope', 'Oscillation'})
% xlabel('Time (s)', 'FontSize', 15);
% ylabel('System Output', 'FontSize', 15);
% set(gca, 'FontSize', 15);
% xlim([0, pi]);
% ylim([-0.3, 1]);

figure; 
hold on; 
box on; 
grid on; 
plot(t, f(t), 'b')
plot(t, 1+exp(-sigma*t), 'r')
plot(t, 1-exp(-sigma*t), 'r')
xlim([0, 2.5]);
legend({'Reponse', 'Decay Envelope'})
xlabel('Time (s)', 'FontSize', 15);
ylabel('System Output', 'FontSize', 15);
set(gca, 'FontSize', 15);

