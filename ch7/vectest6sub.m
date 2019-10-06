th1=get(ui1,'value');th2=get(ui2,'value');
vectest6model;
for j=1:4
	set(plot11(1,j),'xdata',xy(1,:),'ydata',xy(2,:),'zdata',xy(3,:));
	set(plot11(2,j),'xdata',xyg(1,:),'ydata',xyg(2,:),'zdata',xyg(3,:));
end
