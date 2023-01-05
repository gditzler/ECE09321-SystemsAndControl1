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

% Problem 6: Parts (a) & (b) 
% Set the coefficents of the polynomials that characterize the numerator 
% and denominator of the transfer function. 
zero_coefficients = [1, 1/2];
pole_coefficients = [1, 5, 4];

% define the two transfer functions. Note that the difference is simply the
% gain of the systems. we could have also done 8*zero_coefficients. the
% transfer function is defined with `tf`
F1 = 8*tf(zero_coefficients, pole_coefficients); 
F2 = 2*tf(zero_coefficients, pole_coefficients); 

% find the step response of the system. we do not need to provide a second
% argument to the step function but there are others that can be added. for
% example, we could set the time duration of the step response. 
%  [y, t] = step(F, 0:0.02:22); % get the step response for 22s in 0.02s
%                               % increments.
[f1, t1] = step(F1); 
[f2, t2] = step(F2);

% plot the step responses 
figure; 
hold on; 
axis tight; 
box on; 
grid on; 
plot(t1, f1, 'r')
plot(t2, f2, 'b')
xlabel('Time (s)', 'FontSize', 15)
ylabel('System Output', 'FontSize', 15)
set(gca, 'FontSize', 15)

final_values = [f1(end), f2(end)]; 
disp(['Final Values: ', num2str(final_values)])


% Problem 6: Parts (c)
% set the values for the gains that we want to iterate over. 
K = 2:0.1:3; 

% open the figure first and turn on hold. 
figure; 
hold on; 
axis tight; 
box on; 
grid on;

for n = 1:length(K)
    % define the systems transfer function
    sys = tf([1, 1], [1, K(n)-1.0, 3]); 
    % get the step response 
    [f, t] = step(sys); 
    % plot the step response 
    plot(t, f);
end
xlabel('Time (s)', 'FontSize', 15)
ylabel('System Output', 'FontSize', 15)
set(gca, 'FontSize', 15)