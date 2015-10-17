function attack_dist()

listdir = dir('./attack_dist/*');
dir_path = './attack_dist/'
listing = {listdir.name};
family_list = [];


k = 0;
hFig = figure('visible','off');
for count = 1:size(listing,2)
    if strncmp(listing{count},'.',1) ~= 1
        k = k + 1;
        stat = [];
        country_list = [];
        family = listing{count}(1:size(listing{count},2)-4);

        file = fopen(strcat(dir_path,listing{count}),'r');
        g = textscan(file,'%s','delimiter','\n');
        record_size = size(g{1},1);
        j = 1;
        max_count = 0;
        while j <= record_size
            items = textscan(g{1}{j},'%s','delimiter',' ');
            country = items{1}{1};
            if strcmp(country,'***') ~= 1
                count = str2num(items{1}{2});
                if ~ismember(country,country_list)
                    row = size(country_list,2)+1;
                    country_list{1,row} = country;
                    stat{1,row} = count;
                else
                   
                    row = findindex(country_list,country);
                    stat{1,row} = stat{1,row} + count;
                end
                if stat{1,row} > max_count
                    max_count = stat{1,row};
                end
            end
            j = j + 1;
            if j <= record_size
                items = textscan(g{1}{j},'%s','delimiter',' ');
            end
        end
%               disp(k);
        subplot(4,3,k);
        h = plot(cell2mat(stat),'LineWidth',3); 
        title(sprintf('%s',family),'FontSize',15,'FontWeight','b');
        
        
%         max_value = max(get(gca,'xlim'));
        x = 0:1:size(country_list,2);
        xlim([0 size(country_list,2)+1]);
        set(gca,'XTick',x);
        ylim([0 max_count+1]);
       
        XTick = get(gca,'XTick');
        t = cell(1,size(XTick,2));
        
        for i = 1:size(XTick,2)-1
            t{1,i} = text(XTick(i+1),-0.1,country_list(i),'FontSize',8);
        end
        

        set(cell2mat(t),'HorizontalAlignment','right','VerticalAlignment','middle',...
            'Rotation',90);
        set(gca,'FontSize',15,'FontWeight','b');
        set(gca,'xticklabel','');
    end
            
end
    
    
    set(hFig,'PaperSize',[15,8],'PaperPosition',[-1 0 15 8]);
%     legend1 = legend(family_list);
%     set(legend1,'FontSize',15,'Location','NorthEast');
%     set(gca,'XTick',x);
% %     set(gca,'XLim',[0, size(x)+1]);
%     t = text(x,-4*ones(1,length(x)),country_list,'FontSize',15);
%     set(t,'HorizontalAlignment','right','VerticalAlignment','top',...
%             'Rotation',45);
%     set(gca,'xticklabel','');
%     set(gca,'FontSize',15)
%     set(gca,'xlim',[1,size(x,2)+1]);
%     vec_pos = get(get(gca, 'XLabel'), 'Position');
%     set(get(gca,'XLabel'),'string','Country Code','FontSize',20,'FontWeight','b','Position',vec_pos + [0 -50 0]);
%     set(get(gca,'YLabel'),'string','Number of Attacks','FontSize',20,'FontWeight','b');
    saveas(hFig,'new_all_dist.eps','epsc');
end


function ind = findindex(array,pattern)
flag = 0;

for i = 1:size(array,2)
    if strcmp(array{i},pattern)
        ind = i;
        flag = 1;
        break
    end
end
if flag == 0
    ind = -1;
end
end
