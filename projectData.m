function Z = projectData(X, U, K)
% computes the projection of the normalized inputs X into the reduced dimensional space spanned by
% the first K columns of U. It returns the projected examples in Z.
fprintf('Projecting data... \n')
Z = zeros(size(X, 1), K);
n = size(X, 1);
for i=1:n
    for j=1:K
        x = X(i, :)';
        projection_k = x' * U(:, j);
        Z(i, j) = projection_k;
    end
end
% =========================================
fprintf('Done. \n')
end
