close all; clear; clc;

%% ============= Video Segmentation & Keyframe Extraction ================
format = 'jpg';
path = 'frames';
fprintf('Preprocessing...\n');
% convert video to frames and save as jpg image sequence
[info] = extractFrames('videos', 'input.mp4', path, format);

%% ========================== Load Images ================================
% load rezised images into a MxN matrix
[images] = loadFrames(path, 0.05, format);

%% ==================== Feature Extraction 1 - PCA =======================
fprintf('Dimension reduction... \n')
% Principal Component Analysis
[U, S, X_norm] = pca(images);
% 99% of the varience is retained
[K] = optimal_PCs(S, 0.01);

%% ================ Feature Extraction 2 - Projection ====================
% project the data to K dimensions
Z = projectData(X_norm, U, K);

%% ===================== k-means Clustering ==============================
fprintf('Elbow method...\n');
J = [];
n = size(Z);
for i = 1 : n
    % Initialize the centroids to be random examples
    % Randomly reorder the indices of examples
    randidx = randperm(size(Z, 1));
    % Take the first i examples as centroids
    initial_centroids = Z(randidx(1:i), :);
    % =============================================================
    [~, ~, d] = kMeans(Z, initial_centroids, 10);
    J(i,:) = d;
end
figure('Name','Elbow Method','NumberTitle','off');
n = 1:n;
plot(n',J);
hold on;
title('Elbow Method')
xlabel({'k','(number of clusters)'})
ylabel({'J','(cost function)'})
scatter(n',J);
hold off;

%% =====================
fprintf('Clustering...\n');
k = 2;
randidx = randperm(size(Z, 1));
initial_centroids = Z(randidx(1:k), :);
[centroids, idx] = kMeans(Z, initial_centroids, 10, true);

%% ===================== Save Clusters as Video ==========================
for i=1:k
    saveFrames(path, format, 'videos', strcat(num2str(i),'_output.avi'), idx, i);
end

%% ===================== Keyframe Extraction =============================
extract_keyframes(centroids, Z, path, format);
