function [K] = optimal_PCs(S, alpha)
% finding the optimal number of principle components (K)
% if alpha is 0.05, then 95% of the varience is retained
% =====================
fprintf('Finding the optimal number of principle components (K)... \n')
K = 1;
var_retained = 1;
[~, n] = size(S);
% while alpha is less than K --> K = K + 1
while var_retained > alpha
    K = K + 1;
    % ====================
    % the fist X eignevalues
    s1 = [];
    for i = 1 : K
        s1(i,:) = S(i,i);
    end
    s1 = sum(s1);
    % ====================
    % all the eigenvalues
    s2 = [];
    for i = 1 : n
        s2(i,:) = S(i,i);
    end
    s2 = sum(s2);
    % ====================
    % the sum of fist 'X' eignevalues devided by 
    % the sum of all the eigenvalues
    var_retained = 1 - (s1 / s2);
end
% =====================
fprintf('K: %d\n', K)

end
