function family_activity(family)
src_path = '/Users/wentaochang/Documents/BARS_Analysis/FamilyActivity/';
file_path = strcat(src_path,family,'/',family,'_hourly_activity.txt');
file = fopen(file_path,'r');
g = textscan(file,'%s','delimiter','\n');
record_size = size(g{1},1);
freq_list = [];
time_list = [];
xlabel_list = [];
j = 1;
while j <= record_size
     records = textscan(g{1}{j},'%s','delimiter',' ');
     time = strcat(records{1}{1},records{1}{2});
%      time = records{1}{1};
     xlabel_list{1,j} = records{1}{1};
     time_list{1,j} = time;
     frequency = str2num(records{1}{3});
     freq_list{1,j} = frequency;
     j = j + 1;
end

xlabel_list = sort(xlabel_list);
hFig = figure('visible','on');

%bar(cell2mat(freq_list),0.5);
plot(1:4969,cell2mat(freq_list));
set(get(gca,'XLabel'),'string','Time (days)','FontSize',25,'FontWeight','b');
set(get(gca,'YLabel'),'string','Number of Unique IPs','FontSize',25,'FontWeight','b');
set(gca,'FontSize',18,'FontWeight','b');
xlim([0 size(time_list,2)+1]);

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
output_path = strcat(src_path, family,'/',family,'_hourly_activity.eps');
saveas(hFig,output_path,'epsc');
%print -depsc all_family_freq.eps
end



function ind = findindex(array,pattern)
flag = 0;

for i = 1:size(array,2)
    %     if strcmp(array{i},pattern)
    if array(i) == pattern
        ind = i;
        flag = 1;
        break
    end
end
if flag == 0
    ind = -1;
end
end

