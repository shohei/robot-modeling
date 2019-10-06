function plot1=vectest9plot(arm,plot1)
ind=vectest9findallchildren(arm);
[row,col]=size(ind);
viewagl=[-37.5 30;0 90;90 0;0 0];
if(isempty(plot1))
	for row1=1:row
		p0=[0;0;0];pg=[];
		for col1=1:col;
			if(ind(row1,col1)==0) continue;end
			p0=[p0,arm(ind(row1,col1)).p(:)];
			pg=[pg,arm(ind(row1,col1)).pg];
		end
		for j=1:4;
			subplot(2,2,j);
			hold on;
			plot1(1,row1,j)=plot3(p0(1,:),p0(2,:),p0(3,:),'o-','linewidth',3);
			plot1(2,row1,j)=plot3(pg(1,:),pg(2,:),pg(3,:),'ro','markersize',5);
			hold off;
			axis equal;grid;xlabel('x');ylabel('y');zlabel('z');
			axis([-5,5,-5,5,0,10]);
			view(viewagl(j,:));
		end
	end
else
	for row1=1:row
		p0=[0;0;0];pg=[];
		for col1=1:col
			if(ind(row1,col1)==0) continue;end
			p0=[p0,arm(ind(row1,col1)).p(:)];
			pg=[pg,arm(ind(row1,col1)).pg];
		end
		for j=1:4
			set(plot1(1,row1,j),'xdata',p0(1,:),'ydata',p0(2,:),'zdata',p0(3,:));
			set(plot1(2,row1,j),'xdata',pg(1,:),'ydata',pg(2,:),'zdata',pg(3,:));
		end
	end
end
