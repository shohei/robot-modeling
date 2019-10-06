thx=get(ui1,'value');thy=get(ui2,'value');thz=get(ui3,'value');
newvect=Rx(thx)*Ry(thy)*Rz(thz)*vect;
for j=1:4
set(plot11(j),'xdata',newvect(1,:),'ydata',newvect(2,:),'zdata',newvect(3,:));
end
