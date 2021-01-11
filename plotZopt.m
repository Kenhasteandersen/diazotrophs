function zOpt = plotZopt(bPhosphonate,L)
n = 10;

P = linspace(0,.1,n);
Fe = linspace(0,0.01,n);

zOpt = zeros(n,n);
for i = 1:length(P)
    for j = 1:length(Fe)
        zOpt(i,j) = calcZopt(bPhosphonate,L,P(i),Fe(j));
    end
end

surface(P,Fe,zOpt);
xlabel('P')
ylabel('Fe')
zlabel('zOpt')
shading flat
