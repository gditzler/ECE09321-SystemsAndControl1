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
clc;
clear;
close all;

figure; 
hold on; 
grid on; 

% location of the pole specified by the student
p = -2+1i*4;

% plot out the boundaries of valid poles and the location of the poles
% specified by the student. 
plot([0,-22], [0, 22], 'LineWidth', 2)
plot([22,-22], [0, 0], 'k', 'LineWidth', 2)
plot([0, 0], [-22, 22], 'k', 'LineWidth', 2)
plot([-1, -1], [-22, 22], 'r', 'LineWidth', 2)
plot([-22, 0], [pi, pi], 'r', 'LineWidth', 2)
plot(real(p), imag(p), 'x', 'MarkerSize', 15, 'LineWidth', 2)
xlim([-20, 2])
ylim([-2, 20])
