 Model=ipls(Xc,Yc,10,'none',1,[],'syst123',5); %10为主成分，可改为15，1为将整个光谱作为一个区间，"none"是光谱预处理方法,可以选择'mean', 'auto', 'mscmean', 'mscauto', 'none'，”syst123“和5 表示采用交互验证的方法和每次交互验证所用样本的数量
 iplsplot(Model,'intlabel'); 
 plsrmse(Model,0);     %得出主成分数，0是个参数
 
 num_total =10;   %主成分数
 %使用整个光谱作为一个区间进行训练，得到一个模型
 plspvsm(Model,num_total,1);
 oneModel=plsmodel(Model,1,num_total,'mean','test',5);  
 %矫正
 predModel=plspredict(Xc,oneModel,num_total,Yc);%获得Rc，进入结构体predModel,获得Yc2
 plspvsm(predModel,num_total,1);    %把图标内的RMSEP改成RMSEC，这里函数默认输出显示RMSEP，实际上输出RMSEC，需要改一下图内的RMSEP为RMSEC
%预测
 predModel=plspredict(Xt,oneModel,num_total,Yt);%获得Rp，Yt2
 plspvsm(predModel,num_total,1,1);      %预测集的结果  


 

 % 建立PLS模型
num_components = 10; % 定义PLS模型的主成分数目
[XL,yl,XS,YS,beta,PCTVAR,MSE,stats] = plsregress(Xc, Yc, num_components);

% 在训练集上进行预测
Yc_predicted = [ones(size(Xc, 1), 1), Xc] * beta;

% 在测试集上进行预测
Xt_with_bias = [ones(size(Xt, 1), 1), Xt];
Yt_predicted = Xt_with_bias * beta;

% 计算训练集的相关系数（Rc）
Rc = corr(Yc, Yc_predicted);

% 计算测试集的相关系数（Rp）
Rp = corr(Yt, Yt_predicted);

% 计算训练集的均方根误差（RMSEC）
RMSEC = sqrt(mean((Yc - Yc_predicted).^2));

% 计算测试集的均方根误差（RMSEP）
RMSEP = sqrt(mean((Yt - Yt_predicted).^2));

% 计算RPD值
RPD = std(Yc) / RMSEP;

% 输出结果
disp(['训练集的相关系数 Rc: ', num2str(Rc)]);
disp(['测试集的相关系数 Rp: ', num2str(Rp)]);
disp(['训练集的均方根误差 RMSEC: ', num2str(RMSEC)]);
disp(['测试集的均方根误差 RMSEP: ', num2str(RMSEP)]);
disp(['RPD值为: ', num2str(RPD)]);
