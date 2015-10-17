function family_bot_distribution_change(family)
PATH = '/Users/wentaochang/Documents/BARS_Analysis/FamilyActivity/';
PATH = strcat(PATH,family,'/',family);
time_list_file = fopen(strcat(PATH,'_bots_daily_time_list.txt'),'r');
time_list = [];
g = textscan(time_list_file,'%s','delimiter','\n');
for i = 1:size(g{1},1)
    time_list{1,i} = g{1}{i};
end
time_size = size(time_list,2);

stat_file = fopen(strcat(PATH,'_bots_daily_distribution.txt'),'r');
stat_data = [];
color_list = [];
g = textscan(stat_file,'%s','delimiter','\n');
bot_size = 0;
for i = 1:size(g{1},1)
    items = textscan(g{1}{i},'%s','delimiter','\t');
    time_index = str2num(items{1}{1});
    bot_index = str2num(items{1}{2});
    if bot_index > bot_size
        bot_size = bot_index;
    end
    color_index = round(bot_index/2000)+1;
    
    color_list = [color_list;color_index];
    stat_data = [stat_data;time_index,bot_index];
end

family1_curve_file = fopen(strcat(PATH,'_bots_daily_activity_curve.txt'),'r');
g = textscan(family1_curve_file,'%s','delimiter','\n');
family1_stat_data = [];
for i = 1:size(g{1},1)
    items = textscan(g{1}{i},'%s','delimiter','\t');
    time_index = str2num(items{1}{1});
    bot_count = str2num(items{1}{2});
    family1_stat_data{1,time_index} = bot_count;
end

group_count = max(color_list) - min(color_list) + 1;

hFig = figure('visible','off');
%for i = 1:group_count
%   data = stat_data(color_list(:,1)==i,:);
%h = scatter(data(:,1),data(:,2),1,[0.75,0.75,0.75],'fill');
%   hold on;
%end
%hold off;

    x = 1:time_size;
    hFig = figure('visible','off'); 
    
    scatter_ploty = @(x, Y)scatter_plot(Y,color_list);
    family_curve = @(x, Y)family_curve_plot(x, family1_stat_data);
    
    [Ax,H1,H2] = plotyy(x,stat_data,x,x,scatter_ploty,family_curve);
    
    axis([0 time_size+1 0 bot_size+50]);
    linkaxes([Ax(1) Ax(2)],'x');
    
    
%h = scatter(stat_data(:,1),stat_data(:,2),1,[0.75,0.75,0.75],'fill');
%axis([0 time_size+1 0 bot_size + 50]);
set(hFig,'PaperSize',[15,8],'PaperPosition',[0 0 15 8]);
box on;
set(gca,'FontSize',15);
set(get(gca,'XLabel'),'string','Time','FontSize',25,'FontWeight','b');
set(get(gca,'YLabel'),'string','Bot Index','FontSize',25,'FontWeight','b');
set(Ax(2),'YColor', [0 0 0]);
xlabell = time_list(1:round(max(get(gca,'XLim'))/6):time_size);
set(Ax(1),'XTick',0:round(max(get(Ax(1),'XLim'))/6):round(max(get(Ax(1),'XLim'))),'XTickLabel',xlabell, 'FontSize', 15);
set(Ax(2),'XTick',0:round(max(get(Ax(2),'XLim'))/6):round(max(get(Ax(2),'XLim'))),'XTickLabel','');
set(Ax(2),'YTick',0:2000:round(max(get(Ax(2),'YLim'))),'FontSize',15);
set(get(Ax(2),'YLabel'),'string','Number of Unique IPs','FontSize',25,'FontWeight','b');
saveas(hFig,strcat(PATH,'_bots_daily_distribution'),'epsc');
end

function h = scatter_plot(stat_data,color_list)
%group_count = max(color_list) - min(color_list) + 1;
%for i = 1:group_count
%data = stat_data(color_list(:,1)==i,:);
h = scatter(stat_data(:,1),stat_data(:,2),1,[0.75,0.75,0.75],'fill');
% hold on;
%end
%     hold off;
end

function h = family_curve_plot(x,f1_stat)
%h = plot(x, log(cell2mat(inter_stat)),'b','LineWidth',2);
%hold on;
h = plot(x, cell2mat(f1_stat),'g','LineWidth',2);
%hold on;
%h = plot(x, log(cell2mat(f2_stat)),'r','LineWidth',2);
end