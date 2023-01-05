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

% step size when we plot the time response. a value of 10-15 works well
step = 15;
% time response 
t = 0:0.01:5;
% function that is the time reponse that we found by hand
f_ex = @(t) (7*exp(-4*t)-exp(-t))/3;

% now we are going to find the solution in matlab. we're given the definition of
% F(s) so let us go ahead and define the transfer function as it is given to us.
% then we need to find the impulse reponse since that will give us the reponse
% that we want to plot. note, we're going to pass the desired time response that
% we would like through the variable t. 
F = tf([2, 1], [1, 5, 4]);
[f_matlab, ~] = impulse(F, t);

% plot the reponses
figure; 
hold on; 
box on; 
grid on; 
plot(t, f_ex(t))
plot(t(1:step:end), f_matlab(1:step:end), 'ro');
legend({'Pen ''n Paper Solution', 'Matlab Solution'}, 'FontSize', 15);
xlabel('Time (s)', 'FontSize', 15);
ylabel('System Output', 'FontSize', 15);
set(gca, 'FontSize', 15);
xlim([0, max(t)]);
ylim([-0.15, 2]);