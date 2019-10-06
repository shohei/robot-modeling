close all
gmap=mobile1mapsim';
roadwidth=3;
eyeheight=2;viewangle = 2;roadwidth=3;lookahead=3;sensangle=10;
vehi=[0,2;1,1;1,-1;-1,-1;-1,1;0,2;nan,nan;-sensangle,lookahead;sensangle,lookahead]';
theta=atan2(gmap(2,2)-gmap(2,1),gmap(1,2)-gmap(1,1))-pi/2;
R=[cos(theta),-sin(theta);sin(theta),cos(theta)];
newvehi= R*vehi;
Rm=[R',zeros(2);zeros(2),R'];
x=(gmap(1,1)+gmap(3,1))/2;
y=(gmap(2,1)+gmap(4,1))/2;
xyxy=[x;y;x;y];lmap= Rm*(gmap-xyxy(:,ones(1,length(gmap))));
subplot(2,2,1);
plot(gmap([1,3],:)',gmap([2,4],:)');axis equal
hold on;
hnewvehi1=plot(newvehi(1,:)+x,newvehi(2,:)+y,'linewidth',1);hold off
subplot(2,2,2);% vehicle coordinate
hlmap2=plot(lmap([1,3],:)',lmap([2,4],:)');axis equal;
hold on;plot(vehi(1,:),vehi(2,:));hold off;grid;
%%%%%%%%%%%%%%%%%%%%%%%%
eyeheight=2;viewangle = 2;roadwidth=3;
nlmap=lmap;
nlmap([2,4],:)= nlmap([2,4],:).*(nlmap([2,4],:)>0)+0.01;
nlmap([1,3],:)= nlmap([1,3],:)./nlmap([2,4],:);
nlmap([2,4],:)= -eyeheight./nlmap([2,4],:);
subplot(2,2,3);
hlmap3=plot(nlmap([1,3],:)',nlmap([2,4],:)');
set(gca,'xlim',viewangle*roadwidth*[-0.5 0.5],'ylim',[-eyeheight 0]);
for i=2:length(gmap)
	x=(gmap(1,i)+gmap(3,i))/2;
	y=(gmap(2,i)+gmap(4,i))/2;
	theta=atan2(gmap(2,i)-gmap(2,i-1),gmap(1,i)-gmap(1,i-1))-pi/2;
	R=[cos(theta),-sin(theta);sin(theta),cos(theta)];
	newvehi= R*vehi;
	Rm=[R',zeros(2);zeros(2),R'];
	xyxy=[x;y;x;y];lmap= Rm*(gmap-xyxy(:,ones(1,length(gmap))));
%%%%%%%%%%%%%%%%%%%%%%%%%%
	set(hlmap2(1),'xdata',lmap(1,:),'ydata',lmap(2,:));
	set(hlmap2(2),'xdata',lmap(3,:),'ydata',lmap(4,:));
	set(hnewvehi1(1),'xdata',newvehi(1,:)+x,'ydata',newvehi(2,:)+y);
%%%%%%%%%%%%%%
	nlmap=lmap;
	nlmap([2,4],:)= nlmap([2,4],:).*(nlmap([2,4],:)>0)+0.01;
	nlmap([1,3],:)= nlmap([1,3],:)./nlmap([2,4],:);
	nlmap([2,4],:)= -eyeheight./nlmap([2,4],:);
	set(hlmap3(1),'xdata',nlmap(1,:),'ydata',nlmap(2,:));
	set(hlmap3(2),'xdata',nlmap(3,:),'ydata',nlmap(4,:));
	view12=lmap(1:2,:);
	view34=lmap(3:4,:);
	linesens=[-sensangle,sensangle;lookahead,lookahead];
	subplot(2,2,4);plot(view12(1,:),view12(2,:),view34(1,:),view34(2,:),linesens(1,:),linesens(2,:));
	drawnow;pause(0.5);
end
