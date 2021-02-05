figure(1)
clf
plotMainFigure(150,1,1);
print -dpdf 'mainfig.pdf'

%%
%figure(2)
%clf
%plotMainFigure(50,3,1);
%print -dpdf 'S1a.pdf'
%plotMainFigure(120,3,2);
%print -dpdf 'S1b.pdf'
%plotMainFigure(300,3,3);
%print -dpdf 'S1c.pdf'

%%
figure(2)
clf

subplot(1,3,1)
plotRvsPandFeSurface(pTri,pUCYN,75);
zlim([0 0.4])

subplot(1,3,2)
plotRvsPandFeSurface(pTri,pUCYN,150);
zlim([0 0.4])
ylabel('')
zlabel('')

subplot(1,3,3)
plotRvsPandFeSurface(pTri,pUCYN,300);
zlim([0 0.4])
ylabel('')
zlabel('')

setFigWidth(20)
setFigHeight(8)

print -dpdf 'S1.pdf'

%%
figure(3)
clf

[zOpt, h1] = plotZoptVsL(false,P, Fe);
hold on
[zOpt, h2] = plotZoptVsL(false,0.2*P, Fe);
hold on
[zOpt, h3] = plotZoptVsL(false,2*P, Fe);

xlim([0 300])
legend([h1,h2,h3],{'P = 2 nM', 'P = 9 nM','P = 20 nM'},'box','off')
defaultAxes(16)

print -dpdf 'S2.pdf'

