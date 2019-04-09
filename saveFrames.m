function [output] = saveFrames(inPath, format, outPath, name, idx, k)
output = k;    
files = dir(strcat(inPath,'/*.', format));
m = length(files);
writerObj = VideoWriter(fullfile(outPath, name));
open(writerObj);
for i = 1 : m
    frame = imread(fullfile(inPath,files(i).name));
    if idx(i,1) == k
    writeVideo(writerObj, frame);
    end
end
close(writerObj);
% =========================================
fprintf('%d Done. \n', k)
end

