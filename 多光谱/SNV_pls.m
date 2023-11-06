% snv
X=SNV(X);

x_values = linspace(650, 950, 25); % 在660到924之间生成25个等间距的数值
plot(x_values, xmsc);
xlabel('Wavelength(nm)'); % 请将'横坐标标签'替换为你想要显示的横坐标标签
ylabel('Reflectance(%)'); % 请将'纵坐标标签'替换为你想要显示的纵坐标标签
title('MSC'); % 请将'图表标题'替换为你想要显示的图表标题

Model=ipls(Xc,Yc,10,'none',1,[],'syst123',5); %10为主成分，可改为15，1为将整个光谱作为一个区间，"none"是光谱预处理方法,可以选择'mean', 'auto', 'mscmean', 'mscauto', 'none'，”syst123“和5 表示采用交互验证的方法和每次交互验证所用样本的数量
 iplsplot(Model,'intlabel');
 plsrmse(Model,0);     %得出主成分数，0是个参数
 
 num_total =10;   %主成分数
 %训练
 plspvsm(Model,num_total,1);
 oneModel=plsmodel(Model,1,num_total,'mean','test',5);  
 %矫正
 predModel=plspredict(Xc,oneModel,num_total,Yc);%获得Rc，Yc2
 plspvsm(predModel,num_total,1);    %把图标内的RMSEP改成RMSEC，这里函数默认输出RMSEP，如果要输出RMSEC，需要改一下图内的RMSEP为RMSEC
%预测
 predModel=plspredict(Xt,oneModel,num_total,Yt);%获得Rp，Yt2
 plspvsm(predModel,num_total,1,1);      %预测集的结果  