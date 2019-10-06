th=0;x=cos(th);y=sin(th);
plot1=plot(x,y,'rp');axis([-2,2,-2,2]);axis square;
ui=uicontrol('style','slider','min',-pi,'max',pi,'value',0);
