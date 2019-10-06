for i=1:10
l=randn(3,1);
xyz=vectest9makebox(l,0.2);
plot3(xyz(1,:),xyz(2,:),xyz(3,:),[0,l(1)/2,l(1)],[0,l(2)/2,l(2)],[0,l(3)/2,l(3)],'ro-')
axis equal;grid
pause(1);
end
