theta=get(ui1,'value');
x=get(ui2,'value');y=get(ui3,'value');
R=[cos(theta),-sin(theta);sin(theta),cos(theta)];
T=[R,[x;y];[0,0,1]];
newvehi1=T*vehi1;
plot(newvehi1(1,:),newvehi1(2,:));
axis equal;axis([-10,10,-10,10]);grid
