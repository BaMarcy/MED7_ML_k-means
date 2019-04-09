function [centroids, idx, d] = kMeans(X, initial_centroids, ...
                                      max_iters, plot_progress)

% Set default value for plot progress
if ~exist('plot_progress', 'var') || isempty(plot_progress)
    plot_progress = false;
end

% Plot the data if we are plotting progress
if plot_progress
    figure;
    hold on;
end

% Initialize values
[m n] = size(X);
K = size(initial_centroids, 1);
centroids = initial_centroids;
previous_centroids = centroids;
idx = zeros(m, 1);

% Run K-Means
for j=1:max_iters
    
    % Output progress
    fprintf('K-Means iteration %d/%d...\n', j, max_iters);
    
    % For each example in X, assign it to the closest centroid
    [idx, d] = findClosestCentroids(X, centroids);
    
    % Optionally, plot progress here
    if plot_progress
        plotProgresskMeans(X, centroids, previous_centroids, idx, K, j);
        previous_centroids = centroids;
        fprintf('Press enter to continue.\n');
        pause;
    end
    
    % Given the memberships, compute new centroids
    for ii = 1:K
        c_i = idx==ii;
        n_i = sum(c_i);
        c_i_matrix = repmat(c_i,1,n);
        X_c_i = X .* c_i_matrix;
        centroids(ii,:) = sum(X_c_i) ./ n_i;
    end

end

% Hold off if we are plotting progress
if plot_progress
    hold off;
end

end

