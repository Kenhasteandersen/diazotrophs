function r = calcR(p, L, P, Fe)

JL = @(L) p.aMax*(1-exp(-p.aL*L/(p.aMax)))-p.aR;
JFe = @(Fe) p.aFe*Fe;

Plimit = JL(L) / (p.aP*(1+p.betaD+p.betaP));

r = length(Plimit);
ix = (P>Plimit);
% No needs for phosphonates (plenty of P):
r(ix) = JL(L(ix)) / (1+p.betaD+p.betaP);
% P limited:
if p.bPhosphonate
    % ...with phosphonate break down
    r(~ix) = (JL(L(~ix))+p.aP*P*p.betaPh) / (1+p.betaD+p.betaPh+p.betaP);
else
    %...without phosphonate break down
    r(~ix) = min(p.aP*P, JL(L(~ix))-p.aP*P*(p.betaD+p.betaP));
end
% Iron limitation:
r = min(JFe(Fe), r);
