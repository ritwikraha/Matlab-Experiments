img = imread('barkha.jpg');
img = rgb2gray(img);

xaxis = linspace(0,255,50);

% y = linspace(x1,x2,n) generates n points. The spacing between the points is (x2-x1)/(n-1).
% linspace is similar to the colon operator, “:”, 
% but gives direct control over the number of points and always includes the endpoints. 
% “lin” in the name “linspace” refers to generating linearly spaced values 
% as opposed to the sibling function logspace, which generates logarithmically spaced values.

yaxis = imhist(img,50);
%[counts,binLocations] = imhist(I,n) specifies the number of bins, n, used to calculate the histogram.

%imwrite(img,'map_bw.png');

stem(xaxis,yaxis);
% stem(X,Y) plots the data sequence, Y, at values specified by X.
% The X and Y inputs must be vectors or matrices of the same size.
% Additionally, X can be a row or column vector and Y must be a matrix with length(X) rows.
% 
% If X and Y are both vectors, then stem plots entries in Y against corresponding entries in X.
% 
% If X is a vector and Y is a matrix, then stem plots each column of Y against the set of values specified by X,
% such that all elements in a row of Y are plotted against the same value.
% 
% If X and Y are both matrices, then stem plots columns of Y against corresponding columns of X.
title('grayscale');