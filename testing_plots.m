%% Custom matlab scripts to understand hold on -hold off %%
p=rand(1,5);
for i = 1:5
    [distance,timer] = testplot(i,p);
    fcors = figure (1)
    stem(timer,distance);
    hold on
    f2= figure (2)
    bar(timer,distance);
    hold on

end
hold off
outsideFileName = 'outsideFigure.jpg';
outsideheatmapFileName = 'outsideFigureheatmap.jpg';
saveas(fcors,outsideFileName);
saveas(f2,outsideheatmapFileName);