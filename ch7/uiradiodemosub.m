switch(flag)
	case 1,set(plot11,'color','b');
	case 2,set(plot11,'color','g');
	case 3,set(plot11,'color','r');
	case 4,set(plot11,'color','c');
	case 5,set(plot11,'color','m');
	case 6,set(plot11,'color','y');
	case 7,set(plot11,'color','k');
end
set(ui,'value',0);
set(ui(flag),'value',1);
