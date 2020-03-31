function [distance,timer] = testplot(j,p)
r1 = rand(100,1);
r2 = rand(100,1);
for i=1:5
    hold off
    timer(i) =i;
    %[c,lags] = xcorr(r1,r2);
    %fig = plot(lags,c);
    fig = errorbar(r1,r2)
    distance(i)=psnr(r1,r2);
    figFileName = strcat('insidefigure_',num2str(j),'_',num2str(i),'.jpg');
    saveas(fig,figFileName);
end

