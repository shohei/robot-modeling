for i=1:length(ui)
	idx=str2num(get(ui(i),'tag'));
	arm(idx).th=get(ui(i),'value');
end
ind=vectest9findallchildren(arm); 
arm=vectest9kinematics(arm,ind);
plot1=vectest9plot(arm,plot1);
