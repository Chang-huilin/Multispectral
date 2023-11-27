
Model=ipls(Xc,Yc,10,'none',1,[],'syst123',5); %10为主成分，可改为15，1为将整个光谱作为一个区间，"none"是光谱预处理方法,可以选择'mean', 'auto', 'mscmean', 'mscauto', 'none'，"syst123"和5 表示采用交互验证的方法和每次交互验证所用样本的数量
iplsplot(Model,'intlabel');
plsrmse(Model,0);
%得出主成分数，0是个参数
%%

num_total =10;   %主成分数
%使用整个光谱作为一个区间进行训练，得到一个模型
plspvsm(Model,num_total,1);
oneModel=plsmodel(Model,1,num_total,'none','test',5);
%矫正
predModel=plspredict(Xc,oneModel,num_total,Yc);%获得Rc，进入结构体predModel,获得Yc2
Yc2 = predModel.Ypred(:, :, end);
plspvsm(predModel,num_total,1);    %把图标内的RMSEP改成RMSEC，这里函数默认输出显示RMSEP，实际上输出RMSEC，需要改一下图内的RMSEP为RMSEC
%预测
predModel=plspredict(Xt,oneModel,num_total,Yt);%获得Rp，Yt2
Yt2 = predModel.Ypred(:, :, end);
plspvsm(predModel,num_total,1,1);      %预测集的结果
%%
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

%% 

RPD = std(Yt) / predModel.RMSE(1, end);
disp(['RPD值为: ', num2str(RPD)]);

varNames = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','r','s','t','u','v','w','x','y'};