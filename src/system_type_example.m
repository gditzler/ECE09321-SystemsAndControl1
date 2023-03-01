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

% This is an example that we did in class on 03/01/2023. The question was
% related to determining the steady state error of type 0, 1 and 2 systems.
clc; 
clear; 
close all;  

t = 0:0.01:30; 

% G(s) = 10(s+1)/(s^n(s+4)(s+5))
G_n0 = zpk(-1, [-4, -5], 10);
G_n1 = zpk(-1, [0, -4, -5], 10);
G_n2 = zpk(-1, [0, 0, -4, -5], 10);

% find the CLTF
T_n0 = feedback(G_n0, 1); 
T_n1 = feedback(G_n1, 1); 
T_n2 = feedback(G_n2, 1); 

[y_n0, ~] = step(T_n0, t);
[y_n1, ~] = step(T_n1, t);
[y_n2, ~] = step(T_n2, t);

% 
figure; 
hold on;
grid on; 
box on; 
plot(t, ones(numel(t), 1), 'k', 'LineWidth', 3);
plot(t, y_n0, 'r', 'LineWidth', 3);
plot(t, y_n1, 'b', 'LineWidth', 3);
plot(t, y_n2, 'c', 'LineWidth', 3);
legend({'r(t)', 'Type0', 'Type1', 'Type2'}, 'Location', 'best')
xlabel('Time (seconds)')
ylabel('Time Response')
set(gca, 'FontSize', 20)
