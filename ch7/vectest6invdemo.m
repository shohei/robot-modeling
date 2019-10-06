vectest6demo
t=0:0.1:2*pi;
x=zeros(size(t));
y=cos(t)*0.5;
z=6.5+sin(t)*0.5;
reslt=[];
thesinit=[0;0];
ethes=[];
for i=1:length(t)
	xyz=[x(i);y(i);z(i)];
	[th1e,th2e]=vectest6inv2(xyz,thesinit);
	th1=th1e;th2=th2e;
	thesinit=[th1e;th2e];
	ethes=[ethes,thesinit];
	set(ui1,'value',th1e);set(ui2,'value',th2e);
	vectest6sub;
	reslt=[reslt,T03(1:3,4)];
	for j=1:4
		subplot(2,2,j);
		hold on;
			plot3(reslt(1,:),reslt(2,:),reslt(3,:),'r:','linewidth',1);
		hold off;
	end
	drawnow;
end
figure;
subplot(2,1,1);plot(t,ethes(1,:)*180/pi);title('th1e');ylabel('degree')
subplot(2,1,2);plot(t,ethes(2,:)*180/pi);title('th2e');ylabel('degree')
