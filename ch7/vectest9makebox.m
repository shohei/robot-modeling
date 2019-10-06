function xyz = vectest9makebox(l,haba)
x=[0,1,1,0,0];x=[x,x];
y=[0,0,1,1,0];y=[y,y];
z=[zeros(1,5),ones(1,5)];
x=[x,nan,x([2,2]) nan,x([3,3]),nan,x([4,4]),nan];
y=[y,nan,y([2,2]) nan,y([3,3]),nan,y([4,4]),nan];
z=[z,[nan,0,1,nan,0,1,nan,0,1,nan]];
xyz = [x;y;z];
%固有ベクトルにより回転し、軸を合わせる。
[v,d]=eig(l(:)*l(:)');
d=real(sqrt(diag(d)));%長軸の長さ
[val,ind]=max(d);
[row,col]=size(haba);
if(row*col == 2)
	haba=[haba(:);1];
	haba=haba(:,ones(1,length(xyz(1,:))));
end
xyz1=2*(xyz-0.5).*haba;% ±x軸、y軸
xyz1=[xyz1,[0;0;0]];
xyz1(ind,:)=[xyz(ind,:),1]*val;% z軸
%解が２つあるので、どちらが適切な解かを選ぶ
xyz  = v*xyz1;
xyz2 = -v*xyz1;
if sum((l-xyz(:,end)).^2)>sum((l-xyz2(:,end)).^2);xyz=xyz2;end
xyz(:,end)=[];
