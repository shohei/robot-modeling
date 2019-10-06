close all
hani=-pi/2:0.1:pi/2;
[th1,th2] = meshgrid(hani,hani);
tau1=1;tau2=1;l2=1;l3=1;
f3x=(cos(th1+th2)*tau1*l3-tau2*cos(th1+th2)*l3-tau2*cos(th1)*l2)/l3/l2./sin(th2);
f3y=(sin(th1+th2)*tau1*l3-tau2*sin(th1+th2)*l3-tau2*sin(th1)*l2)/l3/l2./sin(th2);
figure
surf(hani*180/pi,hani*180/pi,f3x);zlim([-20,20]);xlabel('\theta_1');ylabel('\theta_2');zlabel('f_{3x}');
shading interp;
figure
surf(hani*180/pi,hani*180/pi,f3y);zlim([-20,20]);xlabel('\theta_1');ylabel('\theta_2');zlabel('f_{3y}');
shading interp;
