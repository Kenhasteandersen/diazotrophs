function [r1,r2] = plotRvsPandFeSurface(p1, p2, L)
n = 100;

Pmax = 1;
Femax = 0.02;

convFe = 1/55*1000;
convP = 1/31*1000;

P = linspace(0,Pmax*convP,n);
Fe = linspace(0,Femax*convFe,n);

col1 = zeros(n,n,3);
col2 = col1;
for i = 1:length(P)
    r1(i,:) = calcR(p1,L,P(i)/convP,Fe/convFe);
    r2(i,:) = calcR(p2,L,P(i)/convP,Fe/convFe);
    
    col1(i,:,1:3) = max(0,r1(i,:))'*[1,0,1];
    col2(i,:,1:3) = max(0,r2(i,:))'*[0,1,0];

    for j = 1:n
        if r1(i,j) > r2(i,j)
            col(i,j,:) = col1(i,j,:);
        else
            col(i,j,:) = col2(i,j,:);
        end
        
        if r1(i,j)<0 & r2(i,j)<0
            col(i,j,:) = [1,1,1];
        end
    end
end

col = 1-col*3;



surface(Fe, P, r2,'facealpha',0.5)
hold on
surface(Fe, P, r1,'facealpha',0.5)

shading flat
%colorbar
set(gca,'view',[-14.2800 37.4396])
axis('tight')

xlabel('Fe (nM)')
ylabel('P (nM)')
zlabel('Growth rate,{\it r} (day^{-1})')
