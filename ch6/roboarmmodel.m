%x=[th1;th2;dth1;dth2];p=[l1;l2;l3;l2g;l3g;m2;m3;I2;I3;g;tau1;tau2];
function dxdt=roboarmmodel(t,x,p)
th1=x(1);th2=x(2);dth1=x(3);dth2=x(4);
l1=p(1);l2=p(2);l3=p(3);l2g=p(4);l3g=p(5);
m2=p(6);m3=p(7);I2=p(8);I3=p(9);
g=p(10);tau1=p(11);tau2=p(12);

M11 =(m2*l2g^2+I2+m3*l3g^2+2*m3*cos(th2)*l3g*l2+m3*l2^2+I3);
M12 =(m3*l3g^2+m3*cos(th2)*l3g*l2+I3);
M21 =(m3*l3g^2+m3*cos(th2)*l3g*l2+I3);
M22 =(m3*l3g^2+I3);
M=[M11,M12;M21,M22];

c1 =-m3*l2*dth2*l3g*sin(th2)*(dth2+2*dth1);
c2 =m3*dth1^2*l2*l3g*sin(th2);
g1 =g*(m2*cos(th1)*l2g+m3*cos(th1+th2)*l3g+m3*cos(th1)*l2);
g2 =m3*g*cos(th1+th2)*l3g;
tmp=inv(M)*([tau1;tau2]-[c1;c2]-[g1;g2]);
ddth1=tmp(1);
ddth2=tmp(2);
dxdt=[dth1;dth2;ddth1;ddth2];
