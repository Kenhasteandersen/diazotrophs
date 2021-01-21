function p = parametersDutkiewicz(z, bPhosphonate)
if (nargin()==1)
    bPhosphonate = true;
end
p.bPhosphonate = bPhosphonate;
%
% Size scaling exponents:
%
baL = -1; %-1;  % Selfshading (could be volume limite = 0) 
baP = -2;  % Diffusion (could be surface limted = 1)
bO2 = -2;
%
% Base size:
%
d=8; 
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
p.rhoCFe = 3000*12/26;
%
% Affinities (specific, gC/gC/day)
%
p.aL = 0.005* z^baL; % Subhendu. Alternatively from Dutkiewicz:  0.75*1.25*0.012 * z^baL;  % Dutkiewicz 2009. mumax*Kpar (note: Kpar is actually the affinity). 
                                  %The factor 0.75 downregulates mumax due to inhibition
p.aP = 1.25/0.035 / 30 * z^baP;  % mumax/(K*molar mass)
p.aFe = 1.25/0.0011 / 55.83 * z^baP; % As above
%
% Metabolism
%
p.aMax = 1.25;
%p.JLmax = p.aMax*p.m;

p.aR0 = 0.05;
p.aO2 = 0.05 * z^bO2;
p.aR = p.aR0 + p.aO2;
%p.JR = p.aR*p.m + p.JO2;
%
% Costs
%
p.betaD = 0.35;
p.betaP = 0.0016;
p.betaPh = 0.005;