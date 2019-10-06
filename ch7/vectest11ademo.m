close all;clear all
viewagl=[-37.5,30;0,90;90,0;0,0];
n=24;
l=[zeros(2,n);ones(1,n)];
for i=[01,04,07,10,11,12,14,15,16,17,18,20,21,22]
	arm(i).a=[1;0;0];
end
for i=[03,09,13,19,23]
	arm(i).a=[0;1;0];
end
for i=[02,05,06,08,24]
	arm(i).a=[0;0;1];
end

arm(01).l=[-51;0;60];%¶˜r
arm(02).l=[-30;0;0];
arm(03).l=[-52;0;0];
arm(04).l=[-65;0;0];
arm(05).l=[0;0;68];%“·
arm(06).l=[0;0;0];%Œ´“_
arm(07).l=[51;0;60];%‰E˜r
arm(08).l=[30;0;0];
arm(09).l=[52;0;0];
arm(10).l=[65;0;0];
arm(11).l=[0;0;-17];%¶‘«
arm(12).l=[0;0;-17];%‰E‘«
arm(13).l=[-23;0;0];%¶‹r
arm(14).l=[0;0;-42];
arm(15).l=[0;23;-43];
arm(16).l=[0;0;-51];
arm(17).l=[0;0;-41];
arm(18).l=[0;0;0];%“·‘Ì
arm(19).l=[23;0;0];%‰E‹r
arm(20).l=[0;0;-42];
arm(21).l=[0;23;-43];
arm(22).l=[0;0;-51];
arm(23).l=[0;0;-41];
arm(24).l=[0;0;30];%Šç
for i=1:n
	arm(i).l = arm(i).l / 100;
	arm(i).th=0;
	arm(i).lg=arm(i).l/2;
	arm(i).xyz=vectest9makebox(arm(i).l,0.1);
end
arm(24).xyz=vectest9makebox(arm(24).l,.15); %“ª
arm(12).xyz=vectest9makebox(arm(12).l,.2);
arm(11).xyz=vectest9makebox(arm(11).l,.2);
arm( 5).xyz=vectest9makebox(arm( 5).l,.25);

% define arm list structure
arm( 1).parent= 6;arm( 2).parent= 1;arm( 3).parent= 2;arm( 4).parent= 3;
arm( 5).parent= 6;arm( 6).parent= 0;arm( 7).parent= 6;arm( 8).parent= 7;
arm( 9).parent= 8;arm(10).parent= 9;arm(11).parent=17;arm(12).parent=23;
arm(13).parent= 6;arm(14).parent=13;arm(15).parent=14;arm(16).parent=15;
arm(17).parent=16;arm(18).parent= 6;arm(19).parent= 6;arm(20).parent=19;
arm(21).parent=20;arm(22).parent=21;arm(23).parent=22;arm(24).parent= 5;

arm(1).th=pi/2;
arm(2).th=pi/2;
arm(7).th=pi/2;
arm(8).th=-pi/2;

% qƒŠƒ“ƒN‚ğÚ‘±‚µ‘o•ûŒüƒŠƒ“ƒN‚Æ‚·‚éB
arm=vectest9makechildlink(arm);

ind=vectest9findallchildren(arm);
arm=vectest9kinematics(arm,ind);
plot1=[];
plot1=vectest9plot2(arm,plot1);
ui=vectest9makeui(arm,'vectest9sub2;');
for i=1:4
	subplot(2,2,i);axis equal;axis([-1,1,-1,1,-2,2]);
	view(viewagl(i,:));grid;
end
