function p = parameters(z, bPhosphonate)
if (nargin()==1)
    bPhosphonate = true;
end
p.bPhosphonate = bPhosphonate;
%
% Size scaling exponents:
%
baL = 2;  % Selfshading (could be volume limite = 3) 
baP = 1;  % Diffusion (could be surface limted = 2)
bO2 = 1;
%
% Base size:
%
d=20;
%
% Mass
%
rho = 2e-7;
m = rho*d^3;
%
% Stoichiometry:
%
p.rhoCP = 106*12/31;
p.rhoCN = 6.624*12/14;
p.rhoCFe = 10000*12/26;
%
% Affinities (specific, gC/gC/day)
%
p.aL = 0.25e-7*400*(d/20/z)^baL / m;
p.aP = 1e-4*(d/20/z)^baP*p.rhoCP/30 / m;
p.aFe = 1e-4*(d/20/z)^baP*p.rhoCFe/100 / m;
%
% Metabolism
%
p.aMax = 1;
%p.JLmax = p.aMax*p.m;

p.aR0 = 0.05;
p.JO2 = 0.0002*(d/20/z)^bO2;
p.aR = p.aR0 + p.JO2/m;
%p.JR = p.aR*p.m + p.JO2;
%
% Costs
%
p.betaD = 0.35;
p.betaP = 0.0016;
p.betaPh = 0.005;