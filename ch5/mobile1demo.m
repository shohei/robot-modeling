close all
gmap=mobile1mapsim;gmap=gmap';
plot(gmap([1,3],:)',gmap([2,4],:)');
axis equal;axis([-5,90,-5,90]);
vehi=[0,1,1,-1,-1,0;2,1,-1,-1,1,2];
hold on;plot(vehi(1,:),vehi(2,:));hold off
[x,y]=ginput(1);hold on;plot(x,y,'p');hold off
[x1,y1]=ginput(1);hold on;plot([x,x1],[y,y1]);hold off;
theta=atan2(y1-y,x1-x)-pi/2;
R=[cos(theta),-sin(theta);sin(theta),cos(theta)];
newvehi=R*vehi;
hold on;plot(newvehi(1,:)+x,newvehi(2,:)+y);hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rm=[R',zeros(2,2);zeros(2),R'];
xyxy=[x;y;x;y];lmap= Rm*(gmap-xyxy(:,ones(1,length(gmap))));
figure;plot(lmap([1,3],:)',lmap([2,4],:)');grid
axis equal;axis([-50,50,-5,90])
hold on;plot(vehi(1,:),vehi(2,:));hold off
