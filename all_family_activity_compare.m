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
subplot(3,2,1);
plot(1:4969, result(1,:), 1:4969, result(2,:),1:4969, result(3,:),1:4969, result(4,:),1:4969, result(5,:));
set(get(gca,'XLabel'),'string','Time (hours)','FontSize',15,'FontWeight','b');
set(get(gca,'YLabel'),'string','Number of Unique IPs (log)','FontSize',10,'FontWeight','b');
set(gca,'FontSize',12);
xlim([0 size(time_list,2)+1]);
text(0.02,0.98,['(',char(1+96),')'],'Units', 'Normalized', 'VerticalAlignment', 'Top', 'FontSize', 17, 'FontWeight', 'b');
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
family_list = {'dirtjumper';'conficker';'blackenergy';'optima';'zeus'};
i = 1;
result = [];
time_list = [];
xlabel_list = [];
while i <= 5
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
        count_list(end+1) = count;
        j = j + 1;
    end
    result = [result;count_list];
    i = i + 1;
end

xlabel_list = sort(xlabel_list);
result = log(result);
subplot(3,2,2);
plot(1:208, result(1,:), 1:208, result(2,:),1:208, result(3,:),1:208, result(4,:),1:208, result(5,:));
text(0.02,0.98,['(',char(2+96),')'],'Units', 'Normalized', 'VerticalAlignment', 'Top', 'FontSize', 17, 'FontWeight', 'b');
%bar(cell2mat(freq_list),0.5);
set(get(gca,'XLabel'),'string','Time (days)','FontSize',15,'FontWeight','b');
%set(get(gca,'YLabel'),'string','Number of Unique IPs (log)','FontSize',15,'FontWeight','b');
set(gca,'FontSize',12);
xlim([0 size(time_list,2)+1]);

hL = legend('Dirtjumper','Conficker','Blackenergy','Optima','Zeus');
newPosition = [0.46 0.77 0.1 0.1];
newUnits = 'normalized';
set(hL,'Position', newPosition,'Units', newUnits,'FontSize', 10);

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
subplot(3,2,3);
plot(1:4969, result(1,:), 1:4969, result(2,:),1:4969, result(3,:),1:4969, result(4,:));
text(0.02,0.98,['(',char(3+96),')'],'Units', 'Normalized', 'VerticalAlignment', 'Top', 'FontSize', 17, 'FontWeight', 'b');
%bar(cell2mat(freq_list),0.5);
set(get(gca,'XLabel'),'string','Time (hours)','FontSize',15,'FontWeight','b');
set(get(gca,'YLabel'),'string','Number of Unique IPs (log)','FontSize',10,'FontWeight','b');
set(gca,'FontSize',12);
xlim([0 size(time_list,2)+1]);

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
family_list = {'illusion';'pandora';'nitol';'aldibot'};
i = 1;
result = [];
time_list = [];
xlabel_list = [];
while i <= 4
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
        count_list(end+1) = count;
        j = j + 1;
    end
    result = [result;count_list];
    i = i + 1;
end

xlabel_list = sort(xlabel_list);
result = log(result);
subplot(3,2,4);
plot(1:208, result(1,:), 1:208, result(2,:),1:208, result(3,:),1:208, result(4,:));
%bar(cell2mat(freq_list),0.5);
set(get(gca,'XLabel'),'string','Time (days)','FontSize',15,'FontWeight','b');
%set(get(gca,'YLabel'),'string','Number of Unique IPs (log)','FontSize',15,'FontWeight','b');
set(gca,'FontSize',12);
xlim([0 size(time_list,2)+1]);
text(0.02,0.98,['(',char(4+96),')'],'Units', 'Normalized', 'VerticalAlignment', 'Top', 'FontSize', 17, 'FontWeight', 'b');

hL = legend('Illusion','Pandora','Nitol','Aldibot');
newPosition = [0.46 0.47 0.1 0.1];
newUnits = 'normalized';
set(hL,'Position', newPosition,'Units', newUnits, 'FontSize', 10);

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
subplot(3,2,5);
plot(1:4969, result(1,:), 1:4969, result(2,:),1:4969, result(3,:),1:4969, result(4,:),1:4969, result(5,:), 1:4969, result(6,:), 1:4969, result(7,:));
%bar(cell2mat(freq_list),0.5);
set(get(gca,'XLabel'),'string','Time (hours)','FontSize',15,'FontWeight','b');
set(get(gca,'YLabel'),'string','Number of Unique IPs (log)','FontSize',10,'FontWeight','b');
set(gca,'FontSize',12);
xlim([0 size(time_list,2)+1]);
text(0.02,0.98,['(',char(5+96),')'],'Units', 'Normalized', 'VerticalAlignment', 'Top', 'FontSize', 17, 'FontWeight', 'b');

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
        count_list(end+1) = count;
        j = j + 1;
    end
    result = [result;count_list];
    i = i + 1;
end

xlabel_list = sort(xlabel_list);
result = log(result);
subplot(3,2,6);
plot(1:208, result(1,:), 1:208, result(2,:),1:208, result(3,:),1:208, result(4,:),1:208, result(5,:),1:208, result(6,:),1:208, result(7,:));
%bar(cell2mat(freq_list),0.5);
set(get(gca,'XLabel'),'string','Time (days)','FontSize',15,'FontWeight','b');
%set(get(gca,'YLabel'),'string','Number of Unique IPs (log)','FontSize',15,'FontWeight','b');
set(gca,'FontSize',12);
xlim([0 size(time_list,2)+1]);
text(0.02,0.98,['(',char(6+96),')'],'Units', 'Normalized', 'VerticalAlignment', 'Top', 'FontSize', 17, 'FontWeight', 'b');

hL = legend('Yzf','Darkshell','Darkcomet','Colddeath','Torpig','Armageddon','Ddoser');
newPosition = [0.455 0.165 0.1 0.1];
newUnits = 'normalized';
set(hL,'Position', newPosition,'Units', newUnits, 'FontSize', 10);
% indices = find(ismember(time_list,'Mon'));

% xlim([0 size(time_list,2)+1]);
xlabell = xlabel_list(1:round(size(xlabel_list,2)/4):size(xlabel_list,2));
% xlabell = time_list(indices);
% disp(xlabell);
xlabell{1,size(xlabell,2)+1} = xlabel_list{1,size(xlabel_list,2)};

set(gca,'Xtick',0:max(get(gca,'XLim'))/4:max(get(gca,'XLim')),'XTickLabel',xlabell);
% set(gca,'Xtick',indices,'XTickLabel',xlabell);

set(hFig,'PaperSize',[15,8],'PaperPosition',[-1 0 15 8]);

grid on;
output_path = strcat(src_path,'all_family_activity_compare_botnet_size.eps');
saveas(hFig,output_path,'epsc');