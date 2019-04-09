function im = extract_keyframes(centroids, Z, path, format)

fprintf('Keyframe Extraction...\n');
format = strcat('*.', format);
files = dir(fullfile(path, format));

for i=1:size(centroids)
    for j=1:size(Z)
       dif = centroids(i,:) - Z(j,:);
       dis(j,i) = sqrt(sumsqr(dif(1,:)));
    end
    [~, key] = min(dis(:,i));
    im = imread(fullfile(path ,files(key).name));
    title = strcat('Extracted Keyframe of Cluster_', num2str(i));
    figure('Name', title,'NumberTitle','off');
    imshow(im);
end
fprintf('Done.\n');
end

