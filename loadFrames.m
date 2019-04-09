function [output] = loadFrames(path, reSize, format)
% path => frames location / dir
% reSize => an intiger in a range of 0 - 1 that determines a percentage to
% reduce image/frame size
% output => double MxN matrix contains pixel values of frames, M -> number
% of frames, N -> number of pixels
% =====================
fprintf('Load frames... \n')
files = dir(fullfile(path, strcat('*.', format)));
m = length(files);
images = [];
for k = 1 : m
  % load images and convert them into grayscale
  im = double(rgb2gray(imread(fullfile(path ,files(k).name))));
  % resize images
  im = imresize(im, reSize);
  % divide by 255 so that all values are in the range 0 - 1
  im = im/255;
  im_size = size(im);
  % Reshape the image into an 1xN matrix where N = number of pixels.
  % Each row will contain all pixel values of an image ---> #ROW ==
  % #images.
  % Each pixel value(colums) will be a feature of an image ---> #COLUM ==
  % #features.
  im = reshape(im, 1, im_size(1) * im_size(2));
  images(k,:) = im;
end
fprintf('Done. \n')
% =====================
output = images;
% =====================
end

