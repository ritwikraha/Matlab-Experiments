%to compute the DFT sequence of a plot 
% magnitude and phase response
clear all
xn=[1,1,1];
N=50;
%Length of the DFT
xj=fft(xn,N)
k=0:1:N-1;
subplot(2,1,1),stem(k,abs(xj));
xlabel('k'),ylabel('|x(j)|');
subplot(2,1,1),stem(k,angle(xj));
xlabel('k'),ylabel('arg(x(j))');

