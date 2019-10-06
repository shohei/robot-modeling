close all;clear all
xvect=[0,1,1,0,0];yvect=[0,0,1,1,0];zvect=zeros(1,5);
xvect=[xvect,xvect];yvect=[yvect,yvect];zvect=[zvect,ones(1,5)];
xvect=[xvect,nan,1,1,nan,1,1,nan,0,0];
yvect=[yvect,nan,0,0,nan,1,1,nan,1,1];
zvect=[zvect,nan,0,1,nan,0,1,nan,0,1];
vect=[xvect;yvect;zvect];
vect(2,:)=vect(2,:)*2;
vect(3,:)=vect(3,:)/2;
viewagl=[-37.5,30;0,90;90,0;0,0];
a=[0;0;1];
a=a/norm(a);
th=0;
R=expm([0,-a(3),a(2);a(3),0,-a(1);-a(2),a(1),0]*th);
newvect=R*vect;
for j=1:4
	subplot(2,2,j);
	plot11(1,j)=plot3(newvect(1,:),newvect(2,:),newvect(3,:),'linewidth',2);
	hold on
	plot11(2,j)=plot3([-a(1),a(1)],[-a(2),a(2)],[-a(3),a(3)],'r--o','linewidth',2);
	hold off
	axis equal;grid;xlabel('x');ylabel('y');zlabel('z');
	axis([-2,3,-2,3,-2,3]);
	view(viewagl(j,:));
end
drawnow
ui1=uicontrol(1,'style','slider','max',pi,'min',-pi,'value',th);
ui2=uicontrol(1,'style','slider','max',3,'min',-3,'value',a(1));
ui3=uicontrol(1,'style','slider','max',3,'min',-3,'value',a(2));
ui4=uicontrol(1,'style','slider','max',3,'min',-3,'value',a(3));
set(ui1,'position',[10  85 60 20],'callback','vectest2sub');
set(ui2,'position',[10  45 60 20],'callback','vectest2sub');
set(ui3,'position',[10  25 60 20],'callback','vectest2sub');
set(ui4,'position',[10   5 60 20],'callback','vectest2sub');
