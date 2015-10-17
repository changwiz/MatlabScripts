% Create data for childhood disease cases
src_path = '/Users/wentaochang/Documents/BARS_Analysis/BotsWeeklyPatterns/';

one = [10238 134 380946 1762 570995 3524 4544 30 760802 40662 14672 328533 14150 984 7673 163485];
two = [723 24 99886 67 42306 189 148 0 54505 2989 329 15985 1394 134 185 6421];
three = [205 6 12718 18 9548 41 40 0 5340 1115 92 4671 482 37 41 1904];
four = [81 1 1677 5 4756 33 28 0 2433 669 38 2401 240 17 16 890];
five = [29 1 788 4 2969 9 74 0 1593 526 22 1652 112 10 11 462];
moreFive = [58 6 1480 4 20186 19 37 1 3965 1181 19 4208 368 30 12 1254];
families = {'Aldibot','Armageddon', 'Blackenergy','Colddeath','Conficker','Darkcomet','Darkshell', 'Ddoser','Dirtjumper' ,'Illusion', 'Nitol', 'Optima' ,'Pandora' ,'Torpig', 'Yzf' ,'Zeus'};

% Create a stacked bar chart using the bar function
hFig = figure('visible','on');
bar(1:16, [log(one)' log(two)' log(three)' log(four)' log(five)' log(moreFive)'], 0.5, 'stack');

% Adjust the axis limits
axis([0 17 0 70]);

% Add title and axis labels
%title('Bots structure  per family');
set(gca,'Xtick',1:16, 'XTickLabel',families);
XTick = get(gca,'XTick');
t = cell(1,size(XTick,2));
for i = 1:size(XTick,2)
   t{1,i} = text(XTick(i),-0.2,families(i),'FontSize',20, 'FontWeight', 'b');
end
set(cell2mat(t),'HorizontalAlignment','right','VerticalAlignment','middle',...
            'Rotation',40);
set(gca,'xticklabel','');
% Add a legend
h_legend = legend('1', '2', '3', '4', '5', '6+');
set(h_legend, 'FontSize', 20);
set(hFig,'PaperSize',[15,8],'PaperPosition',[-1 0 15 8]);

%set(get(gca,'XLabel'),'string','Botnet families','FontSize',25,'FontWeight','b');
set(get(gca,'YLabel'),'string','Number of Unique IPs (log)','FontSize',25,'FontWeight','b');
set(gca,'FontSize',10,'FontWeight','b');

p = get(gca,'Position');
set(gca,'Position',[p(1) p(2)+0.1 p(3)-0.1 p(4)-0.2]);

grid on;
output_path = strcat(src_path,'/all_family_bots_occurrence.eps');
saveas(hFig,output_path,'epsc');