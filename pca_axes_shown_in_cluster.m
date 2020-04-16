% Code to plot a 3-D cluster of data, then find the principal components axes.
clc;    % Clear the command window.
clearvars;
close all;  % Close all figures (except those of imtool.)
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;
fontSize = 22;

% Read data.
data = xlsread('pca cluster data.xlsx')
% Plot data.
subplot(1, 2, 1);
x = data(:, 1);
y = data(:, 2);
z = data(:, 3);
plot3(x, y, z, 'b.', 'MarkerSize', 8);
grid on;
title('Original Data', 'FontSize', 20);
xlabel('x', 'FontSize', 20);
ylabel('y', 'FontSize', 20);
zlabel('z', 'FontSize', 20);
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 1, 0.96]);

% Get the PC coefficients.
coeffs = pca(data(:, 1:3))
pcs = data(:, 1:3) * coeffs
% Get the data transformed into PC space.
pc1 = pcs(:, 1);
pc2 = pcs(:, 2);
pc3 = pcs(:, 3);
subplot(1, 2, 2);
plot3(pc1, pc2, pc3, 'r.', 'MarkerSize', 8);
grid on;
title('Transformed Data', 'FontSize', 20);
xlabel('PC #1', 'FontSize', 20);
ylabel('PC #2', 'FontSize', 20);
zlabel('PC #3', 'FontSize', 20);

% Get the max and min of each PC
pc1Min = min(pc1)
pc2Min = min(pc2)
pc3Min = min(pc3)
pc1Max = max(pc1)
pc2Max = max(pc2)
pc3Max = max(pc3)
pc1Mean = mean(pc1)
pc2Mean = mean(pc2)
pc3Mean = mean(pc3)
xMean = mean(x)
yMean = mean(y)
zMean = mean(z)

% Since pcs = xyz * coeffs, to go the other way
% xyz = pcs / coeffs
pc1Limits = [pc1Min - pc1Mean, 0, 0; pc1Max - pc1Mean, 0, 0]
pc2Limits = [0, pc2Min - pc2Mean, 0; 0, pc2Max - pc2Mean, 0]
pc3Limits = [0, 0, pc3Min - pc3Mean; 0, 0, pc3Max - pc3Mean]
xyz1Limit = pc1Limits / coeffs
xyz2Limit = pc2Limits / coeffs
xyz3Limit = pc3Limits / coeffs
% Switch back to subplot 1.
subplot(1, 2, 1);
% Plot the lines along the principal axes.
% Need to add the mean of x, y, and z back in to center the axes.
hold on;
plot3(xyz1Limit(:, 1) + xMean, xyz1Limit(:, 2) + yMean, xyz1Limit(:, 3) + zMean, 'k-', 'LineWidth', 4);
plot3(xyz2Limit(:, 1) + xMean, xyz2Limit(:, 2) + yMean, xyz2Limit(:, 3) + zMean, 'k-', 'LineWidth', 4);
plot3(xyz3Limit(:, 1) + xMean, xyz3Limit(:, 2) + yMean, xyz3Limit(:, 3) + zMean, 'k-', 'LineWidth', 4);
