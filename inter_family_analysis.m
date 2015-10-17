function inter_family_analysis()
PATH = '/Users/wentaochang/Documents/BARS_Analysis/InterFamily/';
family_file = strcat(PATH,'inter_analysis_family.txt');
time_file = strcat(PATH,'inter_analysis_time.txt');
%duration_file = strcat('./',family,'_duration_stat.txt');
volume_file = strcat(PATH,'inter_analysis_translate.txt');
family_ip_file = strcat(PATH,'inter_analysis_concurrent_bot.txt');

ffile = fopen(family_file,'r');
tfile = fopen(time_file,'r');
%dfile = fopen(duration_file,'r');
vfile = fopen(volume_file,'r');

family_list = [];
g = textscan(ffile,'%s','delimiter','\n');
family_size = size(g{1},1);
for i = 1:family_size
    family_list{1,i} = g{1}{i};
end

time_list = [];
g = textscan(tfile,'%s','delimiter','\n');
time_size = size(g{1},1);
for i = 1:time_size
    time_list{1,i} = g{1}{i};
end

ip_file = fopen(family_ip_file,'r');
ip_list = [];
g = textscan(ip_file,'%s','delimiter','\n');
for j = 1:size(g{1},1)
    ip_list{1,j} = g{1}{j};
end
ip_size = size(ip_list,2);
%duration_stat = [];
%g = textscan(dfile,'%s','delimiter','\n');
%duration_size = size(g{1},1);
%x_list = [];
%y_list = [];
%z_list = [];
%for i = 1:duration_size
%    items = textscan(g{1}{i},'%s','delimiter',' ');
%    row = str2num(items{1}{1});
%    column = str2num(items{1}{2});
%    duration = str2num(items{1}{3});
%    duration_stat{row, column} = duration;


%end

volume_stat = [];
g = textscan(vfile,'%s','delimiter','\n');
volume_size = size(g{1},1);
for i = 1:volume_size
    items = textscan(g{1}{i},'%s','delimiter','\t');
    time_index = str2num(items{1}{1});
    family_index = str2num(items{1}{2});
    ip_index = str2num(items{1}{3});
    volume_stat = [volume_stat;family_index,time_index,ip_index];
end

hFig = figure('visible','off');
for j = 1:size(ip_list,2)
    data = volume_stat(volume_stat(:,3)==j,:);
    h = scatter3(data(:,1),data(:,2),data(:,3),60,'fill','MarkerEdgeColor','k');
    hold on;
end
hold on;

axis([0 family_size+1 0 time_size+1  0 ip_size+1]);
pbaspect([7 20 8]);
view([-113,10]);
box on;
set(hFig,'PaperSize',[15,8],'PaperPosition',[-3 0 15 8]);

set(gca,'FontSize',18);
set(get(gca,'XLabel'),'string','Family','FontSize',20,'FontWeight','b');
set(get(gca,'YLabel'),'string','Time','FontSize',20,'FontWeight','b');
set(get(gca,'ZLabel'),'string','Bot','FontSize',20,'FontWeight','b');

ylabell = time_list(1:round(max(get(gca,'YLim'))/10):time_size);
set(gca,'YTick',0:round(max(get(gca,'YLim'))/10):round(max(get(gca,'YLim'))),'YTickLabel',ylabell);
saveas(hFig,strcat(PATH,'inter_analysis.eps'),'epsc');

end