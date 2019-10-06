figure;theta=0:0.1:2*pi;
plot(cos(theta),2*sin(theta));
axis([-3,3,-3,3]);axis equal
[x,y]=ginput(1);
hold on;plot(x,y,'rp');hold off
