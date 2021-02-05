function plotRvsP(pTri, pUCYN, L, Fe)

P = linspace(0,1);
pTriBad = pTri;
pTriBad.bPhosphonate = false;

for i = 1:length(P)
    rTri(i) = calcR(pTri, L, P(i), Fe);
    rUCYN(i) = calcR(pUCYN, L, P(i), Fe);
    rTriBad(i) = calcR(pTriBad, L, P(i), Fe);
end


fillbetweenplot(P,0*P-0.5,0*P,0.4*[1 1 1])
hold on
plot(P, rTri, 'm-', 'linewidth', 3)
hold on
plot(P, rTriBad, 'm--', 'linewidth', 3)
plot(P, rUCYN, 'g-', 'linewidth', 3)

plot(P, 0*P, 'k:')
hold off

xlabel('P')
ylabel('Growth rate r (day^{-1})')
ylim([-0.1, 0.5])

legend({'Tri; large with phosphonate breakdown', 'UCYN-A: small without phosphonate breakdown'},'box','off')