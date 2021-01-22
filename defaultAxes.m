%
% Adjust axes properties.
%

function defaultAxes(sWidth)

% set(gca, ...
%   'Box'         , 'off'     , ...
% %  'TickDir'     , 'out'     , ...
%   'TickLength'  , [.02 .02] , ...
%   'XMinorTick'  , 'on'      , ...
%   'YMinorTick'  , 'on'      , ...
%   'YGrid'       , 'on'      , ...
% %  'XColor'      , [.3 .3 .3], ...
% %  'YColor'      , [.3 .3 .3], ...
%   'YTick'       , 0:250:2000, ...
%   'LineWidth'   , 1         );

fontName = 'Arial';
fontSize = 10;
graphBorderWidth = 0.5;



set(gca, ...
  'Box'         , 'on'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'off'      , ...
  'LineWidth'   , graphBorderWidth, ...
  'FontName'   , fontName,...
  'FontSize'   , fontSize);
set(get(gca,'xlabel'), ...
  'FontName',fontName, 'FontSize',fontSize);
set(get(gca,'ylabel'),...
  'FontName',fontName, 'FontSize',fontSize);
set(get(gca,'title'),...
  'FontName',fontName, 'FontSize',fontSize);
h = get(gca,'children');
for i = 1:length(h)
  if strcmp(get(h(i),'Type'), 'Text')
    set(h(i),'FontName',fontName, 'FontSize',fontSize);
  end
end

set(gcf, 'PaperPositionMode', 'auto');
set(gca,'Layer','top');
%
% Adjust size of the plot:
%
if nargin==1
  set(gcf,'paperunits','centimeters')
  set(gcf,'units','centimeters')
  pos = get(gcf,'paperposition');
  ratio = pos(3)/pos(4);
  if strcmp(sWidth,'single')
    pos(3) = 8;
  elseif strcmp(sWidth,'double')
    pos(3) = 16;
  elseif ~isstr(sWidth) 
    pos(3) = sWidth; % Assume that we got a width in cm
  else
      stop
  end
  pos(4) = pos(3)/ratio; % maintain the original ratio
  set(gcf,'paperposition',pos);
  ppos = get(gcf,'position');
  ppos([3 4]) = pos([3 4]);
  set(gcf,'position',ppos)
end

set(gcf,'color','white')


