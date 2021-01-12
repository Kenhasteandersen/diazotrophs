function plotRvsZ(L,P,Fe, funcParam)
if nargin==3
    funcParam = @parameters;
end
    

z = logspace(-1,1,50);
for i = 1:length(z)
    p = funcParam(z(i), true);
    r(i) = calcR(p,L,P,Fe);
    p.bPhosphonate = false;
    rPonly(i) = calcR(p,L,P,Fe);
end

hold off
semilogx(z, rPonly, 'g-','linewidth',3)
hold on
semilogx(z, r, 'm-','linewidth',2)
semilogx(z, 0*z,'k:')
plot([1 1],[-0.1, 0.5],'k:')
plot(0.2*[1 1],[-0.1, 0.5],'k:')
hold off

xlabel('Size ratio z')
ylabel('Growth rate r (day^{-1})')
ylim([-0.1, 0.5])


legend({'Without phosphonate breakdown', 'With phosphonate breakdown'},'box','off')