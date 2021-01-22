function zOpt = plotZoptVsL(bPhosphonate,P,Fe)
n = 100;

L = linspace(0.1,500,n);

for i = 1:length(L)
    zOpt(i)   = calcZopt(bPhosphonate,L(i), P, Fe);
    r(i) = calcR(parameters(zOpt(i), bPhosphonate), L(i), P, Fe);
end

semilogy(L, zOpt, 'linewidth',3)
hold on
ix = r<0;
semilogy(L(ix), zOpt(ix), 'w-','linewidth',3)

semilogy(L, L./L, 'k:')
semilogy(L, 0.4*L./L, 'k:')
hold off

xlabel('L (\mu)')
ylabel('Redius relative to Trichodesmium')


ylim([0.2 1.1])
