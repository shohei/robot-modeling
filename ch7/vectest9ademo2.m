close all;clear all
viewagl=[-37.5,30;0,90;90,0;0,0];
n=3;
l=[zeros(2,n);2*ones(1,n)];
th=zeros(1,n);
lg=l/2;%�d�S�ʒu
%�����ϊ����W�s��̒�`���Aarm(1)�̏d�Slg�́A�֐߂������Ă�lg�̈ʒu�ɂ͍�p���Ȃ��B
%
arm(1).th=th(1);arm(1).a=[1;0;0];arm(1).l=l(:,1);arm(1).lg=lg(:,1);
arm(2).th=th(2);arm(2).a=[0;1;0];arm(2).l=l(:,2);arm(2).lg=lg(:,2);
arm(3).th=th(3);arm(3).a=[1;0;0];arm(3).l=l(:,3);arm(3).lg=lg(:,3);

% define arm list structure
arm(1).parent=0;arm(2).parent=1;arm(3).parent=2;
% �q�����N��ڑ����o���������N�Ƃ���B
arm=vectest9makechildlink(arm);
ind=vectest9findallchildren(arm);

dt=0.001;t=0:dt:2*pi;
th  = pi/2*sin(t);
dth =diff(th)/dt;dth =[dth(:,1), dth];%dth  = pi/2*cos(t);
ddth=diff(dth)/dt;ddth=[ddth(:,1),ddth];%ddth  = -pi/2*sin(t);

l = 2 + sin(t);
dl = diff(l)/dt;dl=[dl(:,1),dl];%dl = cos(t);
ddl=diff(dl)/dt;ddl=[ddl(:,1),ddl];%ddl = -sin(t);
%�d�S�́Al�̔����Ɖ���Al�Ɠ��l�Ɏ��k����Ɖ���B
lg = 1 + sin(t);
dlg = diff(lg)/dt;dlg=[dlg(:,1),dlg];
ddlg=diff(dlg)/dt;ddlg=[ddlg(:,1),ddlg];

plot1=[];
P{length(arm)} =[];DP{length(arm)}= [];DDP{length(arm)} =[];
Pg{length(arm)}=[];DPg{length(arm)}=[];DDPg{length(arm)}=[];
R{length(arm)} =[];W{length(arm)}=  [];DW{length(arm)}  =[];
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
		P{i}  =[P{i}  ,arm(i).T(1:3,4)  ];
		DP{i} =[DP{i} ,arm(i).dT(1:3,4) ];
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
%	plot1 = vectest9plot(arm,plot1);drawnow;
end
for i=1:length(arm)
	eDP{i}  = diff(P{i}')'/dt;
	eDP{i}  = [eDP{i}(:,1),eDP{i}];
	eDDP{i} = diff(eDP{i}')'/dt;
	eDDP{i} = [eDDP{i}(:,1),eDDP{i}];
	if(i == 1) continue;end
	eDPg{i}  = diff(Pg{i}')'/dt;
	eDPg{i}  = [eDPg{i}(:,1),eDPg{i}];
	eDDPg{i} = diff(eDPg{i}')'/dt;
	eDDPg{i} = [eDDPg{i}(:,1),eDDPg{i}];
end
for i=1:length(arm)
	eW{i}=[0;0;0];
	for j = 2:length(R{i}(1,:))
		eW{i}(:,j) = r2ath((ath2r(R{i}(:,j))) * (ath2r(R{i}(:,j-1)))^-1) / dt;
	end
	eW{i}(:,1) = eW{i}(:,2);
	eDW{i} = diff(eW{i}')' / dt;
	eDW{i} = [eDW{i}(:,1),eDW{i}];
end
close all
for i=1:length(arm)
	figure;
	subplot(4,5,1);plot(P{i}');title('�ʒuP');axis tight
	subplot(4,5,2);plot(DP{i}');title('���xDP');axis tight
	subplot(4,5,3);plot(eDP{i}');title('���l���xeDP');axis tight
	subplot(4,5,4);plot((DP{i}-eDP{i})');title('�덷DP-eDP');axis tight
	subplot(4,5,5);plot(DDP{i}');title('�����xDDP');axis tight
	subplot(4,5,6);plot(eDDP{i}');title('���l�����xeDDP');axis tight
	subplot(4,5,7);plot((DDP{i}-eDDP{i})');title('�덷DDP-eDDP');axis tight
	if(i ~= length(arm))
		subplot(4,5,8);plot(W{i}');title('�p���xW');axis tight
		subplot(4,5,9);plot(eW{i}');title('���l�p���xeW');axis tight
		subplot(4,5,10);plot((W{i}-eW{i})');title('�덷W-eW');axis tight
		subplot(4,5,11):plot(DW{i}');title('�p���xDW');axis tight
		subplot(4,5,12):plot(eDW{i}');title('���l�p���xeDW');axis tight
		subplot(4,5,13):plot((DW{i}-eDW{i})');title('�덷DW-eDW');axis tight
	end
	if(i == 1) continue;end
	subplot(4,5,14);plot(Pg{i}');title('�d�SPg');axis tight
	subplot(4,5,15);plot(DPg{i}');title('�d�S���xDPg');axis tight
	subplot(4,5,16);plot(eDPg{i}');title('���l�d�S���xeDPg');axis tight
	subplot(4,5,17);plot((DPg{i}-eDPg{i})');title('�덷DPg-eDPg');axis tight
	subplot(4,5,18);plot(DDPg{i}');title('�d�S�����xDDPg');axis tight
	subplot(4,5,19);plot(eDDPg{i}');title('���l�d�S�����xeDDPg');axis tight
	subplot(4,5,20);plot((DDPg{i}-eDDPg{i})');title('�덷DDPg-eDDPg');axis tight
end
