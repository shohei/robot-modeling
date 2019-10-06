function [th1e,th2e]=vectest6inv(p3,thesinit)
%デフォルトでは、位置、姿勢とも0から計算
if(nargin == 1) thesinit=[0;0];end
thes=fminsearch(@tmpevalfunc,thesinit,[],p3);
th1e=thes(1);th2e=thes(2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function err=tmpevalfunc(thes,p3)
th1=thes(1);th2=thes(2);
T03=vectest6invsub(th1,th2);
ep3=[r2ath(T03(1:3,1:3));T03(1:3,4)];
err=sum((ep3-p3).^2);
%%%%%%%%%%%%%%%%%%%%%%%%
function T03=vectest6invsub(th1,th2)
l1=3;l2=2;l3=2;%th1=0;th2=0;
l2g=l2/2;l3g=l3/2;
wedge=inline('[0,-az,ay;az,0,-ax;-ay,ax,0]');
vectest6model;
