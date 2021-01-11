function plotRvsFe(pTri, pUCYN, L, P)

Fe = linspace(0,0.5);

rTri = calcR(pTri, L, P, Fe);
rUCYN = calcR(pUCYN, L, P, Fe);

plot(Fe, rTri, 'm-', 'linewidth', 3)
hold on
plot(Fe, rUCYN, 'g-', 'linewidth', 3)
plot(Fe, 0*Fe, 'k:')
hold off

xlabel('Fe')
ylabel('Growth rate r (day^{-1})')
ylim([-0.1, 0.5])

legend({'Tri; large with phosphonate breakdown', 'UCYN-A: small without phosphonate breakdown'},'box','off')