function r = calcR(p, L, P, Fe)

JL = @(L) p.aMax*(1-exp(-p.aL*L/(p.aMax)))-p.aR0;
JFe = @(Fe) p.aFe*Fe;
jPh = 0*L;

Plimit = JL(L) / (p.aP*(1+p.betaD+p.betaP));

r = length(Plimit);
ix = (P>Plimit);
% No needs for phosphonates (plenty of P):
r(ix) = JL(L(ix)) / (1+p.betaD+p.betaP);
% P limited:
if p.bPhosphonate
    % ...with phosphonate break down
    r(~ix) = (JL(L(~ix))+p.aP*P*p.betaPh) / (1+p.betaD+p.betaPh+p.betaP);
    jPh(~ix) = r(~ix) - p.aP*P;
else
    %...without phosphonate break down
    r(~ix) = min(p.aP*P, JL(L(~ix))-p.aP*P*(p.betaD+p.betaP));
    jPh(~ix) = 0;
end
% Burn the remaining O2 and reduce growth accordingly:
jRtot = p.aR0 + p.betaD*r + p.betaP*p.aP*P + (p.betaPh)*jPh;
jC = JL(L)+p.aR0-jRtot-max(0, p.aO2-jRtot); % Carbon available for growth
r = min(r, jC);

% Iron limitation:
r = min(JFe(Fe), r);

% Mortality:
r = r - p.mort;
