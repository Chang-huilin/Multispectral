% % PLS
Model=ipls(Xc,Yc,10,'mean',1,[],'syst123',5); %10为主成分，可改为15，1为将整个光谱作为一个区间，"mean"是光谱预处理方法，”syst123“和5 表示采用交互验证的方法和每次交互验证所用样本的数量
 iplsplot(Model,'intlabel');
 plsrmse(Model,0);     %得出主成分数，0是个参数

 num_total =10;   %主成分数
 plspvsm(Model,num_total,1);
 oneModel=plsmodel(Model,1,num_total,'mean','test',5);  
 predModel=plspredict(Xc,oneModel,num_total,Yc);%获得Rc，Yc2
 plspvsm(predModel,num_total,1,1);    %把RMSEP改成RMSEC
 predModel=plspredict(Xt,oneModel,num_total,Yt);%获得Rp，Yt2
 plspvsm(predModel,num_total,1,1);      %预测集的结果  

 