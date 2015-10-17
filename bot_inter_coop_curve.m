function bot_inter_coop_curve(family1, family2)
PATH = '/Users/wentaochang/Documents/BARS_Analysis/InterFamily/';
family_list = {'aldibot';'armageddon';'blackenergy';'colddeath';'conficker';'darkcomet';'darkshell';'ddoser';'dirtjumper';'illusion';'nitol';'optima';'pandora';'torpig';'yzf';'zeus'};
family = {'Aldibot';'Armageddon';'Blackenergy';'Colddeath';'Conficker';'Darkcomet';'Darkshell';'Ddoser';'Dirtjumper';'Illusion';'Nitol';'Optima';'Pandora';'Torpig';'Yzf';'Zeus'};
[m,index_1] = ismember(family1,family_list);
[m,index_2] = ismember(family2,family_list);
dir_path = strcat(PATH,family1,'_',family2, '/');
root_dir = dir(dir_path);
file_prefix = 'inter_analysis_';
%filenames for curve plot
curve_family1_file = strcat(file_prefix,num2str(index_1),'.txt');
curve_family2_file = strcat(file_prefix,num2str(index_2),'.txt');
curve_reuse_file = strcat(file_prefix,num2str(index_1),'_',num2str(index_2),'_reuse.txt');
%filenames for scatter plot
opt_stat_file = strcat(file_prefix,'grouped_',num2str(index_1),'_',num2str(index_2),'_optimized.txt');
ip_prefix_file = strcat(file_prefix,'bot_grouped_',num2str(index_1),'_',num2str(index_2),'_optimized.txt');
time_list_file = strcat(file_prefix,'time.txt');

tlfile = fopen(strcat(PATH,time_list_file),'r');
time_list = [];
g = textscan(tlfile,'%s','delimiter','\n');
for i = 1:size(g{1},1)
    time_list{1,i} = g{1}{i};
end
time_size = size(time_list,2);


stat_file = fopen(strcat(dir_path,opt_stat_file),'r');
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

family1_curve_file = fopen(strcat(dir_path,curve_family1_file),'r');
g = textscan(family1_curve_file,'%s','delimiter','\n');
family1_stat_data = [];
for i = 1:size(g{1},1)
    items = textscan(g{1}{i},'%s','delimiter','\t');
    time_index = str2num(items{1}{1});
    bot_count = str2num(items{1}{2});
    family1_stat_data{1,time_index} = bot_count;
end

family2_curve_file = fopen(strcat(dir_path,curve_family2_file),'r');
g = textscan(family2_curve_file,'%s','delimiter','\n');
family2_stat_data = [];
for i = 1:size(g{1},1)
    items = textscan(g{1}{i},'%s','delimiter','\t');
    time_index = str2num(items{1}{1});
    bot_count = str2num(items{1}{2});
    family2_stat_data{1,time_index} = bot_count;
end

inter_curve_file = fopen(strcat(dir_path,curve_reuse_file),'r');
g = textscan(inter_curve_file,'%s','delimiter','\n');
inter_stat_data = [];
for i = 1:size(g{1},1)
    items = textscan(g{1}{i},'%s','delimiter','\t');
    time_index = str2num(items{1}{1});
    bot_count = str2num(items{1}{2});
    inter_stat_data{1,time_index} = bot_count;
end


x = 1:time_size;
hFig = figure('visible','off');

scatter_ploty = @(x, Y)scatter_plot(Y,color_list);
family_curve = @(x, Y)family_curve_plot(x, inter_stat_data, family1_stat_data,family2_stat_data);

[Ax,H1,H2] = plotyy(x,stat_data,x,x,scatter_ploty,family_curve);

axis([0 time_size+1 0 bot_size+1000]);
linkaxes([Ax(1) Ax(2)],'x');
set(hFig,'PaperSize',[15,8],'PaperPosition',[-3 0 15 8]);
box on;
set(Ax(2),'FontSize',18);
set(get(Ax(2),'XLabel'),'FontSize',25,'FontWeight','b');
%     set(get(Ax(2),'XLabel'),'string','Time','FontSize',20,'FontWeight','b');
xlabel('Time','FontSize',20,'FontWeight','b');
set(get(Ax(1),'YLabel'),'string','Subnet Index','FontSize',20,'FontWeight','b');
set(get(Ax(2),'YLabel'),'string','Bot Count','FontSize',20,'FontWeight','b','Color',[0 0 0]);
set(Ax(2),'YColor', [0 0 0]);
legend(Ax(2), 'Collaboration count',strcat(family{index_1},' total count'),strcat(family{index_2},' total count'));

xlabell = time_list(1:round(max(get(Ax(1),'XLim'))/9):time_size);
set(Ax(1),'XTick',0:round(max(get(Ax(1),'XLim'))/9):round(max(get(Ax(1),'XLim'))),'XTickLabel',xlabell, 'FontSize', 15);
%set(Ax(1),'YTick',0:10000:round(max(get(Ax(1),'YLim'))));
set(Ax(2),'XTick',0:round(max(get(Ax(2),'XLim'))/9):round(max(get(Ax(2),'XLim'))),'XTickLabel','');
set(Ax(2),'YTick',0:5:round(max(get(Ax(2),'YLim'))));

saveas(hFig,strcat(dir_path, family1,'_',family2,'_inter_coop.eps'),'epsc');
end

function h = scatter_plot(stat_data,color_list)
%group_count = max(color_list) - min(color_list) + 1;
%for i = 1:group_count
%data = stat_data(color_list(:,1)==i,:);
h = scatter(stat_data(:,1),stat_data(:,2),60,[0.75,0.75,0.75],'fill');
% hold on;
%end
%     hold off;
end

function h = family_curve_plot(x,inter_stat,f1_stat,f2_stat)
h = plot(x, log(cell2mat(inter_stat)),'b','LineWidth',2);
hold on;
h = plot(x, log(cell2mat(f1_stat)),'g','LineWidth',2);
hold on;
h = plot(x, log(cell2mat(f2_stat)),'r','LineWidth',2);
end