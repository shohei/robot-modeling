close all;clear all
viewagl=[-37.5,30;0,90;90,0;0,0];
n=16;
l=[zeros(2,n);ones(1,n)];
for i=1:n
	arm(i).th=0;
	arm(i).l=[0;0;1];
	arm(i).a=[0;1;0];
	arm(i).lg=arm(i).l/2;
end
arm( 1).l=[0;0;0];
arm( 2).l=[0;-2;1];
arm( 4).l=[0;-1;1];
arm( 7).l=[0;0;1];
arm(10).l=[0;1;1];
arm(13).l=[0;2;1];

% define arm list structure
arm( 1).parent=0;
arm(16).parent=1;
arm( 2).parent=16;arm( 3).parent= 2;
arm( 4).parent=16;arm( 5).parent= 4;arm( 6).parent= 5;
arm( 7).parent=16;arm( 8).parent= 7;arm( 9).parent= 8;
arm(10).parent=16;arm(11).parent=10;arm(12).parent=11;
arm(13).parent=16;arm(14).parent=13;arm(15).parent=14;
% 子リンクを接続し双方向リンクとする。
arm=vectest9makechildlink(arm);

ind=vectest9findallchildren(arm);
arm=vectest9kinematics(arm,ind);
plot1=[];
plot1=vectest9plot(arm,plot1);
ui=vectest9makeui(arm,'vectest9sub;');
