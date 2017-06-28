function plotrot(D) %(s,varargin)
% plot symmetry
%
% Input
%  s - symmetry
%
% Output
%
% Options
%  antipodal      - include [[AxialDirectional.html,antipodal symmetry]]

s = crystalSymmetry('-43m');
mtexFig = newMtexFigure('xAxisDirection','east'); %(varargin{:});

%% which directions to plot
m = [Miller(1,0,0,s),Miller(0,1,0,s),...
  Miller(0,0,1,s),Miller(1,1,0,s),...
  Miller(0,1,1,s),Miller(1,0,1,s),...
  Miller(1,1,1,s)];


m = unique(m);
options = [{'symmetrised','labeled','MarkerEdgeColor','k','grid','doNotDraw','antipodal','xAxisDirection','south'}]; %
  
% plot them

washold = getHoldState(mtexFig.gca);
hold(mtexFig.gca,'all')
for i = 1:length(m)
  m(i).scatter(options{:});
end
hold(mtexFig.gca,washold)


% postprocess figure
setappdata(gcf,'CS',s);
set(gcf,'tag','ipdf');
mtexFig.drawNow('figSize',getMTEXpref('figSize'));

%%
m = D(1);
options = [{'MarkerSize',6,'MarkerFaceColor',[0 0 1],...
    'Marker','+','MarkerEdgeColor','k','grid','doNotDraw','antipodal'}];
  
% plot them
washold = getHoldState(mtexFig.gca);
hold(mtexFig.gca,'all')
for i = 1:length(m)
  m(i).scatter(options{:});
end
hold(mtexFig.gca,washold)


% postprocess figure
setappdata(gcf,'CS',s);
set(gcf,'tag','ipdf');
mtexFig.drawNow('figSize',getMTEXpref('figSize'));%,varargin{:});
%%
%%
m = D;


% m = unique(m);

options = [{'MarkerSize',3,'MarkerFaceColor',[0.75 0 0.75],...
    'Marker','*','MarkerEdgeColor','k','grid','doNotDraw','antipodal'}];
  
% plot them
washold = getHoldState(mtexFig.gca);
hold(mtexFig.gca,'all')
for i = 2:length(m)
  m(i).scatter(options{:});
end
hold(mtexFig.gca,washold)


% postprocess figure
setappdata(gcf,'CS',s);
set(gcf,'tag','ipdf');
mtexFig.drawNow('figSize',getMTEXpref('figSize'));%,varargin{:});


% view(axes1,[-270 90]);