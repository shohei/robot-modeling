for i=1:n;
	T{i}=[expm(wedge(th(i),0,0)),[0;0;l(i)];0,0,0,1];
end
for i=1:n;
	P{i}=eye(4);
	for j=1:i;
		P{i}=P{i}*T{j};
	end;
end
p0=[0;0;0];for i=1:n;p0=[p0,P{i}(1:3,4)];end
pg=[];for i=1:n-1;tmp=P{i}*[0;0;lg(i+1);1];
pg=[pg,tmp(1:3)];end
