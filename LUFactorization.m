% LUFactorization returns the LU factorization with partial pivoting 
% of A with its lower triangular portion overwritten to be L.
% LUFactorization also returns flop count.
function [flopCount, A] = LUFactorization(A,n)

flopCount = 0;

for i = 1:n-1
    [maxValue, maxValueIndex] = max(abs(A(i:n,i))); % finds largest value in col.
    swapThisRow = i - 1 + maxValueIndex;
    A([swapThisRow, i],:) = A([i, swapThisRow],:); % swaps row with largest col. value with current row
    
    for j = i + 1:n 
        A(j,i) = A(j,i)/A(i,i); % finds multiplier and overwrites in A
        flopCount = flopCount + 1;
        
        for k = i + 1:n 
            A(j,k) = A(j,k) - A(j,i)*A(i,k);
            flopCount = flopCount + 2;
        end
    end
end

end

% TODO
% Extension: add permutation matrix
