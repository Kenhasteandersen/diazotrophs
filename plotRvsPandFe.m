function plotRvsPandFe(p, L)
n = 10;

P = linspace(0,1,n);
Fe = linspace(0,0.5,n);

r = zeros(n,n);
for i = 1:length(P)
    r(i,:) = calcR(p,L,P(i),Fe);
end

surface(Fe,P,r);
xlabel('Fe')
ylabel('P')
zlabel('r')
shading flat

