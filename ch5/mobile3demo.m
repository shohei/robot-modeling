close all
gmap=mobile1mapsim';
x=mean(gmap([1,3],1));y=mean(gmap([2,4],1));
vehi=[0,1,1,-1,-1,0;2,1,-1,-1,1,2];
theta=atan2(gmap(2,2)-gmap(2,1),gmap(1,2)-gmap(1,1));
theta1=theta-pi/2;
R=[cos(theta1),-sin(theta1);sin(theta1),cos(theta1)];
newvehi= R*vehi;
Rm=[R',zeros(2);zeros(2), R'];
xyxy=[x;y;x;y];lmap= Rm*(gmap-xyxy(:,ones(1,length(gmap))));
subplot(2,2,1);% global coordinate
plot(gmap([1,3],:)',gmap([2,4],:)');
axis equal
hold on;
hnewvehi1=plot(newvehi(1,:)+x,newvehi(2,:)+y);
hold off
subplot(2,2,2);% vehicle coordinate
hlmap2=plot(lmap([1,3],:)',lmap([2,4],:)');
axis equal
hold on;plot(vehi(1,:),vehi(2,:));hold off;grid
for i=2:length(gmap)
  x=(gmap(1,i)+gmap(3,i))/2;
  y=(gmap(2,i)+gmap(4,i))/2;
  theta=atan2(gmap(2,i)-gmap(2,i-1),gmap(1,i)-gmap(1,i-1))-pi/2;
  R=[cos(theta),-sin(theta);sin(theta),cos(theta)];
  newvehi= R*vehi;
Rm=[R',zeros(2);zeros(2),R'];
  xyxy=[x;y;x;y];lmap= Rm*(gmap-xyxy(:,ones(1,length(gmap))));
  set(hlmap2(1),'xdata',lmap(1,:),'ydata',lmap(2,:));
  set(hlmap2(2),'xdata',lmap(3,:),'ydata',lmap(4,:));
  set(hnewvehi1(1),'xdata',newvehi(1,:)+x,'ydata',newvehi(2,:)+y);
  drawnow;pause(0.5);
end
