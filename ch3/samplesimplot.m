num=simout.signals.dimensions;
for i=1:num
    subplot(num,1,i);
    if(isempty(simout.time)) plot(simout.signals.values(:,i));
    else
        plot(simout.time,simout.signals.values(:,i));
        xlabel('[sec]');
    end
    title(['No.',num2str(i)]);
    axis tight
end
