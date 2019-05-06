I=imread('barkha.jpg');
imgray= rgb2gray(I);
[rows,cols]=size(imgray);


for i=1:rows
    for j=1:cols
        if imgray(i,j)>100
            imgray(i,j)=255;
        else
            imgray(i,j)=0;
        end;
    end;
end;


figure
imshow(imgray)

