plot(Yc, Yc2, 'o', 'MarkerSize', 8, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'none'); % 蓝色空心圆圈表示校正集
hold on; 

% 绘制预测集的散点图（用红色实心星号表示）
plot(Yt, Yt2, '*', 'MarkerSize', 8, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r'); % 红色实心星号表示预测集
hold on;
x=0:0.05:0.2;
y=x;
plot(x,y);
hold on;
line([0, 90], [0, 90], 'Color', 'red', 'LineStyle', '--');%对角线，从（0，0)到（90，90）
xlabel('Measured value (%)','FontWeight', 'bold');        %加粗，'FontWeight', 'bold'
ylabel('Predicted value (%)','FontWeight', 'bold');
legend('R_c=0.9885 RMSEP=3.6417','R_p=0.9717 RMSEP=5.7096','Location', 'Northwest','FontWeight', 'bold');
