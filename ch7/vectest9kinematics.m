function arm=vectest9kinematics(arm,idx)
wedge=inline('[0,-az,ay;az,0,-ax;-ay,ax,0]');
for i=1:length(arm);arm(i).T=[];arm(i).p=[];arm(i).pg=[];end
[row,col]=size(idx);
for row1=1:row
	for col1=1:col
		i = idx(row1,col1);
		if(i == 0) continue;end
		if ~isempty(arm(i).T) continue;end
		parent=arm(i).parent;
		if(parent == 0) parent_T = eye(4);
		else parent_T = arm(parent).T;end
		arm(i).a = arm(i).a(:)/norm(arm(i).a);
		th=arm(i).a*arm(i).th;
		T = [expm(wedge(th(1),th(2),th(3))),arm(i).l;0,0,0,1];
		arm(i).T = parent_T * T;
		arm(i).p = arm(i).T(1:3,4);
		Tg = [eye(3)  ,arm(i).lg  ;0,0,0,1];
		arm(i).Tg = parent_T * Tg;
		arm(i).pg = arm(i).Tg(1:3,4);
	end
end
