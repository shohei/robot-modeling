close all;clear all;
v=2;dt=0.1;steering=0;
figure(1);
axis equal;axis([-300,300,-100,500]);grid;
vehi=[0,1,1,-1,-1,0;2,1,-1,-1,1,2];
[targetx1,targety1] = ginput(1);
hold on;plot(targetx1,targety1,'rp');hold off
[targetx2,targety2] = ginput(1);
hold on;plot([targetx1,targetx2],[targety1,targety2],'-');hold off
xt=targetx1(1);yt=targety1(1);
theta=atan2(targety2(1)-targety1(1),targetx2(1)-targetx1(1))-pi/2;
theta*180/pi
clear targetx targety xy

ydata = [0:v*dt*100:yt,yt];
ab = inv([yt^3,yt^2;3*yt^2,2*yt])*[xt;tan(-theta)];
xdata = ab(1).*ydata.^3+ab(2).*ydata.^2;

figure(1);plot(xt,yt,'pr',xdata,ydata,':go');
axis equal;
axis([-300,300,-100,500]);grid;
legend('目標ターゲット','地点追従法')

x=0;y=0;theta=0;
D=1;
steering=0;
trajectory=[];
theta=pi/2;
while(y<yt)
	steering = -atan(D*(6*ab(1)*y+2*ab(2))*sin(theta)/((3*ab(1)*y^2+2*ab(2)*y)^2+1));
	theta = theta+dt*v/D*tan(steering);
	x = x + v*dt*cos(theta);
	y = y + v*dt*sin(theta);
	trajectory=[trajectory,[x;y]];
	theta1=theta-pi/2;
	R=[cos(theta1),-sin(theta1);sin(theta1),cos(theta1)];
	newvehi=R*vehi;
	figure(1);
	plot(xt,yt,'pr',xdata,ydata,':go',newvehi(1,:)*10+x,newvehi(2,:)*10+y,trajectory(1,:),trajectory(2,:),':r');
	xlabel('[cm]');ylabel('[cm]');
	axis equal;axis([-300,300,-100,500]);grid;
	drawnow;
end
