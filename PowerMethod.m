% PowerMethod returns the dominant eigenvector of A, 
% a matrix in sparse format.
% PowerMethod also returns flop count.


function [lambda, flopcount] = PowerMethod(N,r,c,v,n)

    initGuess = ones(n,1); % initial guess of col. vector of 1s
    
    flopcount = 0;
    m = length(v);
    A = zeros(n,n);

    for f = 1:m
        A(r(f),c(f)) = v(f); % restores A into full matrix
    end
    
    for i = 1:N
        
        initGuess = A*initGuess; 
        flopcount = flopcount + 1;
        initGuessNorm = norm(initGuess);
        initGuess = initGuess/initGuessNorm; % normalizes the guess
        flopcount = flopcount + 1;
        
    end
    
    transInitGuess = initGuess';
    lambda = (transInitGuess*(A*initGuess))/(transInitGuess*initGuess);
    flopcount = flopcount + 4;
    
end

% Extension: make a function that takes full matrix A, not just sparse
