%% importing the image
% moon.tif is already pre-loaded in MATLAB
I =imread('moon.tif');
%% type in help imnoise to find information regarding the function
J = imnoise(I,'gaussian')
J2 = imnoise(I,'salt & pepper')
J3 = imnoise(I,'poisson')
%% displaying the images

net = denoisingNetwork('DnCNN');
analyzeNetwork(net)
I2=imread('Moon_from_redmi.jpg');
if size(I2,3) ~= 1
I2 = rgb2gray(I2);
else
I2=I2;    
end
I2 = imnoise(I2,'gaussian')
denoisedI = wiener2(I2,[5 5]);
montage({I2,denoisedI})
title('Original Image (Left) and Denoised Image (Right)')