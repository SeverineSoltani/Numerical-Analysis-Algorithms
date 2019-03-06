function [flopCount, A] = LUFactorization(A,n)

flopCount = 0;

for i = 1:n-1
    [maxValue, maxValueIndex] = max(abs(A(i:n,i)));
    swapThisRow = i - 1 + maxValueIndex;
    A([swapThisRow, i],:) = A([i, swapThisRow],:);
    
    for j = i + 1:n 
        A(j,i) = A(j,i)/A(i,i);
        flopCount = flopCount + 1;
        for k = i + 1:n 
            A(j,k) = A(j,k) - A(j,i)*A(i,k);
            flopCount = flopCount + 2;
        end
    end
end

end