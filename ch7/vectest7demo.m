close all;clear all
n=10;
[xx,yy,zz] = cylinder([0,.5,.5,.5,.5],n);
xx=[xx;nan*zeros(1,n+1)];
yy=[yy;nan*zeros(1,n+1)];
zz=[zz;nan*zeros(1,n+1)];
vehi(1,:)= [xx(:)',xx(2,:),nan,xx(3,:),nan,xx(5,:),nan,[0,-2,2,0]];
vehi(2,:)= [yy(:)',yy(2,:),nan,yy(3,:),nan,yy(5,:),nan,[0,0,0,0]];
vehi(3,:)=-[zz(:)',zz(2,:),nan,zz(3,:),nan,zz(5,:),nan,[0.25,1,1,0.25]]*4+4;
vehi1=[vehi;ones(1,length(vehi(1,:)))];
viewagl=[-37.5,30;0,90;90,0;0,0];
th=0;x=0;y=0;z=0;a=[0;0;1];
a=a/norm(a);
R=expm([0,-a(3),a(2);a(3),0,-a(1);-a(2),a(1),0]*th);
T=[R,[x;y;z];[0,0,0,1]];
newvehi1=T*vehi1;
for j=1:4
	subplot(2,2,j);
	plot11(1,j)=plot3(newvehi1(1,:),newvehi1(2,:),newvehi1(3,:));
	axis equal;grid;xlabel('x');ylabel('y');zlabel('z');
	axis([-10,10,-10,10,0,20]);
	view(viewagl(j,:));
end
ui1=uicontrol(1,'style','radiobutton','string','[1,0,0]','value',1);
ui2=uicontrol(1,'style','radiobutton','string','[0,1,0]','value',0);
ui3=uicontrol(1,'style','radiobutton','string','[0,0,1]','value',0);
ui4=uicontrol(1,'style','slider','max',pi/2,'min',-pi/2,'value',0);
ui5=uicontrol(1,'style','slider','max',10,'min',-10,'value',0);
ui6=uicontrol(1,'style','slider','max',10,'min',-10,'value',0);
ui7=uicontrol(1,'style','slider','max',20,'min',0,'value',0);

set(ui1,'position',[30,25,60,20],'callback','a=[1;0;0];vectest7sub');
set(ui2,'position',[30,45,60,20],'callback','a=[0;1;0];vectest7sub');
set(ui3,'position',[30,65,60,20],'callback','a=[0;0;1];vectest7sub');
set(ui4,'position',[30,85,60,20],'callback','vectest7sub');
set(ui5,'position',[30,105,60,20],'callback','vectest7sub');
set(ui6,'position',[30,125,60,20],'callback','vectest7sub');
set(ui7,'position',[30,145,60,20],'callback','vectest7sub');
uicontrol('style','text','position',[10,85,15,20],'string','th');
uicontrol('style','text','position',[10,105,15,20],'string','x');
uicontrol('style','text','position',[10,125,15,20],'string','y');
uicontrol('style','text','position',[10,145,15,20],'string','z');
