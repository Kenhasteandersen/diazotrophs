%
% Find the z (size) with the highest growth rate
%
function zOpt = calcZopt(bPhosphonate,L,P,Fe)

function obj = objective(z)
    p = parameters(z, bPhosphonate);
    obj = -calcR(p,L,P,Fe);
end

zOpt = fminbnd(@objective, 0.01,10);

end