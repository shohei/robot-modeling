function plot1=vectest9plot2(arm,plot1)
ind=vectest9findallchildren(arm);
[row,col]=size(ind);
viewagl=[-37.5 30;0 90;90 0;0 0];
if(isempty(plot1))
	for row1=1:row
		pg=[];pxyz=[];
		for col1=2:col
			if(ind(row1,col1)==0) continue;end
			pg=[pg,arm(ind(row1,col1)).pg(:)];
			i=ind(row1,col1);
			parent=ind(row1,col1-1);
			if(~isempty(arm(i).xyz))
				xyz=arm(parent).T*[arm(i).xyz;ones(size(arm(i).xyz(1,:)))];
				pxyz=[pxyz,[nan;nan;nan;1],xyz];
			end
		end
		for j=1:4
			subplot(2,2,j);
			if(row1 == 1) hold off;end
			hold on
			plot1(1,row1,j)=plot3(pxyz(1,:),pxyz(2,:),pxyz(3,:),'-','linewidth',2);
			plot1(2,row1,j)=plot3(pg(1,:),pg(2,:),pg(3,:),'ro','markersize',5);
			hold off
			axis equal;grid;xlabel('x');ylabel('y');zlabel('z');
			axis([-5,5,-5,5,0,10]);
			view(viewagl(j,:));
		end
	end
else
	for row1=1:row
		pg=[];pxyz=[];
		for col1=2:col
			if(ind(row1,col1)==0) continue;end
			pg=[pg,arm(ind(row1,col1)).pg(:)];
			i=ind(row1,col1);
			parent=ind(row1,col1-1);
			if(~isempty(arm(i).xyz))
				xyz=arm(parent).T*[arm(i).xyz;ones(size(arm(i).xyz(1,:)))];
				pxyz=[pxyz,[nan;nan;nan;1],xyz];
			end
		end
		for j=1:4
			set(plot1(1,row1,j),'xdata',pxyz(1,:),'ydata',pxyz(2,:),'zdata',pxyz(3,:));
			set(plot1(2,row1,j),'xdata',pg(1,:),'ydata',pg(2,:),'zdata',pg(3,:));
		end
	end
end
