function r = calcR(p, L, P, Fe)

JL = @(L) p.aMax*p.m*(1-exp(-p.aL*L/(p.aMax*p.m)))-p.JR;
JFe = @(Fe) p.aFe*Fe;

Plimit = JL(L) / (p.aP*(1+p.betaD+p.betaP));

r = length(Plimit);
ix = (P>Plimit);
    r(ix) = JL(L(ix)) / (p.m*(1+p.betaD+p.betaP));
    if p.bPhosphonate
        r(~ix) = (JL(L(~ix))+P*p.aP*(p.betaPh-p.betaP)) / (p.m*(1+p.betaD+p.betaPh));
    else
        r(~ix) = p.aP*P/p.m;
    end


r = min(JFe(Fe/p.m), r);
