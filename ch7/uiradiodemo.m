close all;clear all
plot11=plot(sin(0:0.1:2*pi),'linewidth',5);
ui(1)=uicontrol('style','radiobutton','string','��','value',1);
ui(2)=uicontrol('style','radiobutton','string','��','value',0);
ui(3)=uicontrol('style','radiobutton','string','��','value',0);
ui(4)=uicontrol('style','radiobutton','string','�}�[���_','value',0);
ui(5)=uicontrol('style','radiobutton','string','�V�A��','value',0);
ui(6)=uicontrol('style','radiobutton','string','��','value',0);
ui(7)=uicontrol('style','radiobutton','string','��','value',0);
flag=1;
set(ui(1),'position',[20,25,60,20],'callback','flag=1;uiradiodemosub');
set(ui(2),'position',[20,45,60,20],'callback','flag=2;uiradiodemosub');
set(ui(3),'position',[20,65,60,20],'callback','flag=3;uiradiodemosub');
set(ui(4),'position',[20,85,60,20],'callback','flag=4;uiradiodemosub');
set(ui(5),'position',[20,105,60,20],'callback','flag=5;uiradiodemosub');
set(ui(6),'position',[20,125,60,20],'callback','flag=6;uiradiodemosub');
set(ui(7),'position',[20,145,60,20],'callback','flag=7;uiradiodemosub');