
function [output] = extractFrames(path_in, name, path_out, format)
% Convert video to frames and visualize them in one figure.
output = 'Convert video to frames and visualize them in one figure.';
% ===================== Convert Video to Frames =========================
fprintf('Convert video to frames... \n')
vid = VideoReader(fullfile(path_in, name));
n = vid.NumberOfFrames;
for img = 1:n
    if img < 10
        filename = strcat('00', num2str(img), '.', format);
    elseif (10 <= img) && (img < 100)
        filename = strcat('0', num2str(img), '.', format);
    else
        filename = strcat(num2str(img), '.', format);
    end
    r = read(vid, img);
    %imshow(r);
    imwrite(r, fullfile(path_out, filename));
end
fprintf('Done. \n')
% ===================== Visualize Frames/Images =========================
fprintf('Visualizing frames... \n')
d = dir(fullfile(path_out, strcat('*.', format)));
fileNames = {d.name}';
m = 20;
montage(fullfile(path_out, fileNames),'Size', [m round(n/m)]);
fprintf('Done. \n')
end

