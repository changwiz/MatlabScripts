src_path = '/Users/wentaochang/Documents/BARS_Analysis/FamilyActivity/';
family_list = {'dirtjumper';'conficker';'blackenergy';'optima';'zeus'};
i = 1;
result = [];
time_list = [];
xlabel_list = [];
while i <= 5
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
subplot(3,1,1);
plot(1:4969, result(1,:), 1:4969, result(2,:),1:4969, result(3,:),1:4969, result(4,:),1:4969, result(5,:));
set(get(gca,'XLabel'),'string','Time (hours)','FontSize',15,'FontWeight','b');
set(get(gca,'YLabel'),'string','Unique IPs (log)','FontSize',10,'FontWeight','b');
set(gca,'FontSize',12);
xlim([0 size(time_list,2)+1]);
%text(0.02,0.98,['(',char(1+96),')'],'Units', 'Normalized', 'VerticalAlignment', 'Top', 'FontSize', 17, 'FontWeight', 'b');
% indices = find(ismember(time_list,'Mon'));
lhandle = legend('Dirtjumper','Conficker','Blackenergy','Optima','Zeus');

% reduce the lenght of the X-axis (by 10%)
pos = get(gca,'Position');
pos(3)=.8*pos(3);
set(gca,'Position',pos);

% move the location of the legend by 115%
pos = get(lhandle,'Position');
pos(1) = 1.39*pos(1);
set(lhandle,'Position',pos, 'FontSize', 10);

% xlim([0 size(time_list,2)+1]);
xlabell = xlabel_list(1:round(size(xlabel_list,2)/4):size(xlabel_list,2));
% xlabell = time_list(indices);
% disp(xlabell);
xlabell{1,size(xlabell,2)+1} = xlabel_list{1,size(xlabel_list,2)};

set(gca,'Xtick',0:max(get(gca,'XLim'))/4:max(get(gca,'XLim')),'XTickLabel',xlabell);
% set(gca,'Xtick',indices,'XTickLabel',xlabell);
grid on;

src_path = '/Users/wentaochang/Documents/BARS_Analysis/FamilyActivity/';
family_list = {'illusion';'pandora';'nitol';'aldibot'};
i = 1;
result = [];
time_list = [];
xlabel_list = [];
while i <= 4
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
result = log(result);
subplot(3,1,2);
plot(1:4969, result(1,:), 1:4969, result(2,:),1:4969, result(3,:),1:4969, result(4,:));
%text(0.02,0.98,['(',char(3+96),')'],'Units', 'Normalized', 'VerticalAlignment', 'Top', 'FontSize', 17, 'FontWeight', 'b');
%bar(cell2mat(freq_list),0.5);
set(get(gca,'XLabel'),'string','Time (hours)','FontSize',15,'FontWeight','b');
set(get(gca,'YLabel'),'string','Unique IPs (log)','FontSize',10,'FontWeight','b');
set(gca,'FontSize',12);
xlim([0 size(time_list,2)+1]);
lhandle = legend('Illusion','Pandora','Nitol','Aldibot');
% reduce the lenght of the X-axis (by 10%)
pos = get(gca,'Position');
pos(3)=.8*pos(3);
set(gca,'Position',pos);

% move the location of the legend by 115%
pos = get(lhandle,'Position');
pos(1) = 1.3*pos(1);
set(lhandle,'Position',pos, 'FontSize', 10);
% indices = find(ismember(time_list,'Mon'));

% xlim([0 size(time_list,2)+1]);
xlabell = xlabel_list(1:round(size(xlabel_list,2)/4):size(xlabel_list,2));
% xlabell = time_list(indices);
% disp(xlabell);
xlabell{1,size(xlabell,2)+1} = xlabel_list{1,size(xlabel_list,2)};

set(gca,'Xtick',0:max(get(gca,'XLim'))/4:max(get(gca,'XLim')),'XTickLabel',xlabell);
% set(gca,'Xtick',indices,'XTickLabel',xlabell);
grid on;

src_path = '/Users/wentaochang/Documents/BARS_Analysis/FamilyActivity/';
family_list = {'yzf';'darkshell';'darkcomet';'colddeath';'torpig';'armageddon';'ddoser'};
i = 1;
result = [];
time_list = [];
xlabel_list = [];
while i <= 7
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
result = log(result);
subplot(3,1,3);
plot(1:4969, result(1,:), 1:4969, result(2,:),1:4969, result(3,:),1:4969, result(4,:),1:4969, result(5,:), 1:4969, result(6,:), 1:4969, result(7,:));
%bar(cell2mat(freq_list),0.5);
set(get(gca,'XLabel'),'string','Time (hours)','FontSize',15,'FontWeight','b');
set(get(gca,'YLabel'),'string','Unique IPs (log)','FontSize',10,'FontWeight','b');
set(gca,'FontSize',12);
xlim([0 size(time_list,2)+1]);
%text(0.02,0.98,['(',char(5+96),')'],'Units', 'Normalized', 'VerticalAlignment', 'Top', 'FontSize', 17, 'FontWeight', 'b');
lhandle = legend('Yzf','Darkshell','Darkcomet','Colddeath','Torpig','Armageddon','Ddoser');

% reduce the lenght of the X-axis (by 10%)
pos = get(gca,'Position');
pos(3)=.8*pos(3);
set(gca,'Position',pos);

% move the location of the legend by 115%
pos = get(lhandle,'Position');
pos(1) = 1.41*pos(1);
pos(2) = 3.0*pos(2);
set(lhandle,'Position',pos, 'FontSize', 7);


% indices = find(ismember(time_list,'Mon'));

% xlim([0 size(time_list,2)+1]);
xlabell = xlabel_list(1:round(size(xlabel_list,2)/4):size(xlabel_list,2));
% xlabell = time_list(indices);
% disp(xlabell);
xlabell{1,size(xlabell,2)+1} = xlabel_list{1,size(xlabel_list,2)};

set(gca,'Xtick',0:max(get(gca,'XLim'))/4:max(get(gca,'XLim')),'XTickLabel',xlabell);
% set(gca,'Xtick',indices,'XTickLabel',xlabell);
grid on;
pos=get(hFig,'Position');
set(hFig,'Position',[0 0 pos(3) pos(4)+150]);
output_path = strcat(src_path,'all_family_activity_compare_hourly.eps');
saveas(hFig,output_path,'epsc');