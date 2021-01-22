function defaultAxesHorizontal(sWidth)

if nargin==0
    defaultAxes()
else
    defaultAxes(sWidth)
end
%
% Adjust axes assuming that we only have a horisontal line of subplots:
%
widthYlabel = 0.7; % Width in cm
widthYticks = 0.85;
heightXlabel = 0.7;
heightXticks = 0.7;
widthYrightmargin = 0.4; % Margin at the very right edge
widthYaxesspace = 0.3; % Space between axes
heightTopmargin = 0.3;

% Find no. of ylabels and yticklabels and make a fixed width for those
hAxes = get(gcf,'children');
hAxes = hAxes(length(hAxes):-1:1);
% Remove legend entries:
for i = 1:length(hAxes)
  isaxes(i) = isa(hAxes(i),'matlab.graphics.axis.Axes');
end
hAxes = hAxes(isaxes);
n = length(hAxes);

widthFixed = zeros(1,n);
heightFixed = 0;
for i = 1:length(hAxes)
    if ~isempty(get(get(hAxes(i),'yLabel'),'String'))
        widthFixed(i) = widthFixed(i) + widthYlabel;
    end
    if ~isempty(get(hAxes(i),'yticklabel'))
        widthFixed(i) = widthFixed(i) + widthYticks;
    end    
end

if ~isempty(get(get(hAxes(1),'xLabel'),'String'))
    heightFixed = heightFixed + heightXlabel;
end
if ~isempty(get(hAxes(1),'xticklabel'))
    heightFixed = heightFixed + heightXticks;
end

tmp = get(gcf,'paperposition');
widthpaper = tmp(3);
heightpaper = tmp(4);
widthRel = (widthpaper-sum(widthFixed)-widthYrightmargin-widthYaxesspace*(n-1))...
    /widthpaper/length(hAxes);
heightRel = (heightpaper-heightFixed-heightTopmargin)/heightpaper;

for i = 1:n
    set(hAxes(i),'position',...
        [(sum(widthFixed(1:i))+widthYaxesspace*(i-1))/widthpaper+widthRel*(i-1) heightFixed/heightpaper ...
        widthRel heightRel]);
end
