plot(Yc, Yc2, 'o', 'MarkerSize', 8, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'none'); % ��ɫ����ԲȦ��ʾУ����
hold on; 

% ����Ԥ�⼯��ɢ��ͼ���ú�ɫʵ���Ǻű�ʾ��
plot(Yt, Yt2, '*', 'MarkerSize', 8, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r'); % ��ɫʵ���Ǻű�ʾԤ�⼯
hold on;
x=0:0.05:0.2;
y=x;
plot(x,y);
hold on;
line([0, 90], [0, 90], 'Color', 'red', 'LineStyle', '--');%�Խ��ߣ��ӣ�0��0)����90��90��
xlabel('Measured value (%)','FontWeight', 'bold');        %�Ӵ֣�'FontWeight', 'bold'
ylabel('Predicted value (%)','FontWeight', 'bold');
legend('R_c=0.9885 RMSEP=3.6417','R_p=0.9717 RMSEP=5.7096','Location', 'Northwest','FontWeight', 'bold');
