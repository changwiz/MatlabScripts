function reoccur_table(family)
src_path = '/Users/wentaochang/Documents/BARS_Analysis/IPSetComparison/';
file_path = strcat(src_path,family,'/',family,'_IP_reuse.txt');
file = fopen(file_path,'r');
g = textscan(file,'%s','delimiter','\n');
record_size = size(g{1},1);
data = [];
j = 1;
while j <= record_size
     records = textscan(g{1}{j},'%s','delimiter','\t');
     cols_size = size(records{1},1);
     k = 1;
     while k <= cols_size
         data{j,k} = records{1}{k};
         k = k + 1;
     end
     j = j + 1;
end

j = 1;
result = [];
while j <=29 
    t = data(1,j);
    result(end+1)= str2num(cell2mat(t));
    j = j + 1;
end
hFig = figure('visible','on');
plot(result);
%bar(cell2mat(freq_list),0.5);
set(get(gca,'XLabel'),'string','Period (weeks)','FontSize',25,'FontWeight','b');
set(get(gca,'YLabel'),'string','Number of Unique IPs','FontSize',25,'FontWeight','b');
set(gca,'FontSize',18,'FontWeight','b');
%xlim([0 size(time_list,2)+1]);

% indices = find(ismember(time_list,'Mon'));

% xlim([0 size(time_list,2)+1]);
%xlabell = xlabel_list(1:round(size(xlabel_list,2)/7):size(xlabel_list,2));
% xlabell = time_list(indices);
% disp(xlabell);
%xlabell{1,size(xlabell,2)+1} = xlabel_list{1,size(xlabel_list,2)};

%set(gca,'Xtick',0:max(get(gca,'XLim'))/7:max(get(gca,'XLim')),'XTickLabel',xlabell);
% set(gca,'Xtick',indices,'XTickLabel',xlabell);

set(hFig,'PaperSize',[15,8],'PaperPosition',[-1 0 15 8]);


grid on;
output_path = strcat(src_path, family,'/',family,'_table.eps');
saveas(hFig,output_path,'epsc');
%print -depsc all_family_freq.eps
end


