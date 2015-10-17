function all_family_activity_hours()
src_path = '/Users/wentaochang/Documents/BARS_Analysis/FamilyActivity/';
family_list = {'aldibot';'armageddon';'blackenergy';'colddeath';'conficker';'darkcomet';'darkshell';'ddoser';'dirtjumper';'illusion';'nitol';'optima';'pandora';'torpig';'yzf';'zeus'};
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

xlabel_list = sort(xlabel_list);
hFig = figure('visible','on');
result = log(result);
%plot(1:208, result(1,:), 1:208, result(6,:),1:208, result(8,:),1:208, result(13,:),'LineWidth',2);
plot(1:4969, result(1,:), 1:4969, result(2,:),1:4969, result(3,:),1:4969, result(4,:),1:4969, result(5,:),1:4969, result(6,:),1:4969, result(7,:),1:4969, result(8,:),1:4969, result(9,:),1:4969, result(10,:),1:4969, result(11,:),1:4969, result(12,:),1:4969, result(13,:),1:4969, result(14,:),1:4969, result(15,:),1:4969, result(16,:));
%bar(cell2mat(freq_list),0.5);
set(get(gca,'XLabel'),'string','Time (days)','FontSize',25,'FontWeight','b');
set(get(gca,'YLabel'),'string','Number of Unique IPs','FontSize',25,'FontWeight','b');
set(gca,'FontSize',18,'FontWeight','b');
xlim([0 size(time_list,2)+1]);
%legend('aldibot','darkcomet','ddoser','pandora');
legend('aldibot','armageddon','blackenergy','colddeath','conficker','darkcomet','darkshell','ddoser','dirtjumper','illusion','nitol','optima','pandora','torpig','yzf','zeus');
% indices = find(ismember(time_list,'Mon'));

% xlim([0 size(time_list,2)+1]);
xlabell = xlabel_list(1:round(size(xlabel_list,2)/7):size(xlabel_list,2));
% xlabell = time_list(indices);
% disp(xlabell);
xlabell{1,size(xlabell,2)+1} = xlabel_list{1,size(xlabel_list,2)};

set(gca,'Xtick',0:max(get(gca,'XLim'))/7:max(get(gca,'XLim')),'XTickLabel',xlabell);
% set(gca,'Xtick',indices,'XTickLabel',xlabell);

set(hFig,'PaperSize',[15,8],'PaperPosition',[-1 0 15 8]);


grid on;
output_path = strcat(src_path,'all_family_activity_hourly.eps');
saveas(hFig,output_path,'epsc');
%print -depsc all_family_freq.eps
end

