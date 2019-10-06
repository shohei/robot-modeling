th=get(ui1,'value');
a(1)=get(ui2,'value');a(2)=get(ui3,'value');a(3)=get(ui4,'value');
a=a/norm(a);
set(ui2,'value',a(1));set(ui3,'value',a(2));set(ui4,'value',a(3));
R=expm([0,-a(3),a(2);a(3),0,-a(1);-a(2),a(1),0]*th);
newvect=R*vect;
for j=1:4
	set(plot11(1,j),'xdata',newvect(1,:),'ydata',newvect(2,:),'zdata',newvect(3,:));
	set(plot11(2,j),'xdata',[-a(1),a(1)],'ydata',[-a(2),a(2)],'zdata',[-a(3),a(3)]);
end
