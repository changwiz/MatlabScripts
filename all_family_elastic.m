function all_family_elastic()
src_path = '/Users/wentaochang/Documents/BARS_Analysis/FamilyActivity/';
family_list = {'dirtjumper';'conficker';'blackenergy';'optima';'zeus';'illusion';'pandora';'nitol';'aldibot';'yzf';'darkshell';'darkcomet';'colddeath';'torpig';'armageddon'; 'ddoser'};
i = 1;
result = [];
time_list = [];
xlabel_list = [];
while i <= 16
    family = family_list(i);
    file_path = strcat(src_path,family,'/',family,'_hourly_activity.txt');
    file = fopen(file_path{1},'r');
    g = textscan(file,'%s','delimiter','\n');
    record_size = size(g{1},1);
    count_list = [];
    j = 1;
    while j <= record_size
        records = textscan(g{1}{j},'%s','delimiter',' ');
        time = strcat(records{1}{1},records{1}{2});
        %      time = records{1}{1};
        xlabel_list{1,j} = records{1}{1};
        time_list{1,j} = time;
        count = str2num(records{1}{3});
        count_list(end+1) = count;
        j = j + 1;
    end
    result = [result;count_list];
    i = i + 1;
end

display = [];
i = 1;
while i <= 16
    count = max(result(i,:));
    display(end+1) = count;
    i = i + 1;
end
display2 = [];
i = 1;
while i <= 16
    min = display(i);
    j = 1;
    while j <= 4969
        if result(i,j) ~=0 && result(i,j) < min
            min = result(i,j);
        end
    j = j + 1;
    end
    display2(end+1) = min;
    i = i + 1;
end
%base = [12075 171 498925 1859 667523 4019 4886 35 837297 47887 15230 362157 17418 1260 7937 175343];
base = [837297 667523 498925 362157 175343 47887 17418 15230 12075 7937 4886 4019 1859 1260 171 35];
xlabel_list = sort(xlabel_list);
hFig = figure('visible','on');
t = [];
i = 1;
while i <=16
    t(end+1) = log(display(1,i)/display2(1,i));
    i = i +1;
end
bar(t, 0.5);
%set(get(gca,'XLabel'),'string','Botnet Families','FontSize',25,'FontWeight','b');
set(get(gca,'YLabel'),'string','Botnet Elasticity (log)','FontSize',25,'FontWeight','b');
set(gca,'FontSize',20,'FontWeight','b');
xlim([0 17]);
%axis([0 17 0 0.45]);
% indices = find(ismember(time_list,'Mon'));
xlabel = {'Dirtjumper';'Conficker';'Blackenergy';'Optima';'Zeus';'Illusion';'Pandora';'Nitol';'Aldibot';'Yzf';'Darkshell';'Darkcomet';'Colddeath';'Torpig';'Armageddon'; 'Ddoser'};
set(gca,'xtick',1:16);
XTick = get(gca,'XTick');
t = cell(1,size(XTick,2));
for i = 1:size(XTick,2)
   t{1,i} = text(XTick(i),-0.2,xlabel(i),'FontSize',20, 'FontWeight', 'b');
end
set(cell2mat(t),'HorizontalAlignment','right','VerticalAlignment','middle',...
            'Rotation',40);
set(gca,'xticklabel','');
% xlim([0 size(time_list,2)+1]);
%xlabell = xlabel_list(1:round(size(xlabel_list,2)/7):size(xlabel_list,2));
% xlabell = time_list(indices);
% disp(xlabell);
%xlabell{1,size(xlabell,2)+1} = xlabel_list{1,size(xlabel_list,2)};
%set(gca,'Xtick',0:max(get(gca,'XLim')),'XTickLabel',xlabel);
% set(gca,'Xtick',indices,'XTickLabel',xlabell);
%set(gca,'xtick',1:16);
%set(gca,'XTickLabel',xlabel,'FontSize',10);
set(hFig,'PaperSize',[15,9],'PaperPosition',[0 0 15 9]);

p = get(gca,'Position');
set(gca,'Position',[p(1) p(2)+0.1 p(3)-0.1 p(4)-0.2]);

grid on;
output_path = strcat(src_path,'all_family_elasticity.eps');
saveas(hFig,output_path,'epsc');
%print -depsc all_family_freq.eps
end
