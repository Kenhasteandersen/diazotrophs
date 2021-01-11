close all

P = 0.3;
Fe = 0.05;
L = 100;

figure(1)
clf
plotRvsL(paramTri(), paramUCYN(), P, Fe)
title(sprintf('P = %1.2f; Fe = %1.3f',[P,Fe]))

figure(2)
subplot(1,4,1)
plotDominatType(paramTri(), paramUCYN(), 20);
title('L = 20')
subplot(1,4,2)
plotDominatType(paramTri(), paramUCYN(), 50);
title('L = 50')
subplot(1,4,3)
plotDominatType(paramTri(), paramUCYN(), 100);
title('L = 100')
subplot(1,4,4)
paramTriBad = paramTri();
paramTriBad.bPhosphonate = false;
plotDominatType(paramTriBad(), paramUCYN(), 100);
title('L = 100; no phosphonate')


figure(3)
clf
plotRvsZ(L, P, Fe)
