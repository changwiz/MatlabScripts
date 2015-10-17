function family_excluding_peak_compare(family)
src_path = '/Users/wentaochang/Documents/BARS_Analysis/FamilyActivity/';
file_path = strcat(src_path,family,'/',family,'_hourly_activity.txt');
file_path1 = strcat(src_path,family,'/',family,'_hourly_activity_excluding_peak.txt');
file = fopen(file_path,'r');
file1 = fopen(file_path1,'r');
g = textscan(file,'%s','delimiter','\n');
record_size = size(g{1},1);
freq_list = [];
freq_list1 = [];
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
     freq_list(end+1) = frequency;
     j = j + 1;
end
j = 1;
g = textscan(file1,'%s','delimiter','\n');
while j <= record_size
     records = textscan(g{1}{j},'%s','delimiter',' ');
     time = strcat(records{1}{1},records{1}{2});
%      time = records{1}{1};
     xlabel_list{1,j} = records{1}{1};
     time_list{1,j} = time;
     frequency = str2num(records{1}{3});
     freq_list1(end+1) = frequency;
     j = j + 1;
end

xlabel_list = sort(xlabel_list);
hFig = figure('visible','on');

%bar(cell2mat(freq_list),0.5);
subplot(2,1,1);
plot(1:4969,log(freq_list));
title('Include all bots','FontSize', 25,'FontWeight','b');
set(gca,'FontSize',18,'FontWeight','b');
set(get(gca,'YLabel'),'string','Number of Unique IPs (log)','FontSize',16,'FontWeight','b');
xlim([0 size(time_list,2)+1]);
text(0.02,0.98,['(',char(1+96),')'],'Units', 'Normalized', 'VerticalAlignment', 'Top', 'FontSize', 17, 'FontWeight', 'b');
% indices = find(ismember(time_list,'Mon'));

% xlim([0 size(time_list,2)+1]);
xlabell = xlabel_list(1:round(size(xlabel_list,2)/7):size(xlabel_list,2));
% xlabell = time_list(indices);
% disp(xlabell);
xlabell{1,size(xlabell,2)+1} = xlabel_list{1,size(xlabel_list,2)};

set(gca,'Xtick',0:max(get(gca,'XLim'))/7:max(get(gca,'XLim')),'XTickLabel',xlabell);
% set(gca,'Xtick',indices,'XTickLabel',xlabell);

subplot(2,1,2);
plot(1:4969,log(freq_list1));
title('Exclude bots from known active campaigns','FontSize', 25,'FontWeight','b');
set(get(gca,'XLabel'),'string','Time (days)','FontSize',25,'FontWeight','b');
set(get(gca,'YLabel'),'string','Number of Unique IPs (log)','FontSize',16,'FontWeight','b');
set(gca,'FontSize',18,'FontWeight','b');
xlim([0 size(time_list,2)+1]);
text(0.02,0.98,['(',char(2+96),')'],'Units', 'Normalized', 'VerticalAlignment', 'Top', 'FontSize', 17, 'FontWeight', 'b');
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
output_path = strcat(src_path, family,'/',family,'_activity_comparison.eps');
saveas(hFig,output_path,'epsc');
%print -depsc all_family_freq.eps
end