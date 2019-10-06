% hsteering,flag=1 | hspeed,flag=2 | hstep,flag=3
steering=get(hsteering,'value');
v=get(hv,'value');
set(hsteeringtext,'string',[num2str(steering),'deg']);
set(hvtext,'string',[num2str(v),'m/s']);
if(flag == 3)
	theta = theta+v*dt/D*tan(steering*pi/180);
	x = x + v*dt*cos(theta);
	y = y + v*dt*sin(theta);
	trajectory=[trajectory,[x;y]];
end
theta1=theta-pi/2;
R=[cos(theta1),-sin(theta1);sin(theta1),cos(theta1)];
newvehi=R*vehi;
set(hvehi(1),'xdata',newvehi(1,:)+x,'ydata',newvehi(2,:)+y);
set(hvehi(2),'xdata',trajectory(1,:),'ydata',trajectory(2,:));

