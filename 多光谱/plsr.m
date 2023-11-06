Model=ipls(Xc,Yc,10,'none',1,[],'syst123',5); %10为主成分，可改为15，1为将整个光谱作为一个区间，"none"是光谱预处理方法,可以选择'mean', 'auto', 'mscmean', 'mscauto', 'none'，”syst123“和5 表示采用交互验证的方法和每次交互验证所用样本的数量
 iplsplot(Model,'intlabel'); %#ok<*ASGLU>
 plsrmse(Model,0);     %得出主成分数，0是个参数
 
 num_total =10;   %主成分数
 %训练
 plspvsm(Model,num_total,1);
 oneModel=plsmodel(Model,1,num_total,'mean','test',5);  
 %矫正
 predModel=plspredict(Xc,oneModel,num_total,Yc);%获得Rc，Yc2
 plspvsm(predModel,num_total,1);    %把图标内的RMSEP改成RMSEC，这里函数默认输出显示RMSEP，实际上输出RMSEC，需要改一下图内的RMSEP为RMSEC
%预测
 predModel=plspredict(Xt,oneModel,num_total,Yt);%获得Rp，Yt2
 plspvsm(predModel,num_total,1,1);      %预测集的结果  





% 设定主成分数（可以根据需要调整）
num_components = 2;

% 使用plsregress函数进行PLSR建模
[~,~,~,~,coefficients] = plsregress(X, Y, num_components);

% 输出PLSR模型的系数
disp('PLSR模型系数:');
disp(coefficients);

% 使用PLSR模型进行预测（这里的X_pred是新样本的特征矩阵）
X_pred = randn(10, 10);  % 10个新样本，每个样本有10个特征
Y_pred = [ones(size(X_pred, 1), 1), X_pred] * coefficients;  % 预测目标变量

% 输出预测结果
disp('预测结果:');
disp(Y_pred);
