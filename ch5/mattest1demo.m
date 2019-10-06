for i=1:1000
d=rand(10,1);
for i=1:10000;data0(1,i)=d(1);data0(2,i)=d(2);end
data1=diag(d)*ones(10,10000);
data2=repmat(d,1,10000);
data3=d(:,ones(1,10000));
end
