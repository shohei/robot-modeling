viewagl=[-37.5,30;0,90;90,0;0,0];
for j=1:4
	subplot(2,2,j);
	plot3([2,3],[1,4],[1,2],'linewidth',5);
	grid on;xlabel('x');ylabel('y');zlabel('z');
	axis([0,5,0,5,0,5]);
	view(viewagl(j,:));
end
