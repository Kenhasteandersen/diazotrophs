function panelSizeRates(L,P,Fe, funcParam)
if nargin==3
    funcParam = @parameters;
end
    

z = logspace(-1,1,50);
for i = 1:length(z)
    p = funcParam(z(i), true);
    r(i) = calcR(p,L,P,Fe) + p.mort; % Get rid of the mortality

    pNoPh = funcParam(z(i), false);
    rNoPh(i) = calcR(pNoPh,L,P,Fe) + p.mort;
    
    jL(i) = p.aMax*(1-exp(-p.aL*L/(p.aMax)))-p.aR0;
    jFe(i) = p.aFe*Fe;
    jP(i) = p.aP*P;

    jPh(i) = r(i) - p.aP*P;

    jRtot(i) = p.aR0 + p.betaD*r(i) + p.betaP*p.aP*P + (p.betaPh+p.betaP)*jPh(i);
    jO2(i) = max(0, p.aO2 - jRtot(i));
end

hold off
ix = r>0;
fillbetweenplot(z(ix), 0*jP(ix), min(jP(ix),r(ix)), [0,0,0.5]);
set(gca,'xscale','log')
hold on
fillbetweenplot(z, min(r,jP), min(jP+jPh,r), [0,0,1])

ix = jP<=r;
semilogy(z(ix), jP(ix), 'k--','linewidth',5)

fillbetweenplot(z, jL, min(jL,jL-jRtot+p.aR0), [0.5,0,0]);
fillbetweenplot(z, min(jL,jL-jRtot+p.aR0), jL-jRtot+p.aR0-jO2, [1,0,0]);

semilogx(z, r, 'k-','linewidth',5)
semilogx(z, jL, 'g-','linewidth',3)
semilogx(z, jFe, 'm-','linewidth',2)

semilogx(z, rNoPh, 'y:','linewidth',3)

plot([1 1],[-0.1, 1],'k--')
plot(0.4*[1 1],[-0.1, 1],'k--')
hold off

xlabel('Size ratio z')
ylabel('Growth rate r (day^{-1})')
title(sprintf('P=%1.3f  Fe=%1.3f  L=%3.0f',[P,Fe,L]))
ylim([0, 1])

legend({'Phosphate uptake', 'Phosphonate breakdown',...
    'Growth w/o phosphonates','Needed respiration','O2 removal',...
    'Growth rate','Photoharvesting','Iron uptake'},'box','off')