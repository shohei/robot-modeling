% usage : R=ATH2R(A,TH);
%         R=ATH2R(ATH);
% A[3x1] unit vector
% TH     angle
% ATH    W*TH
function R=ath2r(a,th)
if(nargin == 1) ath=a;
else a=a/norm(a);ath=a*th;end
athx=[0,-ath(3),ath(2);ath(3),0,-ath(1);-ath(2),ath(1),0];
R=expm(athx);
