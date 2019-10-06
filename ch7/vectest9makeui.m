function ui=vectest9makeui(arm,callbackscript)
uiind=[];
for i=1:length(arm)
	if(sum(arm(i).children==0)) continue;end
	uiind=[uiind,i];
end
for i=1:length(uiind)
	ui(i)=uicontrol('style','slider','max',pi/2,'min',-pi/2);
	val=arm(uiind(i)).th;
	set(ui(i),'value',val,'tag',num2str(uiind(i)));
	set(ui(i),'position',[10,25+20*(i-1),60,20],'callback',callbackscript)
	uicontrol('style','text','position',[70,25+20*(i-1),20,20],'string',num2str(uiind(i)));
end
