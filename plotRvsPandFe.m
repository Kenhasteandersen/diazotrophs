function plotRvsPandFe(p, L)
n = 10;

P = linspace(0,.1,n);
Fe = linspace(0,0.01,n);

r = zeros(n,n);
for i = 1:length(P)
    r(i,:) = calcR(p,L,P(i),Fe);
end

surface(P,Fe,r);
xlabel('P')
ylabel('Fe')
zlabel('r')
shading flat

