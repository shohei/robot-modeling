clear all;close all
global gmap
gmap=mobile1mapsim';
D=0.5;
x0=zeros(1,length(gmap));y0=x0;theta0=x0;
for i=2:length(gmap)
	x=(gmap(1,i)+gmap(3,i))/2;
	y=(gmap(2,i)+gmap(4,i))/2;
	theta=atan2(gmap(2,i)-gmap(2,i-1),gmap(1,i)-gmap(1,i-1))-pi/2;
	x0(i)=x;y0(i)=y;theta0(i)=theta;
end
x0(1)=x0(2);y0(1)=y0(2);theta0(1)=theta0(2);
xy=[x0(:),y0(:)];
dt=0.1;
t=((1:length(x0))'-1)*dt;
if 0
for i=1:length(x0)
	lineedge=mobilesim1roadedge([xy(i,:),theta0(i)]);
	drawnow;
	pause(0.5);
end
else
mobilesim1model
end
