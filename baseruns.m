
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
funcParam = @parametersDutkiewicz;
pTri = funcParam(1,true);
pUCYN = funcParam(0.4, false); 


figure(1)
clf
plotRvsL(pTri, pUCYN, P, Fe)
title(sprintf('P = %1.2f; Fe = %1.3f',[P,Fe]))

figure(2)
clf
subplot(1,4,1)
plotDominatType(pTri, pUCYN, 20);
title('L = 20')
subplot(1,4,2)
plotDominatType(pTri, pUCYN, 50);
title('L = 50')
subplot(1,4,3)
plotDominatType(pTri, pUCYN, 100);
title('L = 100')
subplot(1,4,4)
paramTriBad = pTri;
paramTriBad.bPhosphonate = false;
plotDominatType(paramTriBad, pUCYN, 100);
title('L = 100; no phosphonate')


figure(3)
clf
plotRvsZ(L, P, Fe, funcParam)
