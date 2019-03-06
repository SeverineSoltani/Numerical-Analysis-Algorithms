function [infinityNorm] = findInfinityNorm(A,n)

A = inv(A);

sumVec = [];
for i = 1:n
    sum = 0;
    for j = 1:n
        sum = abs(A(i,j)) + sum;
        sumVec(i, 1) = sum;
    end
end

infinityNorm = sumVec(1,1);
for i = 1:n
    if sumVec(i,1) > infinityNorm
        infinityNorm = sumVec(i,1);
    end
end

end