for i=1:n-1
	th(i)=get(ui(i),'value');
end
vectest5model;
for j=1:4
	set(plot11(1,j),'xdata',p0(1,:),'ydata',p0(2,:),'zdata',p0(3,:));
	set(plot11(2,j),'xdata',pg(1,:),'ydata',pg(2,:),'zdata',pg(3,:));
end
