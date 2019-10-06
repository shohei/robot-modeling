close all
vehi=[0,1,1,-1,-1,0;2,1,-1,-1,1,2];
plot(vehi(1,:),vehi(2,:)); axis equal;axis([-10,10,-10,10]); 
[x,y]=ginput(1);
hold on;plot(x,y,'p');hold off
[x1,y1]=ginput(1);
hold on;plot([x,x1],[y,y1]);hold off;
theta=atan2(y1-y,x1-x)-pi/2;
R=[cos(theta),-sin(theta);sin(theta),cos(theta)];
newvehi=R*vehi;
hold on;plot(newvehi(1,:)+x,newvehi(2,:)+y);hold off
