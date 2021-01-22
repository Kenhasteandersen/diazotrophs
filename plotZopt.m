function zOpt = plotZopt(bPhosphonate,Fe)
n = 10;

P = linspace(0,.1,n);
L = linspace(0,150,n);

zOpt = zeros(n,n);
for i = 1:length(P)
    for j = 1:length(L)
        zOpt(i,j) = calcZopt(bPhosphonate,L(j),P(i),Fe);
    end
end

clf
surface(P,L,log10(zOpt));
xlabel('P')
ylabel('L')
zlabel('zOpt')
shading flat

colorbar
