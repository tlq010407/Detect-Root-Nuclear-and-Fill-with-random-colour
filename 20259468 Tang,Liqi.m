%% load the image
clc
image = imread("StackNinja3.bmp");

%% convert the RGB color space to YCBCR color space
% covert RGB to YCbCr
YCBCR = rgb2ycbcr(image);
% extract Cr layer image 
crImage = YCBCR(:, :, 3);
% convert the YCBCR image to binary image
bw = im2bw(crImage);

%% histogram equalization
% convert Cr layer image to greyscale image
greyCr = im2gray(crImage);
% histogram equalization
his = histeq(greyCr);
% get the threshold
level = graythresh(greyCr);
% convert to binary image with threshold to select the neclear
BW = imbinarize(his,level);
% get the final binary image
Final = BW+bw;
% convert the binary image to greyscale image
greyCr = im2gray(Final);

%% smooth edge  ---- superpixels
% Set number of superpixels
num_sp = 1000;
% Set compactness factor
compactness = 10;
% Initialize superpixel segmentation object
slic_obj = superpixels(greyCr, num_sp, 'Compactness', compactness);

%% Wiener filter ------ noise reduction
% set the neighbourhood size
[m,n] = size(greyCr);
% apply wiener filter
Wiener_img_filtered = wiener2(greyCr, [3 3]);

%% Gaussian filtering
Gaussian_img_filtered = imgaussfilt(Wiener_img_filtered, 1.0);
% convert greyscale image to binary image
GaussiaBIN = im2bw(Gaussian_img_filtered);

%% random generated color
% convert binary image
convert = 1- GaussiaBIN;
% Identify connected components
cc = bwconncomp(convert);
num_regions = cc.NumObjects;
% Generate random colors
colors = rand(num_regions, 3); % generates a matrix of random RGB colors
% Assign colors to each component
colored_img = label2rgb(labelmatrix(cc), colors, [0 0 0], 'shuffle');

%% plot the image
subplot(1,3,1)
% original image
imshow(image);
title("orginal");
subplot(1,3,2);
% binary image
imshow(convert);
title("binary image");
subplot(1,3,3)
% random color filled image
imshow(colored_img);
title('Colored Image');



