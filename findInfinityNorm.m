% findInfinityNorm finds the infinity of l-norm or n x n matrix A.
function [infinityNorm] = findInfinityNorm(A,n)

sumVec = []; % stores the sum of each row in a col. vector
for i = 1:n
    sum = 0;
    for j = 1:n
        sum = abs(A(i,j)) + sum; % sums up row of A
        sumVec(i, 1) = sum;
    end
end

infinityNorm = sumVec(1,1);
for i = 1:n
    if sumVec(i,1) > infinityNorm % find greatest value in sumVec
        infinityNorm = sumVec(i,1); % make the greatest sumVec value the infinityNorm
    end
end

end
