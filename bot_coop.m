function bot_coop()
    
    root_dir_path = './intra_family_collaboration/';
    root_dir = dir(root_dir_path);
    dir_names = {root_dir.name};
    for i = 1:size(dir_names,2)
        if ~strcmp(dir_names{i},'.') && ~strcmp(dir_names{i},'..')
            family = dir_names{i};
            family_dir_path = strcat(root_dir_path,dir_names{i});
            family_bot_file = strcat(family_dir_path,'/',family,'_bot_list.txt');
            family_ip_file = strcat(family_dir_path,'/',family,'_ip_list.txt');
            family_time_file = strcat(family_dir_path,'/',family,'_time_list.txt');
            family_stat_file = strcat(family_dir_path,'/',family,'_stat.txt');

            bot_file = fopen(family_bot_file,'r');
            bot_list = [];
            g = textscan(bot_file,'%s','delimiter','\n');
            for j = 1:size(g{1},1)
                bot_list{1,j} = g{1}{j};
            end
            bot_size = size(bot_list,2);
            ip_file = fopen(family_ip_file,'r');
            ip_list = [];
            g = textscan(ip_file,'%s','delimiter','\n');
            for j = 1:size(g{1},1)
                ip_list{1,j} = g{1}{j};
            end
            ip_size = size(ip_list,2);
            time_file = fopen(family_time_file,'r');
            time_list = [];
            g = textscan(time_file,'%s','delimiter','\n');
            for j = 1:size(g{1},1)
                time_list{1,j} = g{1}{j};
            end
            time_size = size(time_list,2);
            stat_dict = [];
            stat_file = fopen(family_stat_file,'r');
            g = textscan(stat_file,'%s','delimiter','\n');
            for j = 1:size(g{1},1)
                items = textscan(g{1}{j},'%s','delimiter',' ');
                bot_index = str2num(items{1}{1});
                time_index = str2num(items{1}{2});
                ip_index = str2num(items{1}{3});
                stat_dict = [stat_dict;bot_index,time_index,ip_index];
            end
           
            hFig = figure('visible','off'); 
            for j = 1:size(ip_list,2)
                data = stat_dict(stat_dict(:,3)==j,:);
                h = scatter3(data(:,1),data(:,2),data(:,3),60,'fill','MarkerEdgeColor','k');
                hold on;
            end
            hold on;
     
            axis([0 bot_size+1 0 time_size+1  0 ip_size+1]);
            pbaspect([7 20 8]);
            view([-113,10]);
            box on;
            set(hFig,'PaperSize',[15,8],'PaperPosition',[-3 0 15 8]);
            
            set(gca,'FontSize',18);
            set(get(gca,'XLabel'),'string','Botnet Id','FontSize',20,'FontWeight','b');
            set(get(gca,'YLabel'),'string','Time','FontSize',20,'FontWeight','b');
            set(get(gca,'ZLabel'),'string','Bot','FontSize',20,'FontWeight','b');
            
            ylabell = time_list(1:round(max(get(gca,'YLim'))/10):time_size);
            set(gca,'YTick',0:round(max(get(gca,'YLim'))/10):round(max(get(gca,'YLim'))),'YTickLabel',ylabell);
%             YTick = get(gca,'YTick');
%             t = cell(1,size(YTick,2));
%             
%             for j = 1:size(YTick,2)
%                 t{1,j} = text(-0.1,YTick(j),-0.1,time_list(j),'FontSize',18,'FontWeight','b');
%             end
%             set(cell2mat(t),'HorizontalAlignment','right','VerticalAlignment','middle',...
%                 'Rotation',90);
% 
%             set(gca,'YTickLabel','');
% 

            saveas(hFig,sprintf('./intra_family_collaboration_figs/%s.eps',family),'epsc');
        end
    end
end