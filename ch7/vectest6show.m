function vectest6show(th1,th2)
viewagl=[-37.5,30;0,90;90,0;0,0];
l1=3;l2=2;l3=2;%th1=0;th2=0;
l2g=l2/2;l3g=l3/2;
wedge=inline('[0,-az,ay;az,0,-ax;-ay,ax,0]');
vectest6model;
for j=1:4
	subplot(2,2,j);
	xy=[[0;0;0],xy0(:,1),xy1(:,1),xy2(:,1)];
	plot11(1,j)=plot3(xy(1,:),xy(2,:),xy(3,:),'o-','linewidth',3);
	hold on
	xyg=[xy0(:,2),xy1(:,2)];
	plot11(2,j)=plot3(xyg(1,:),xyg(2,:),xyg(3,:),'ro','markersize',5);
	hold off
	axis equal;grid;xlabel('x');ylabel('y');zlabel('z');
	axis([-5,5,-5,5,0,10]);
	view(viewagl(j,:));
end
