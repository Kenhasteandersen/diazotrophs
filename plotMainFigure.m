pTri = parameters(1,true);
pUCYN = parameters(0.4, false); 

P = 0.3;
Fe = 0.01;
convFe = 1/55*1000;
convP = 1/31*1000;

clf
subplot(1,3,[1 2])
panelSizeRates(150, P, Fe, @parameters)
title('')
defaultAxes()

subplot(1,3,3)
plotDominatType(pTri, pUCYN, 150);
hold on
plot(Fe*convFe, P*convP, 'k*')
hold off
%ylabel('')
%set(gca,'yticklabel','')
text(0.2, 20, 'UCYN-A')
text(0.15, 7.5, 'Trichodesmium')
plotlabel('b', false)
defaultAxes()
