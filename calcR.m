function r = calcR(p, L, P, Fe)

JL = @(L) p.aMax*(1-exp(-p.aL*L/(p.aMax)))-p.aR0;
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
    jPh = 0; % NEEDS TO BE FIXED
else
    %...without phosphonate break down
    r(~ix) = min(p.aP*P, JL(L(~ix))-p.aP*P*(p.betaD+p.betaP));
    jPh = 0;
end
% Burn the remaining O2 and reduce growth accordingly:
jRtot = p.aR0 + p.betaD*r + p.betaP*p.aP*P + (p.betaPh+p.betaP)*jPh;
r = r - min(0, p.aO2 - jRtot);

% Iron limitation:
r = min(JFe(Fe), r);
