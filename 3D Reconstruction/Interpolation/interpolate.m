function interpolate(inputDir, outputDir, new_depth, method)
% Interpolation between images 
%   inputDir: input image directory  
%   outputDir: output image directory
%   new_depth: new depth for 3-D volumetric intensity image
%   method: method for interpolating, choices are 'nearest', 'linear',
%                   'cubic', 'box', 'lanczos2', 'lanczos3'
imgDir  = dir([inputDir '*.png']); % ����Ŀ¼������png��ʽ�ļ�
old_depth = length(imgDir);
img0 = imread([inputDir imgDir(1).name]);
num_rows = size(img0, 1);
num_cols = size(img0, 2);
images = zeros(num_rows, num_cols, old_depth);
for i = 1:length(imgDir)          
    images(:, :, i) =  imread([inputDir imgDir(i).name]); %��ȡÿ��ͼƬ
end
new_images = imresize3(images, [num_rows, num_cols, new_depth], method);
for idx = 1:size(new_images, 3)
    image = new_images(:, :, idx);
    imwrite(uint8(image), [outputDir num2str(idx), '.png']);
end
end

