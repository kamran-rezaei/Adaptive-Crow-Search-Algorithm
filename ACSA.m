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

function [best_fit,best_pos,convergence_curve]=ACSA(pop_size,max_iter,lb,ub,dim)
% Input arguments:
%   - pop_size: The population size.
%   - max_iter: The maximum number of iterations.
%   - lb: The lower bounds for the search space.
%   - ub: The upper bounds for the search space.
%   - dim: The dimensionality of the search space.
% Output arguments:
%   - best_fit: The best fitness value found by the algorithm.
%   - best_pos: The best solution found by the algorithm.
%   - convergence_curve: The convergence curve storing the best fitness
%                        values at each iteration.

% Initialization
x=initialization(pop_size,dim,lb,ub); % Initialize the population
xn=x;
pop_fit=zeros(1, pop_size);
xnew=zeros(pop_size,dim);
for i=1:pop_size
    pop_fit(i)=ObjectiveFunction(xn(i,:)); % Evaluate fitness for each individual
end
mem=x;
mem_fit=pop_fit;
convergence_curve = zeros(1,max_iter);
for iter=1:max_iter
    num=ceil(pop_size*rand(1,pop_size));
    for i=1:pop_size
        AP = (rand*(1-(iter/max_iter)))*0.5;
        if rand>AP
            xnew(i,:)= x(i,:)+2*rand*(mem(num(i),:)-x(i,:));
        else
            for j=1:dim
                xnew(i,j)=rand*(ub-lb)+lb;
            end
        end
    end
    xn=xnew;

    % Evaluate fitness for the new population
    for i=1:pop_size
        pop_fit(i)=ObjectiveFunction(xn(i,:));
    end
    for i=1:pop_size
        if xnew(i,:)<ub
            if  xnew(i,:)>lb
                x(i,:)=xnew(i,:);
                if pop_fit(i)<mem_fit(i)
                    mem(i,:)=xnew(i,:);
                    mem_fit(i)=pop_fit(i);
                end
            end
        end
    end
    best_fit= min(mem_fit);
    ngbest=find(mem_fit==min(mem_fit));
    best_pos=mem(ngbest(1),:);

    % Store the best fitness value at each iteration
    convergence_curve(iter)=min(mem_fit);

    % Display iteration information
    disp(['Iteration ' num2str(iter) ': Best Cost = ' num2str(best_fit)]);
end
