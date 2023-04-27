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

% EXAMPLE SOLUTION 
% s = -0.5;
% K = 240
% z = -1; 
% p = -10; 

K = 240; 
z = -1; 
p = -10; 

G = zpk([], [1, -1], 1/10);
C = zpk(z, p, K);
T = feedback(minreal(G*C), 1);
pole_T = pole(T); 

design_spec = false; 
for i = 1:numel(pole_T)
    if abs(real(pole_T(i))+2) <= 0.01
        design_spec = true; 
    end
end

if design_spec
    disp('Design spec is met.')
else
    disp('Design spec is NOT met.')
end

pole_T
