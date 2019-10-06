close all;clear all
viewagl=[-37.5,30;0,90;90,0;0,0];
n=4;
l=2*ones(1,n);
lg=l/2;%èdêSà íu
th=zeros(1,n);
wedge=inline('[0,-az,ay;az,0,-ax;-ay,ax,0]');
vectest5model;
for j=1:4
	subplot(2,2,j);
	plot11(1,j)=plot3(p0(1,:),p0(2,:),p0(3,:),'o-','linewidth',3);
	hold on
	plot11(2,j)=plot3(pg(1,:),pg(2,:),pg(3,:),'ro','markersize',5);
	hold off
	axis equal;grid;xlabel('x');ylabel('y');zlabel('z');
	axis([-5,5,-5,5,0,10]);
	view(viewagl(j,:));
end
for i=1:n-1
	ui(i)=uicontrol(1,'style','slider','max',pi/2,'min',-pi/2,'value',0);
	set(ui(i),'position',[10,25+20*(i-1),60,20],'callback','vectest5sub')
end
