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

t = 0:0.01:6; 
G_od = tf(9, [1, 9, 9]);
G_ud = tf(9, [1, 2, 9]);
G_cd = tf(9, [1, 6, 9]);

[g_od, t_od] = step(G_od, t); 
[g_ud, t_ud] = step(G_ud, t); 
[g_cd, t_cd] = step(G_cd, t); 

figure; 
hold on; 
grid on; 
box on; 
plot(t_od, g_od, 'r', 'LineWidth', 3)
plot(t_ud, g_ud, 'k', 'LineWidth', 3)
plot(t_cd, g_cd, 'b', 'LineWidth', 3)
legend('Overdamped', 'Underdamped', 'Critically Damped', 'Location', 'Best')
xlabel('Time (seconds)')
set(gca, 'fontsize', 20)

