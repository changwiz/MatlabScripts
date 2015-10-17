function all_family_active_pattern()
src_path = '/Users/wentaochang/Documents/BARS_Analysis/FamilyActivity/';
family_list = {'dirtjumper';'conficker';'blackenergy';'optima';'zeus';'illusion';'pandora';'nitol';'aldibot';'yzf';'darkshell';'darkcomet';'colddeath';'torpig';'armageddon'; 'ddoser'};
i = 1;
result = [];
time_list = [];
xlabel_list = [];
while i <= 16
    family = family_list(i);
    file_path = strcat(src_path,family,'/',family,'_activity.txt');
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
        if count ~= 0
            count = i;
        else
            count = log(0);
        end
        count_list(end+1) = count;
        j = j + 1;
    end
    result = [result;count_list];
    i = i + 1;
end

xlabel_list = sort(xlabel_list);
hFig = figure('visible','on');
%plot(1:208, result(1,:), 1:208, result(6,:),1:208, result(8,:),1:208, result(13,:),'LineWidth',2);
plot(1:208, result(1,:), 1:208, result(2,:),1:208, result(3,:),1:208, result(4,:),1:208, result(5,:),1:208, result(6,:),1:208, result(7,:),1:208, result(8,:),1:208, result(9,:),1:208, result(10,:),1:208, result(11,:),1:208, result(12,:),1:208, result(13,:),1:208, result(14,:),1:208, result(15,:),1:208, result(16,:),'LineWidth',2);
%bar(cell2mat(freq_list),0.5);
set(get(gca,'XLabel'),'string','Time (days)','FontSize',25,'FontWeight','b');
%set(get(gca,'YLabel'),'string','Botnet Families','FontSize',25,'FontWeight','b');
set(gca,'FontSize',18,'FontWeight','b');
xlim([0 size(time_list,2)+1]);
ylim([0 17]);
%legend('aldibot','darkcomet','ddoser','pandora');
%legend('dirtjumper','conficker','blackenergy','optima','zeus','illusion','pandora','nitol','aldibot','yzf','darkshell','darkcomet','colddeath','torpig','armageddon', 'ddoser');

% indices = find(ismember(time_list,'Mon'));
% xlim([0 size(time_list,2)+1]);
xlabell = xlabel_list(1:round(size(xlabel_list,2)/7):size(xlabel_list,2));
% xlabell = time_list(indices);
% disp(xlabell);
xlabell{1,size(xlabell,2)+1} = xlabel_list{1,size(xlabel_list,2)};

set(gca,'Xtick',0:max(get(gca,'XLim'))/7:max(get(gca,'XLim')),'XTickLabel',xlabell);
family = {'Dirtjumper';'Conficker';'Blackenergy';'Optima';'Zeus';'Illusion';'Pandora';'Nitol';'Aldibot';'Yzf';'Darkshell';'Darkcomet';'Colddeath';'Torpig';'Armageddon'; 'Ddoser'};
set(gca,'Ytick',1:1:16,'YTickLabel',family);
% set(gca,'Xtick',indices,'XTickLabel',xlabell);

set(hFig,'PaperSize',[15,8],'PaperPosition',[0 0 15 8]);


grid on;
output_path = strcat(src_path,'all_family_active_pattern.eps');
saveas(hFig,output_path,'epsc');
%print -depsc all_family_freq.eps
end

