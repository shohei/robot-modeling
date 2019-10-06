clear all;dt=0.1;
t=0:dt:2*pi ;data=sin(t);
ddata=diff(data)/dt;
cddata=cumsum(ddata)*dt;
subplot(2,2,1);plot(t,data);title('original sin wave')
subplot(2,2,2);plot(t(1:end-1),ddata);
subplot(2,2,3);plot(t(1:end-1),cddata);
