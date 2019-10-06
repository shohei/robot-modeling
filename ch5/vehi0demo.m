close all
vehi=[0,1,1,-1,-1,0;2,1,-1,-1,1,2];
%vehi=[0 0;0 5];
vehi1=[vehi;ones(1,length(vehi(1,:)))];
plot(vehi1(1,:),vehi1(2,:)); axis equal;axis([-10,10,-10,10]);grid
ui1=uicontrol(1,'style','slider','max',pi/2,'min',-pi/2,'value',0);
ui2=uicontrol(1,'style','slider','max',pi/2,'min',-pi/2,'value',0);
ui3=uicontrol(1,'style','slider','max',pi/2,'min',-pi/2,'value',0);
set(ui1,'position',[10,25,60,20],'callback','vehi0sub');
set(ui2,'position',[10,65,60,20],'callback','vehi0sub');
set(ui3,'position',[10,105,60,20],'callback','vehi0sub');
uicontrol('style','text','position',[10,45,60,20],'string','É∆');
uicontrol('style','text','position',[10,85,60,20],'string','x');
uicontrol('style','text','position',[10,125,60,20],'string','y');
