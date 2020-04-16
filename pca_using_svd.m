xC = [2; 1;];
sig = [2; .5;];

theta = pi/3;
R =[cos(theta) -sin(theta); sin(theta) cos(theta)];

nPoints =1000;
X = R*diag(sig)*randn(2,nPoints)+diag(xC)*ones(2,nPoints);

subplot(1,2,1)
scatter(X(1,:),X(2,:),'k.','LineWidth',2)
hold on, box on,grid on
axis([-6 8 -6 8])

Xavg = mean(X,2)
B = X-Xavg*ones(1,nPoints);
[U,S,V] = svd(B/sqrt(nPoints),'econ');

subplot(1,2,2)
scatter(X(1,:),X(2,:),'k.','LineWidth',2)
hold on, box on,grid on
axis([-6 8 -6 8])

theta = (0:0.1:1)*2*pi;
[Xstd] = U*S*[cos(theta); sin(theta)];
plot(Xavg(1)+Xstd(1,:),Xavg(2)+Xstd(2,:),'r-','LineWidth',1.5)
plot(Xavg(1)+2*Xstd(1,:),Xavg(2)+2*Xstd(2,:),'r-','LineWidth',1.5)
plot(Xavg(1)+3*Xstd(1,:),Xavg(2)+3*Xstd(2,:),'r-','LineWidth',1.5)