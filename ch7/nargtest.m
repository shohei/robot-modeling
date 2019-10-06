function [o1,o2,o3,o4,o5,o6]=nargtest(i1,i2,i3,i4,i5,i6)
o1=1;o2=2;o3=3;o4=4;o5=5;o6=6;
disp(['nargin=',num2str(nargin),',nargout=',num2str(nargout)]);
if(nargin > 0) fprintf(' i1=%d',i1);end
if(nargin > 1) fprintf(',i2=%d',i2);end
if(nargin > 2) fprintf(',i3=%d',i3);end
if(nargin > 3) fprintf(',i4=%d',i4);end
if(nargin > 4) fprintf(',i5=%d',i5);end
if(nargin > 5) fprintf(',i6=%d',i6);end
