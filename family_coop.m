function family_coop(family)

bot_file = strcat('./',family,'_botid_list.txt');
time_file = strcat('./',family,'_time_list.txt');
duration_file = strcat('./',family,'_duration_stat.txt');
volume_file = strcat('./',family,'_volume_stat.txt');

bfile = fopen(bot_file,'r');
tfile = fopen(time_file,'r');
dfile = fopen(duration_file,'r');
vfile = fopen(volume_file,'r');

botid_list = [];
g = textscan(bfile,'%s','delimiter','\n');
botid_size = size(g{1},1);
for i = 1:botid_size
    botid_list{1,i} = g{1}{i};
end

time_list = [];
g = textscan(tfile,'%s','delimiter','\n');
time_size = size(g{1},1);
for i = 1:time_size
    items = textscan(g{1}{i},'%s','delimiter',' ');
    time_list{1,i} = items{1}{1};
end

duration_stat = [];
g = textscan(dfile,'%s','delimiter','\n');
duration_size = size(g{1},1);
x_list = [];
y_list = [];
z_list = [];
for i = 1:duration_size
    items = textscan(g{1}{i},'%s','delimiter',' ');
    row = str2num(items{1}{1});
    column = str2num(items{1}{2});
    duration = str2num(items{1}{3});
    duration_stat{row, column} = duration;
    

end

volume_stat = [];
g = textscan(vfile,'%s','delimiter','\n');
volume_size = size(g{1},1);
max_volume = 0;
for i = 1:volume_size
    items = textscan(g{1}{i},'%s','delimiter',' ');
    row = str2num(items{1}{1});
    column = str2num(items{1}{2});
    volume = str2num(items{1}{3});
    volume_stat{row, column} = volume;
    if volume > max_volume
        max_volume = volume;
    end
    
end

for i = 1:size(duration_stat,1)
    for j = 1:size(duration_stat,2)
            if isempty(duration_stat{i,j})
                    duration_stat{i,j} = 0;
            end
    end
end

for i = 1:size(volume_stat,1)
    for j = 1:size(volume_stat,2)
        if isempty(volume_stat{i,j})
                volume_stat{i,j} = 0;
        end
    end
end

hFig = figure('visible','off');
data = transpose(cell2mat(volume_stat));
% data(data==0) = NaN;
h = bar3(data);
for i = 1:size(data,2)
    zdata = get(h(i),'zdata');
    k = 1;
    for j = 0:6:(6*size(data,1)-6)
        if data(k,i)==0
         zdata(j+1:j+6,:)= NaN; 
        end
        k = k+1;
    end
    set(h(i),'zdata',zdata);
end
axis([0 botid_size+1 0 time_size+1  0 max_volume+1]);
pbaspect([7 20 8]);
view([-149.036243467926 20.3840726863375]);
box on;

set(hFig,'PaperSize',[15,8],'PaperPosition',[-3 0 15 8]);

set(gca,'FontSize',18);
set(get(gca,'XLabel'),'string','Botnet Id','FontSize',20,'FontWeight','b');
set(get(gca,'YLabel'),'string','Time','FontSize',20,'FontWeight','b');
set(get(gca,'ZLabel'),'string','Magnitude','FontSize',20,'FontWeight','b');
ylabell = time_list(1:round(max(get(gca,'YLim'))/10):time_size);
ylabell{1,size(ylabell,2)+1} = time_list{1,time_size};
set(gca,'YTick',0:round(max(get(gca,'YLim'))/10):round(max(get(gca,'YLim'))),'YTickLabel',ylabell);
% disp(size(volume_stat,2)/3);
xlim([0 size(data,2)]);

% set(gca,'XTickLabel',0:round(size(volume_stat,2)/10):round(size(volume_stat,2)));
saveas(hFig,sprintf('./%s_coop.eps',family),'epsc');

end