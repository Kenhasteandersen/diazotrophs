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

ixx = jP<=r;
plot(z, r, 'k-','linewidth',3)
hold on
plot(z(ixx), jP(ixx), 'k:','linewidth',3)
plot(z, jL+p.aR0, 'color',[0.4,0,0],'linewidth',3)
plot(z, jFe, 'm-','linewidth',2)



ix = r>0;
fillbetweenplot(z, jL, 0*z, 0.8*[1 1 1]);
hold on
fillbetweenplot(z(ix), 0*jP(ix), min(jP(ix),r(ix)), [0,0,0.5]);
set(gca,'xscale','log')
fillbetweenplot(z, min(r,jP), min(jP+jPh,r), [0,0,1]);

ix = jP<=r;
semilogy(z(ix), jP(ix), 'k:','linewidth',3)

fillbetweenplot(z, jL+p.aR0, min(jL,jL-jRtot+p.aR0), [0.75,0,0]);
fillbetweenplot(z, min(jL,jL-jRtot+p.aR0), jL-jRtot+p.aR0-jO2, [1,0,0]);

semilogx(z, r, 'k-','linewidth',5)
semilogx(z, jL+p.aR0, 'color',[0.4,0,0],'linewidth',3)
semilogx(z, jFe, 'm-','linewidth',2)

%semilogx(z, rNoPh, 'w:','linewidth',3)

plot([1 1],[-0.1, 1],'k--')
plot(0.4*[1 1],[-0.1, 1],'k--')

%
% Add points:
%
col = [0.6 0 0.6];
plot(1, calcR(funcParam(1, true),L,P,Fe)+p.mort, ...
    'o','markeredgecolor','w','markerfacecolor',col,'markersize',10)
plot(1, calcR(funcParam(1, false),L,P,Fe)+p.mort, ...
    'o','markeredgecolor','w','markerfacecolor','k','markersize',8)

col = [0 1 0];
plot(0.4, calcR(funcParam(0.4, false),L,P,Fe)+p.mort, ...
    'o','markeredgecolor','w','markerfacecolor',col,'markersize',10)



xlabel('Size relative to{\it Trichodesmium}')
ylabel('Division rate{\it \mu} (day^{-1})')
title(sprintf('P=%1.3f  Fe=%1.3f  L=%3.0f',[P,Fe,L]))
ylim([0, 1.05])
set(gca,'xticklabel',[0.1, 1, 10]);

%legend({'Surplus carbon', 'Phosphate', 'Phosphonate',...
    %'W/o phosphonates','Respiration','O_2 removal',...
    %'Growth rate','Photoharvesting','Iron uptake'},'box','off')
    
legend({'{\it \mu} w/phosphonates', ...
    '{\it \mu} wo/phosphonates', ...
    'Photoharvesting', ...
    'Iron uptake'},'box','off')
