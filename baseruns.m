function baseruns(funcParam)
if nargin==0
    funcParam = @parametersDutkiewicz;
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
subplot(1,4,1)
plotDominatType(pTri, pUCYN, 20);
title('L = 20')

subplot(1,4,2)
plotDominatType(pTri, pUCYN, 50);
title('L = 50')
ylabel('')
set(gca,'yticklabel','')

subplot(1,4,3)
plotDominatType(pTri, pUCYN, 100);
title('L = 100')
ylabel('')
set(gca,'yticklabel','')

subplot(1,4,4)
plotDominatType(paramTriBad, pUCYN, 100);
title('L = 100; no phosphonate')
ylabel('')
set(gca,'yticklabel','')

colorbar


figure(3)
clf
subplot(1,2,1)
plotRvsZ(L, P, .02, funcParam)
subplot(1,2,2)
plotRvsZ(L, P, Fe, funcParam)
defaultAxes(16);
