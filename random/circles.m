rgb=imread('coloredchips.png');
gray_image = rgb2gray(rgb);
%imshow(gray_image)
[centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark','Sensitivity',0.93,'Method','twostage');
imshow(rgb);
h = viscircles(centers,radii);