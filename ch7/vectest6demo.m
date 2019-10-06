close all;clear all
viewagl=[-37.5,30;0,90;90,0;0,0];
l1=3;l2=2;l3=2;th1=0;th2=0;
l2g=l2/2;l3g=l3/2;
wedge=inline('[0,-az,ay;az,0,-ax;-ay,ax,0]');
vectest6model;
for j=1:4
	subplot(2,2,j);
	plot11(1,j)=plot3(xy(1,:),xy(2,:),xy(3,:),'o-','linewidth',3);
	hold on
	plot11(2,j)=plot3(xyg(1,:),xyg(2,:),xyg(3,:),'ro','markersize',5);
	hold off
	axis equal;grid;xlabel('x');ylabel('y');zlabel('z');
	axis([-5,5,-5,5,0,10]);
	view(viewagl(j,:));
end
ui1=uicontrol(1,'style','slider','max',pi/2,'min',-pi/2,'value',0);
ui2=uicontrol(1,'style','slider','max',pi/2,'min',-pi/2,'value',0);
set(ui1,'position',[10,25,60,20],'callback','vectest6sub');
set(ui2,'position',[10,65,60,20],'callback','vectest6sub');
uicontrol('style','text','position',[10,45,60,20],'string','É∆1');
uicontrol('style','text','position',[10,85,60,20],'string','É∆2');
