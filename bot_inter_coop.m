function bot_inter_coop()
OLD_PATH = '/Users/wentaochang/Documents/BARS_Analysis/InterFamily/';
PATH = '/Users/wentaochang/Documents/BARS_Analysis/InterFamily/';
    time_list_file = fopen(strcat(OLD_PATH,'inter_analysis_time.txt'),'r');
    time_list = [];
    g = textscan(time_list_file,'%s','delimiter','\n');
    for i = 1:size(g{1},1)
        time_list{1,i} = g{1}{i};
    end
    time_size = size(time_list,2);
    
    stat_file = fopen(strcat(PATH,'inter_analysis_grouped_3_9_12_optimized.txt'),'r');
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
   
    group_count = max(color_list) - min(color_list) + 1;
    
    hFig = figure('visible','off'); 
    for i = 1:group_count
        data = stat_data(color_list(:,1)==i,:);
        h = scatter(data(:,1),data(:,2),60,'fill');
        hold on;
    end
    hold off;

    axis([0 time_size+1 0 bot_size+50]);
    set(hFig,'PaperSize',[15,8],'PaperPosition',[-3 0 15 8]);
    box on;
    set(gca,'FontSize',15);
    set(get(gca,'XLabel'),'string','Time','FontSize',25,'FontWeight','b');
    set(get(gca,'YLabel'),'string','Subnet Index','FontSize',25,'FontWeight','b');
    
    xlabell = time_list(1:round(max(get(gca,'XLim'))/9):time_size);
%     disp(1:round(max(get(gca,'XLim'))/10):time_size);
    set(gca,'XTick',0:round(max(get(gca,'XLim'))/9):round(max(get(gca,'XLim'))),'XTickLabel',xlabell);
    saveas(hFig,strcat(PATH,'inter_analysis_grouped_3_9_12_optimized.eps'),'epsc');
end