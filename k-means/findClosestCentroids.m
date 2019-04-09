function [idx, d] = findClosestCentroids(X, centroids)
% Set K == number of centroids
K = size(centroids, 1);
% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);
m = size(X, 1);
for i = 1 : m
   dist = zeros(1,K);
   for j = 1 : K
       dist(1,j) = sqrt(sum(power( (X(i,:) - centroids(j,:)), 2)));
   end
   [d, d_idx] = min(dist);
   idx(i,1) = d_idx;
end
% =============================================================
end

