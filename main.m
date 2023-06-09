%_______________________________________________________________________________________%
%  Adaptive crow search algorithm (ACSA) source codes                                   %
%                                                                                       %
%  Developed in MATLAB R2016b                                                           %
%  Author and programmer: Kamran Rezaei                                                 %
%  Rezaei, K, Rezaei, H,                                                                %
%  e-Mail: kamran.rezaei6990@gmail.com                                                  %
%                                                                                       %
% Main paper:                                                                           %
% Rezaei, K., Rezaei, H., Adaptive crow search algorithm and its application in solving 
% constrained optimization problems,   %
%Aquila Optimizer: A novel meta-heuristic optimization Algorithm, 3rd International 
% Conference on Soft Computing (2019), 2260-2269
%_______________________________________________________________________________________%

clear 
close all
clc

pop_size=20;  
max_iter=2000; 
dim=10;
lb=-100;
ub=100;

[best_fit,best_pos,convergence_curve]=ACSA(pop_size,max_iter,lb,ub,dim);

plot(convergence_curve);
title('Convergence curve of ICSA')
xlabel('Iteration');
ylabel('Objective function value');
