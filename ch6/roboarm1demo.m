clear all;close all
l1=1;l2=1;l3=1;l2g=l2/2;l3g=l3/2;m2=1;m3=1;g=9.8;I2=1;I3=1;tau1=0;tau2=0;
th1=30*pi/180;th2=0*pi/180;dth1=0;dth2=0;
x=[th1;th2;dth1;dth2];
p=[l1;l2;l3;l2g;l3g;m2;m3;I2;I3;g;tau1;tau2];
[t,y]=ode45(@roboarmmodel,[0,10],x,[],p)

for i=1:length(t)
th1=y(i,1);th2=y(i,2);
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
figure(1);
plot(xy(1,:), xy(2,:), 'o-','linewidth',5);
hold on;plot(xyg(1,:), xyg(2,:), 'ro');hold off;
axis equal;axis([-5,5,-5,5]);grid;title(sprintf('%5.2f',t(i)));
%figure(2);
%subplot(3,3,mod(round(i/20),9)+1);
%plot(xy(1,:), xy(2,:), '.-','linewidth',1);
%hold on;plot(xyg(1,:), xyg(2,:), 'r.');hold off;
%axis equal;axis([-3,3,-3,3]);title(t(i));
drawnow;
end
