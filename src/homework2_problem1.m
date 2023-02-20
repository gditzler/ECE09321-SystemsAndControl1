clc;
clear; 
close all; 

G1 = tf([5], [1, 5]);
G2 = tf([12], [1, 5, 4]);

[y1, t1] = step(G1); 
[y2, t2] = step(G2); 

figure; 
hold on; 
grid on; 
box on; 
plot(t1, y1, 'LineWidth', 3)
plot(t2, y2, 'LineWidth', 3)
