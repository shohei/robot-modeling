set(ui1,'value',a(1));
set(ui2,'value',a(2));
set(ui3,'value',a(3));
th=get(ui4,'value');
x=get(ui5,'value');y=get(ui6,'value');z=get(ui7,'value');
%a=a/norm(a);
R=expm([0,-a(3),a(2);a(3),0,-a(1);-a(2),a(1),0]*th);
T=[R,[x;y;z];[0,0,0,1]];
newvehi1=T*vehi1;
for j=1:4
	set(plot11(1,j),'xdata',newvehi1(1,:),'ydata',newvehi1(2,:),'zdata',newvehi1(3,:));
end
