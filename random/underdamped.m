% a plotted study of the set of data points
% for level measurement
y=[24.3 23.9 24.3 25.0 24.5 23.7 23.9 24.6 24.8 25.5 25.9 26.2 26.3 26.8 25.9 25.2 24.7 24.2 23.7 23.8 23.7 23.8 23.6 23.8 24.7 25.2 26.0 26.1 26.6 26.8 26.7 26.3 25.4 24.7 24.1 23.7];
%manually entering the values from t=120 to t=480
%finding the set of true maxima
[Maxima,MaxIdx] = findpeaks(y);
truemaxima=y(MaxIdx)
%truemaxima =

%   25.0000   26.8000   23.8000   23.8000   26.8000

%calculating the shape of the matrix and feeding it into the linspace function 
d=size(y);

x= linspace(120,480,d(2));
stem(x,y)

plot(x,y)
