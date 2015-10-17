function all_family_lifespan()
src_path = '/Users/wentaochang/Documents/BARS_Analysis/IPSetComparison/';
family_list = {'aldibot';'armageddon';'blackenergy';'colddeath';'conficker';'darkcomet';'darkshell';'ddoser';'dirtjumper';'illusion';'nitol';'optima';'pandora';'torpig';'yzf';'zeus'};
i = 1;
result = [];
while i <= 16
    family = family_list(i);
    file_path = strcat(src_path,family,'/',family,'_IP_reuse.txt');
    file = fopen(file_path{1},'r');
    g = textscan(file,'%s','delimiter','\n');
    %record_size = size(g{1},1);
    data = [];
    %j = 1;
    % while j <= record_size
    records = textscan(g{1}{1},'%s','delimiter','\t');
    cols_size = size(records{1},1);
    k = 1;
    while k <= cols_size
        data(end+1) = str2num(records{1}{k});
        k = k + 1;
    end
    %   j = j + 1;
    %end
    result = [result;data];
    i = i + 1;
end

hFig = figure('visible','on');
color_list = hsv(17);
%i = 1;
%while i <= 16
%    h = cdfplot(result(i,:));
%    hold on;
%    set(h,'Color',color_list(i,:), 'LineWidth',2);
%    i = i + 1;
%end
%hold off;
result = log(result);
i =1;
while i<= 16
    plot(1:29,result(i,:), 'Color', color_list(i,:), 'LineWidth',2);
    i = i+1;
    hold on;
end
hold off;
%plot(1:29, result(1,:),'Color', color_list(1,:), 1:29, result(2,:),1:29, result(3,:),1:29, result(4,:),1:29, result(5,:),1:29, result(6,:),1:29, result(7,:),1:29, result(8,:),1:29, result(9,:),1:29, result(10,:),1:29, result(11,:),1:29, result(12,:),1:29, result(13,:),1:29, result(14,:),1:29, result(15,:),1:29, result(16,:),'LineWidth',2);
%bar(cell2mat(freq_list),0.5);
set(get(gca,'XLabel'),'string','Period (weeks)','FontSize',25,'FontWeight','b');
set(get(gca,'YLabel'),'string','Number of Unique IPs (log)','FontSize',25,'FontWeight','b');
set(gca,'FontSize',18,'FontWeight','b');
xlim([0 30]);

% indices = find(ismember(time_list,'Mon'));

% xlim([0 size(time_list,2)+1]);
%xlabell = xlabel_list(1:round(size(xlabel_list,2)/7):size(xlabel_list,2));
% xlabell = time_list(indices);
% disp(xlabell);
%xlabell{1,size(xlabell,2)+1} = xlabel_list{1,size(xlabel_list,2)};

%set(gca,'Xtick',0:max(get(gca,'XLim'))/7:max(get(gca,'XLim')),'XTickLabel',xlabell);
% set(gca,'Xtick',indices,'XTickLabel',xlabell);

set(hFig,'PaperSize',[15,8],'PaperPosition',[-1 0 15 8]);
%legend(= find(ismember(time_list,'Mon'));
legend('Aldibot','Armageddon', 'Blackenergy', 'Colddeath', 'Conficker','Darkcomet', 'Darkshell', 'Ddoser', 'Dirtjumper', 'Illusion', 'Nitol', 'Optima', 'Pandora', 'Torpig', 'Yzf', 'Zeus');

grid on;
output_path = strcat(src_path, 'all_family_lifespan.eps');
saveas(hFig,output_path,'epsc');
%print -depsc all_family_freq.eps
end


