function rDiff = plotDominatType(pTri, pUCYN, L)
n = 30;
Pmax = 0.1;
Femax = 0.01;

P = linspace(0,Pmax,n);
Fe = linspace(0,Femax,n);

rTri = zeros(n,n);
rUCYN = zeros(n,n);
for i = 1:length(P)
    for j = 1:length(Fe)
        rTri(i,j) = calcR(pTri,L,P(i),Fe(j));
        rUCYN(i,j) = calcR(pUCYN,L,P(i),Fe(j));
    end
    
end

rDiff = rTri-rUCYN;
rDiff(rDiff < -0.2) = -0.19;
rDiff((rTri<0) & (rUCYN<0)) = -1;

surface(Fe, P, rDiff)

map = min(50,(1:100)');
map(:,2) = min(50, 100-(1:100)');
map(:,3) = 50;
map(1,:) = [0 0 0];
map=map/50;
colormap(map)
caxis([-0.2 0.2]);

hold on
contour(Fe,P,rDiff, [0 0],'k-','linewidth',3)

shading interp

xlabel('Fe')
ylabel('P')


