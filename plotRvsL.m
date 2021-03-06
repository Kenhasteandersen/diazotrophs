function plotRvsL(pTri, pUCYN, P, Fe)

L = linspace(0,300);

rTri = calcR(pTri, L, P, Fe);
rUCYN = calcR(pUCYN, L, P, Fe);
pTri.bPhosphonate=false
rTriBad = calcR(pTri, L, P, Fe);

fillbetweenplot(L, 0*L-0.5, 0*L,0.65*[1 1 1]);
hold on
plot(L, rTri, 'm-', 'linewidth', 3)
hold on
plot(L, rTriBad, 'm--', 'linewidth', 3)
plot(L, rUCYN, 'g-', 'linewidth', 3)



plot(L, 0*L, 'k:')
hold off

xlabel('Light ({\mu}E/m^2/day)')
ylabel('Growth rate r (day^{-1})')
ylim([-0.1, 0.5])

%legend({'Tri; large with phosphonate breakdown', 'Tri; large w/o phosphonate breakdown','UCYN-A: small w/o phosphonate'},'box','off')