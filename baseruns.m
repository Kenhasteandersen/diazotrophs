function baseruns(funcParam)
if nargin==0
    funcParam = @parameters;
end

% My guessstimate parameters:
P = 0.3;
Fe = 0.05;
L = 100;
%funcParam = @parameters;
%pTri = funcParam(1,true);
%pUCYN = funcParam(0.2, false); 

% Dutkiewicz parameters:
P = 0.03;
Fe = 0.005;
L = 100;

pTri = funcParam(1,true);
pUCYN = funcParam(0.4, false); 
paramTriBad = pTri;
paramTriBad.bPhosphonate = false;

figure(1)
clf
subplot(1,2,1)
plotRvsL(pTri, pUCYN, P, .02)
title(sprintf('P = %1.2f, Fe = %1.3f',[P,0.02]))
%defaultAxes(8);
subplot(1,2,2)
plotRvsL(pTri, pUCYN, P, Fe)
title(sprintf('P = %1.2f, Fe = %1.3f',[P,Fe]))
defaultAxes(16);


figure(2)
clf
%subplot(1,3,1)
%plotDominatType(pTri, pUCYN, 20);
%title('L = 20')

subplot(1,3,1)
plotDominatType(pTri, pUCYN, 35);
title('L = 35')
plotlabel(' a', false)
defaultAxes()
%ylabel('')
%set(gca,'yticklabel','')

subplot(1,3,2)
plotDominatType(pTri, pUCYN, 100);
title('L = 100')
ylabel('')
set(gca,'yticklabel','')
text(0.1, 2, 'UCYN-A')
text(0.075, 0.5, 'Trichodesmium')
plotlabel('b', false)
defaultAxes()

subplot(1,3,3)
plotDominatType(paramTriBad, pUCYN, 100);
title('L = 100; no phosphonate')
ylabel('')
set(gca,'yticklabel','')
plotlabel('c', false)
defaultAxes()

defaultAxesHorizontal(16)

%colorbar


figure(3)
clf
subplot(1,2,1)
plotRvsZ(L, P, .02, funcParam)
subplot(1,2,2)
plotRvsZ(L, P, Fe, funcParam)
defaultAxes(16);


figure(4)
plotSizeRates
%%
figure(5)
plotZoptVsL(false,0.03,0.02)
hold on
plotZoptVsL(false,0.066,0.02)
hold on
plotZoptVsL(false,0.08,0.02)

