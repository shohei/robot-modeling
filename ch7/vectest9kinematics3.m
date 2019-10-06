function arm=vectest9kinematics3(arm,idx)
wedge=inline('[0,-az,ay;az,0,-ax;-ay,ax,0]');
for i=1:length(arm);
	arm(i).T=[];arm(i).dT=[];arm(i).ddT=[];
	arm(i).Tg=[];arm(i).dTg=[];arm(i).ddTg=[];
	arm(i).V=[];arm(i).A=[];
	arm(i).Vg=[];arm(i).Ag=[];
end
[row,col]=size(idx);
for row1=1:row
	for i=idx(row1,:)
		if(i == 0) continue;end
		if ~isempty(arm(i).T) continue;end
		parent=arm(i).parent;
		if(parent == 0) 
			parent_T   = eye(4);parent_dT  = zeros(4);parent_ddT = zeros(4);
			parent_V   = zeros(4);parent_A   = zeros(4);
		else
			parent_T   = arm(parent).T;parent_dT  = arm(parent).dT;parent_ddT = arm(parent).ddT;
			parent_V   = arm(parent).V;parent_A   = arm(parent).A;
		end
		arm(i).a = arm(i).a(:)/norm(arm(i).a);
		th   = arm(i).a * arm(i).th;
		dth  = arm(i).a * arm(i).dth;
		ddth = arm(i).a * arm(i).ddth;
		w = wedge(dth(1),dth(2),dth(3));
		dw = wedge(ddth(1),ddth(2),ddth(3));
		T = [expm(wedge(th(1),th(2),th(3))),arm(i).l;0,0,0,1];
		V = [w,arm(i).dl - w * arm(i).l;0,0,0,0];
		A = [dw,arm(i).ddl(:) - w * arm(i).dl - dw * arm(i).l;0,0,0,0];
		arm(i).T = parent_T * T;
		arm(i).V = parent_V + parent_T * V * trans(parent_T);
		arm(i).A = parent_A + parent_T * A * trans(parent_T) + parent_V * arm(i).V - arm(i).V * parent_V;
		arm(i).dT = arm(i).V * arm(i).T;
		arm(i).ddT = (arm(i).A + arm(i).V * arm(i).V) * arm(i).T;
		arm(i).p = arm(i).T(1:3,4);
		Tg = [eye(3)  ,arm(i).lg  ;0,0,0,1];
		Vg = [zeros(3),arm(i).dlg ;0,0,0,0];
		Ag = [zeros(3),arm(i).ddlg;0,0,0,0];
		arm(i).Tg = parent_T * Tg;
		arm(i).Vg = parent_V + parent_T * Vg * trans(parent_T);
		arm(i).Ag = parent_A + parent_T * Ag * trans(parent_T) + parent_V * arm(i).Vg - arm(i).Vg * parent_V;
		arm(i).dTg = arm(i).Vg * arm(i).Tg;
		arm(i).ddTg = (arm(i).Ag + arm(i).Vg * arm(i).Vg) * arm(i).Tg;
		arm(i).pg = arm(i).Tg(1:3,4);
	end
end
%MATLABの転置演算子は、同次変換行列の転置に対応していないためtrans関数を副関数として宣言し利用している。
function out=trans(in)
out=in;
out(1:3,1:3)=out(1:3,1:3)';
out(1:3,4)=-out(1:3,1:3)*out(1:3,4);
