close all;clear all
viewagl=[-37.5,30;0,90;90,0;0,0];
n=3;
l=[zeros(2,n);2*ones(1,n)];
lg=l/2;%重心位置
th=zeros(1,n);
%同次変換座標行列の定義より、arm(1)の重心lgは、関節が動いてもlgの位置には作用しない。
for i=1:n
	arm(i).th=th(i);arm(i).a=[1;0;0];arm(i).l=l(:,1);arm(i).lg=lg(:,1);
end
% define arm list structure
arm(1).parent=0;arm(2).parent=1;arm(3).parent=2;
%for i=1:n;arm(i).parent=i-1;end

% 子リンクを接続し双方向リンクとする。
arm=vectest9makechildlink(arm);

ind=vectest9findallchildren(arm);
arm=vectest9kinematics(arm,ind);
plot1=[];
plot1=vectest9plot(arm,plot1);
ui=vectest9makeui(arm,'vectest9sub;');
