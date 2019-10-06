gmap=mobile1mapsim';
x=mean(gmap([1,3],1));y=mean(gmap([2,4],1));
theta=atan2(gmap(2,2)-gmap(2,1),gmap(1,2)-gmap(1,1));
v=1;steering=0;dt=1;
vehi=[0,1,1,-1,-1,0;2,1,-1,-1,1,2];
D=.5;
theta1=theta-pi/2;
R=[cos(theta1),-sin(theta1);sin(theta1),cos(theta1)];
newvehi=R*vehi;
trajectory=[x;y];
subplot(2,2,1);
hvehi=plot(newvehi(1,:)+x,newvehi(2,:)+y,trajectory(1,:),trajectory(2,:),'r:');
hold on;plot(gmap([1,3],:)',gmap([2,4],:)');hold off
axis([-30+x,30+x,-10+y,50+y]);axis square;
Rm=[R',zeros(2,2);zeros(2),R'];
xyxy=[x;y;x;y];lmap= Rm*(gmap-xyxy(:,ones(1,length(gmap))));
subplot(2,2,2);
hlmap=plot(lmap([1,3],:)',lmap([2,4],:)');grid
axis equal;axis([-50,50,-5,90])
hold on;plot(vehi(1,:),vehi(2,:));hold off
hsteering=uicontrol('style','slider','max',90,'min',-90,'value',steering);
hv=uicontrol('style','slider','max',1,'min',0,'value',v);
set(hv,'position',[20,60,60,20]);
hsteeringtext=uicontrol('style','text','string',[num2str(steering),'deg'],'position',[20,40,60,15]);
hvtext=uicontrol('style','text','string',[num2str(v),'m/s'],'position',[20,80,60,15]);
hstep=uicontrol('position',[20,100,60,20],'string',[,num2str(dt),'s/push']);
set(hsteering,'callback','flag=1;mobile2sub;');
set(hv,'callback','flag=2;mobile2sub;');
set(hstep,'callback','flag=3;mobile2sub;');

