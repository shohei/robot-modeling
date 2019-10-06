clear all;close all
l1=1;l2=1;l3=1;l2g=l2/2;l3g=l3/2;m2=1;m3=1;g=9.8;I2=1;I3=1;tau1=0;tau2=0;
th1=30*pi/180;th2=0*pi/180;dth1=0;dth2=0;
x=[th1;th2;dth1;dth2];
dt=0.05;
pth1=0;pth2=0;
for t=0:dt:15
if(t > 3)
	tau1 = -(th1-pth1)/dt*1.4;tau2 = -(th2 - pth2)/dt*1.4;
	pth1 = th1;pth2 = th2;
end
p=[l1;l2;l3;l2g;l3g;m2;m3;I2;I3;g;tau1;tau2];
g1=roboarmmodel(t,x,p)*dt;
g2=roboarmmodel(t+dt/2,x+g1/2,p)*dt;
g3=roboarmmodel(t+dt/2,x+g2/2,p)*dt;
g4=roboarmmodel(t+dt,x+g3,p)*dt;
x=x+(g1+2*g2+2*g3+g4)/6;
th1=x(1);th2=x(2);
T01=[cos(th1),-sin(th1),l1;sin(th1),cos(th1),0;0,0,1];
T12=[cos(th2),-sin(th2),l2;sin(th2),cos(th2),0;0,0,1];
T23=[1,0,l3;0,1,0;0,0,1];
xy0=[1,0,0;0,1,0]*T01*[0;0;1];
xy2g=[1,0,0;0,1,0]*T01*[l2g;0;1];
T02=T01*T12;
xy1=[1,0,0;0,1,0]*T02*[0;0;1];
xy3g=[1,0,0;0,1,0]*T02*[l3g;0;1];
T03=T01*T12*T23;
xy2=[1,0,0;0,1,0]*T03*[0;0;1];
xy=[[0;0],xy0,xy1,xy2];
xyg=[xy2g,xy3g];
subplot(4,4,round(t)+1);
plot(xy(1,:), xy(2,:), '.-','linewidth',2);
hold on;plot(xyg(1,:), xyg(2,:), 'ro');hold off;
axis equal;axis([-1,4,-3,1]);grid;title(sprintf('%5.2f',t));
drawnow;
end
