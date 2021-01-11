function zOpt = plotZoptVsL(bPhosphonate,P,Fe)
n = 10;

L = linspace(0.1,500,n);

for i = 1:length(L)
    zOpt(i)   = calcZopt(bPhosphonate,L(i), P, Fe);
end

semilogy(L, zOpt)
hold on
semilogy(L, L./L, 'k:')
hold off

xlabel('L')
ylabel('zOpt')
