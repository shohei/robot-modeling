close all;clear all
viewagl=[-37.5,30;0,90;90,0;0,0];
n=3;
l=[zeros(2,n);2*ones(1,n)];
th=zeros(1,n);
lg=l/2;%重心位置
%同次変換座標行列の定義より、arm(1)の重心lgは、関節が動いてもlgの位置には作用しない。
%
arm(1).th=th(1);arm(1).a=[1;0;0];arm(1).l=l(:,1);arm(1).lg=lg(:,1);
arm(2).th=th(2);arm(2).a=[0;1;0];arm(2).l=l(:,2);arm(2).lg=lg(:,2);
arm(3).th=th(3);arm(3).a=[1;0;0];arm(3).l=l(:,3);arm(3).lg=lg(:,3);

% define arm list structure
arm(1).parent=0;arm(2).parent=1;arm(3).parent=2;
% 子リンクを接続し双方向リンクとする。
arm=vectest9makechildlink(arm);
ind=vectest9findallchildren(arm);

dt=0.01;t=0:dt:2*pi;
th  = pi/2*sin(t);
dth =diff(th)/dt;dth =[dth(:,1), dth];
ddth=diff(dth)/dt;ddth=[ddth(:,1),ddth];
%Simulinkモデルは、収縮しないモデルと仮定
l = 2 + 0*sin(t);
dl = diff(l)/dt;dl=[dl(:,1),dl];
ddl=diff(dl)/dt;ddl=[ddl(:,1),ddl];

lg = 1 + 0*sin(t);
dlg = diff(lg)/dt;dlg=[dlg(:,1),dl];
ddlg=diff(dlg)/dt;ddlg=[ddlg(:,1),ddl];


plot1=[];
P{length(arm)}=[];DP{length(arm)}=[];DDP{length(arm)}=[];
Pg{length(arm)}=[];DPg{length(arm)}=[];DDPg{length(arm)}=[];
R{length(arm)}=[];W{length(arm)}=[];DW{length(arm)}=[];
for ii=1:length(t)
	for i=1:length(arm)
		arm(i).th=th(ii);
		arm(i).dth=dth(ii);
		arm(i).ddth=ddth(ii);
		arm(i).l=[0;0;l(ii)];
		arm(i).dl=[0;0;dl(ii)];
		arm(i).ddl=[0;0;ddl(ii)];
		arm(i).lg=[0;0;lg(ii)];
		arm(i).dlg=[0;0;dlg(ii)];
		arm(i).ddlg=[0;0;ddlg(ii)];
	end
	ind=vectest9findallchildren(arm);
	arm=vectest9kinematics3(arm,ind);
	for i=1:length(arm)
		P{i}=[P{i},arm(i).T(1:3,4)];
		DP{i}=[DP{i},arm(i).dT(1:3,4) ];
		DDP{i}=[DDP{i},arm(i).ddT(1:3,4)];
		if(~isempty(arm(i).Tg))
			Pg{i}  =[Pg{i}  ,arm(i).Tg(1:3,4)  ];
			DPg{i} =[DPg{i} ,arm(i).dTg(1:3,4) ];
			DDPg{i}=[DDPg{i},arm(i).ddTg(1:3,4)];
		end
		dR = arm(i).V(1:3,1:3);
		w = [dR(3,2);dR(1,3);dR(2,1)];% or w = -[dR(2,3);dR(3,1);dR(1,2)];
		ddR = arm(i).A(1:3,1:3);
		dw = [ddR(3,2);ddR(1,3);ddR(2,1)];% or dw = -[ddR(2,3);ddR(3,1);ddR(1,2)];
		R{i}  = [R{i} ,r2ath(arm(i).T(1:3,1:3))];
		W{i}  = [W{i} ,w];
		DW{i} = [DW{i},dw];
	end
	plot1 = vectest9plot(arm,plot1);
	drawnow;
end
simin.time=t(:);
simin.signals.values=[th(:),dth(:),ddth(:),th(:),dth(:),ddth(:)];
simin.dimenstions=6;
sim('vectest9asim');
close all
figure
subplot(3,3,1);plot(t,P{3}');axis tight;title('位置MATLAB');
subplot(3,3,2);plot(t,simout1.signals.values(:,1:3));axis tight;title('位置SIM');
subplot(3,3,3);plot(t,P{3}'-simout1.signals.values(:,1:3));axis tight;title('位置誤差');
subplot(3,3,4);plot(t,DP{3});axis tight;title('速度MATLAB')
subplot(3,3,5);plot(t,simout1.signals.values(:,4:6));axis tight;title('速度SIM')
subplot(3,3,6);plot(t,DP{3}'-simout1.signals.values(:,4:6));axis tight;title('速度誤差');
subplot(3,3,7);plot(t,DDP{3}');axis tight;title('加速度MATLAB')
subplot(3,3,8);plot(t,simout1.signals.values(:,10:12));axis tight;title('加速度SIM')
subplot(3,3,9);plot(t,DDP{3}'-simout1.signals.values(:,10:12));axis tight;title('加速度誤差');

figure
subplot(3,3,4);plot(t,W{2}');axis tight;title('角速度MATLAB')
subplot(3,3,5);plot(t,simout1.signals.values(:,7:9));axis tight;title('角速度SIM')
subplot(3,3,6);plot(t,W{2}'-simout1.signals.values(:,7:9));axis tight;title('角速度誤差');

subplot(3,3,7);plot(t,DW{2}');axis tight;title('角加速度MATLAB')
subplot(3,3,8);plot(t,simout1.signals.values(:,13:15));axis tight;title('角加速度SIM')
subplot(3,3,9);plot(t,DW{2}'-simout1.signals.values(:,13:15));axis tight;title('角加速度誤差');
