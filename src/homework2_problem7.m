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

PO = .12; 
zeta = sqrt(log(PO)^2/(pi^2+log(PO)^2)); 
theta = acos(zeta);
thetad = theta*180/pi;
sigma = 5/.6;
wn = sigma/cos(theta);  
wd = wn*sqrt(1-zeta^2); 

%% part 
clc
clear
close all 

PO = .1; 
Tp = 5; 

wd = pi/Tp;
zeta = sqrt(log(PO)^2/(pi^2+log(PO)^2)); 
theta = acos(zeta);
thetad = theta*180/pi;
wn = wd/sind(thetad);