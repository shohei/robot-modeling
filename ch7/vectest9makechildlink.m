function arm=vectest9makechildlink(arm)
for i=1:length(arm);arm(i).children=[];end
for i=1:length(arm)
	if(arm(i).parent == 0) continue;end
	arm(arm(i).parent).children=[arm(arm(i).parent).children;i];
end
for i=1:length(arm)
	if isempty(arm(i).children) arm(i).children=0;end
end
