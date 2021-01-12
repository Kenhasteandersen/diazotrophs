function plotRvsL(pTri, pUCYN, P, Fe)

L = linspace(0,300);

rTri = calcR(pTri, L, P, Fe);
rUCYN = calcR(pUCYN, L, P, Fe);

plot(L, rTri, 'm-', 'linewidth', 3)
hold on
plot(L, rUCYN, 'g-', 'linewidth', 3)
plot(L, 0*L, 'k:')
hold off

xlabel('L')
ylabel('Growth rate r (day^{-1})')
ylim([-0.1, 0.5])

legend({'Tri; large with phosphonate breakdown', 'UCYN-A: small without phosphonate breakdown'},'box','off')