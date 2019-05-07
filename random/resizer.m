I = imread('yourself.png');
% I have used 0.33 you can use any algo to determine scaling factor
% also used nearest interpolation since by mathematics the bicubic
% interpolation is bound to sometimes give values that occur outside the
% range, set dither to false always for illustrations
J = imresize(I, 0.33,'nearest','Antialiasing',true);
figure
imshow(I)
title('Original Image')
figure
imshow(J)
title('Resized Image')
% WARNING: for values not in logarithmic scale of resizing, output on matlab
% terminal won't look much different
imwrite(J,'yourself_r.png')
