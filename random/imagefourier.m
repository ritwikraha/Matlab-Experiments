rgb = imread('barkha.jpg');
I = rgb2gray(rgb);
ift = real(fft(I));
figure
imshow(ift)
