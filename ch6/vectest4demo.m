close all;clear all
l1=2;l2=2;l3=3;th1=0;th2=0;
vectest4model;
plot(xy(1,:), xy(2,:), 'o-','linewidth',5);
axis equal;axis([-10,10,-10,10]);grid
ui1=uicontrol(1,'style','slider','max',pi/2,'min',-pi/2,'value',0);
ui2=uicontrol(1,'style','slider','max',pi/2,'min',-pi/2,'value',0);
set(ui1,'position',[10,25,60,20],'callback','vectest4sub');
set(ui2,'position',[10,65,60,20],'callback','vectest4sub');
uicontrol('style','text','position',[10,45,60,20],'string','É∆1');
uicontrol('style','text','position',[10,85,60,20],'string','É∆2');
