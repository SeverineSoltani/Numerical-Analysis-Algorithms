function [lambda, flopcount] = PowerMethod(N,r,c,v,n)

    initGuess = ones(n,1);
    
    flopcount = 0;
    m = length(v);
    A = zeros(n,n);

    for f = 1:m
        A(r(f),c(f)) = v(f);
    end
    
    for i = 1:N
        
        initGuess = (A*initGuess); 
        % (A*initGuess) = 32
        flopcount = flopcount + 32;
        initGuessNorm = norm(initGuess);
        initGuess = initGuess/initGuessNorm; 
        flopcount = flopcount + 1;
        
    end
    
    transInitGuess = initGuess';
    lambda = (transInitGuess*(A*initGuess))/(transInitGuess*initGuess);
    flopcount = flopcount + 49;
    
    % (transInitGuess*initGuess) = 8
    % A*initGuess = 32
    % (transInitGuess*(A*initGuess) = 8
    % 32 + 8 + 8 + 1 = 49
end