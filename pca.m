function [U, S, X_norm] = pca(X)
% =========================== Mean-Normalization =========================
fprintf('Mean normalization... \n')
mu = mean(X);
X_norm = bsxfun(@minus, X, mu);
sigma = std(X_norm);
X_norm = bsxfun(@rdivide, X_norm, sigma);
fprintf('Done. \n')

% =========================== Principal Component Analysis ===============
fprintf('Covariance... \n')
%Sigma = (1/m) * (X_norm' * X_norm);
Sigma = cov(X_norm); 
fprintf('Done. \n')

fprintf('Eigenvectors and eigenvalues... \n')
% singular value decomposition 
[U,S,~] = svd(Sigma);
fprintf('Done. \n')
% ===========================
end

