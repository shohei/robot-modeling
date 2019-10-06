function linesensind=mobilesim1roadedge(inputs)
persistent hlmap3;
global gmap;
eyeheight=2;viewangle = 2;lookahead=3;sensangle=10;
x=inputs(1);y=inputs(2);theta=inputs(3);
R=[cos(theta),-sin(theta);sin(theta),cos(theta)];
Rm=[R',zeros(2);zeros(2),R'];
xyxy=[x;y;x;y];lmap= Rm*(gmap-xyxy(:,ones(1,length(gmap))));
nlmap=lmap;
nlmap([2,4],:)= nlmap([2,4],:).*(nlmap([2,4],:)>0)+0.01;
nlmap([1,3],:)= nlmap([1,3],:)./nlmap([2,4],:);
nlmap([2,4],:)= -eyeheight./nlmap([2,4],:);
viewmap12=lmap(1:2,:);viewmap34=lmap(3:4,:);
linesens=[-sensangle,sensangle;lookahead,lookahead];
idx=find(abs(viewmap12(1,:))<sensangle);viewmap12=viewmap12(:,idx);
idx=find(abs(viewmap34(1,:))<sensangle);viewmap34=viewmap34(:,idx);
ind=find(viewmap12(2,:)>=lookahead);[mval,mind]=min(viewmap12(2,ind));
cross12=viewmap12(:,ind(mind));
ind=find(viewmap12(2,:)<lookahead);[mval,mind]=max(viewmap12(2,ind));
cross12=[cross12,viewmap12(:,ind(mind))];
ind=find(viewmap34(2,:)>=lookahead);[mval,mind]=min(viewmap34(2,ind));
cross34=viewmap34(:,ind(mind));
ind=find(viewmap34(2,:)<lookahead);[mval,mind]=max(viewmap34(2,ind));
cross34=[cross34,viewmap34(:,ind(mind))];
linesensind=[-100;100];
if(length(cross12(1,:))==2) linesensind(1)=interp1(cross12(2,:),cross12(1,:),lookahead);end
if(length(cross34(1,:))==2) linesensind(2)=interp1(cross34(2,:),cross34(1,:),lookahead);end
viewsensangle=sensangle([1;1])./lookahead([1;1]);
linesensind=linesensind./lookahead([1;1]);
if(isempty(findobj('type','figure'))) hlmap3=[];end
if(isempty(hlmap3))
	hlmap3=plot(nlmap([1,3],:)',nlmap([2,4],:)',linesensind,-[.3,.3],'o');
	set(gca,'xlim',sensangle*[-1;1]./lookahead([1;1]),'ylim',[-eyeheight 0]);
else
	set(hlmap3(1),'xdata',nlmap(1,:),'ydata',nlmap(2,:));
	set(hlmap3(2),'xdata',nlmap(3,:),'ydata',nlmap(4,:));
	set(hlmap3(3),'xdata',linesensind,'ydata',-eyeheight./lookahead([1,1]));
	drawnow;
	pause(0.1);
end
linesensind=linesensind(:);
