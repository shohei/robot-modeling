function y=myatan(y1,x1)
if(nargin==1) 
    y=atan(y1);disp('atan function is called');
    return;
end
y=atan2(y1,x1); disp('atan2 function is called');

