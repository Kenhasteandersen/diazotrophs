function r = calcR(p, L, P, Fe)

JL = @(L) p.aMax*p.m*(1-exp(-p.aL*L/(p.aMax*p.m)))-p.JR;
JFe = @(Fe) p.aFe*Fe;

Plimit = JL(L) / (p.aP*(1+p.betaD+p.betaP));

if (P>Plimit)
    r = JL(L) / (p.m*(1+p.betaD+p.betaP));
else
    if p.bPhosphonate
        r = (JL(L)+P*p.aP*(p.betaPh-p.betaP)) / (p.m*(1+p.betaD+p.betaPh));
    else
        r = p.aP*P/p.m;
    end
end

r = min(JFe(Fe/p.m), r);
