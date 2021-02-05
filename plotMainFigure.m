function plotMainFigure(L, nRows, nRow)
if (nargin==0)
    L = 150;
    nRows = 1;
    nRow = 1;
end

pTri = parameters(1,true);
pUCYN = parameters(0.4, false); 

P = 0.3;
Fe = 0.015;
convFe = 1/55*1000;
convP = 1/31*1000;


subplot(nRows,3,[1 2]+3*(nRow-1))
panelSizeRates(L, P, Fe, @parameters)
title('')
%plotlabel('a',false)
defaultAxes(20)

ax = gca;
pos = ax.InnerPosition;
pos(2) = 0.17;
ax.InnerPosition = pos;

text(0.11, 0.5, 'O_2 removal','color','w')
text(0.25, 0.06, 'Phosphate', 'color','w')
text(0.4,  0.25, ' Phosphonate', 'color','w')
text(0.25, 0.65, 'Respiration','color','w')
text(1.6, 0.15, 'Surplus C','color','w')

subplot(nRows,3,3*nRow)
plotDominatType(pTri, pUCYN, L);
hold on
plot(Fe*convFe, P*convP, 'kp','markersize',8,'markerfacecolor','k')
hold off
%ylabel('')
%set(gca,'yticklabel','')
text(0.2, 25, 'UCYN-A')
text(0.13, 5.5, '\it Trichodesmium')
%plotlabel('  b', false)
defaultAxes()

ax = gca;
pos = ax.InnerPosition;
pos(2) = 0.17;
ax.InnerPosition = pos;

setFigWidth(20)
setFigHeight(6)
