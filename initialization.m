
function X=initialization(pop_size,dim,lb,ub)

for i=1:pop_size
    X(i,:)=rand(1,dim).*(ub-lb)+lb;
end

