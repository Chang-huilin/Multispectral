% 假设Y是原始矩阵，要绘制第一列数据

% 将第一列数据按照20为一个区间分组
numIntervals = floor(size(Y, 1) / 20);
groupedData = mat2cell(Y(1:numIntervals*20, 1), 20*ones(1, numIntervals), 1);%如果是绘制第二列数据，将Y(1:numIntervals*20, 1)改为Y(1:numIntervals*20, 2)，以此类推
% 手动定义不同颜色
colors = [
    0 0 1;  % 蓝色
    1 0 0;  % 红色
    0 1 0;  % 绿色
    0.5 0.5 0;  % 棕色
    0 0.5 0.5;  % 青色
    0.5 0 0.5;  % 紫色
];

% 绘制多个箱线图（每个区间一个箱线图）
figure;
hold on;
for i = 1:numIntervals
    boxplot(groupedData{i}, 'Positions', i, 'Widths', 0.5, 'Colors', colors(i, :), 'MedianStyle', 'line');%如果不要离群点，在最后加入,'symbol','','Labels','盒图'
    
    % 计算并显示平均值（用空心小圆点表示，颜色与箱线图一致）
    avgValue = mean(groupedData{i});
    plot(i, avgValue, 'o', 'MarkerEdgeColor', colors(i, :), 'MarkerFaceColor', colors(i, :), 'MarkerSize', 2,'LineWidth', 1.5);  % 空心小圆点表示平均值，颜色与箱线图一致，
                                                                                                                                 % 如果要修改大小，将MarkerSize后面的数字改为2或者3
end
ax = gca; % 获取当前坐标轴句柄
ax.LineWidth = 1; % 设置坐标轴线条宽度为1.5
xlabel('茶叶杀青过程');
ylabel('mG值');
title('');
ylim([0.20 0.55]);  % 设置纵坐标范围为0.15到0.30
set(gca, 'XTick', 1:numIntervals, 'XTickLabel', 1:6);  % 设置横坐标标签

box off;%只显示左边和下边的坐标轴

set(gca, 'TickDir', 'out');%坐标轴刻度朝外，如果朝内，将out改为in
hold off;



%实心箱型图
% 假设Y是原始矩阵，要绘制第一列数据

% 将第一列数据按照20为一个区间分组
numIntervals = floor(size(Y, 1) / 20);
groupedData = mat2cell(Y(1:numIntervals*20, 2), 20*ones(1, numIntervals), 1);
% 手动定义不同颜色
customColors = [
    0 0 1;  % 蓝色
    1 0 0;  % 红色
    0 1 0;  % 绿色
    0.5 0.5 0;  % 棕色
    0 0.5 0.5;  % 青色
    0.5 0 0.5;  % 紫色
];

% 绘制多个箱线图（每个区间一个箱线图）
figure;
hold on;
for i = 1:numIntervals
    bp = boxplot(groupedData{i}, 'Positions', i, 'Widths', 0.5, 'Symbol', ''); % 设置Symbol为空，不显示离群点
    h = findobj(bp, 'Tag', 'Box');
    patch(get(h(1), 'XData'), get(h(1), 'YData'), customColors(i, :), 'EdgeColor', 'k'); % 设置箱体填充颜色
    % 绘制中位数线
    medians = findobj(bp, 'Tag', 'Median');
    for j = 1:length(medians)
        medianX = get(medians(j), 'XData');
        medianY = get(medians(j), 'YData');
        line(medianX, medianY, 'Color', 'k', 'LineWidth', 1.5);%画中线，颜色为黑色，线宽为1.5
    end
    avgValue = mean(groupedData{i});
    plot(i, avgValue, 'ro', 'MarkerEdgeColor', 'black', 'MarkerFaceColor', 'white', 'MarkerSize', 5,'LineWidth', 1.5);
end

ax = gca; % 获取当前坐标轴句柄
ax.LineWidth = 1.5; % 设置坐标轴线条宽度为1.5
xlabel('茶叶杀青过程');
ylabel('mG值');
title('');
ylim([0.20 0.55]);  % 设置纵坐标范围为0.15到0.30
set(gca, 'XTick', 1:numIntervals, 'XTickLabel', 1:6);  % 设置横坐标标签
box off;
set(gca, 'TickDir', 'out');
hold off;
