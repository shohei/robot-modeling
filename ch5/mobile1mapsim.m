function gmap=mobile1mapsim(options)
close all;figure(1);plot([0,0,100,100],[0,100,100,0]);
if nargin==1
	title('コースをマウスにより指定してください。終わりは、リターン');
	[mx,my]=ginput;
	mx=mx(:)';my=my(:)';
else
	mx=[12.212,14.977,25.576,44.009,62.442,72.811,72.119,62.212,38.248,22.580];
	my=[15.789,35.672,63.157,78.070,75.146,52.339,31.286,25.438,14.912,15.497];
end
haba=5;
%mr=[];ml=[];
%for i=1:length(mx)-1
%	theta = atan2(my(i+1)-my(i),mx(i+1)-mx(i));
%	mr=[mr;[mx(i)+haba*cos(theta+pi/2),my(i)+haba*sin(theta+pi/2)]];
%	ml=[ml;[mx(i)+haba*cos(theta-pi/2),my(i)+haba*sin(theta-pi/2)]];
%end
theta=atan2(diff(my),diff(mx));
mr=[mx(1:end-1)+haba*cos(theta+pi/2);my(1:end-1)+haba*sin(theta+pi/2)]';
ml=[mx(1:end-1)+haba*cos(theta-pi/2);my(1:end-1)+haba*sin(theta-pi/2)]';

mrr=[interp1(1:length(mr(:,1)),mr(:,1),1:0.1:length(mr(:,1)),'spline');interp1(1:length(mr(:,2)),mr(:,2),1:0.1:length(mr(:,2)),'spline')]';
mll=[interp1(1:length(ml(:,1)),ml(:,1),1:0.1:length(ml(:,1)),'spline');interp1(1:length(ml(:,2)),ml(:,2),1:0.1:length(ml(:,2)),'spline')]';

close all;plot(mrr(:,1),mrr(:,2),'g',mll(:,1),mll(:,2),'r','linewidth',3);
hold on;plot(mx,my,'o:');hold off
axis([0,100,0,100]);
gmap=[mll,mrr];
