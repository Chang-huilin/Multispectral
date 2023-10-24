%遗传算法
dataset=[Xc Yc];
gaplsopt(dataset,1);    %1为固定
gaplsopt(dataset,2);    %2为固定

[bi,ci,di]=gapls(dataset,178);    %178为上一步运行的结果

boshu1=1:99;
GA1=bi(1:99);  %99为上一步运行的结果，变量数
Xc1=Xc(:,GA1);
Xt1=Xt(:,GA1);   %筛选变量结束，下面运行PLS（也就是使用筛选出来的变量进行PLS建模）
  
Model=ipls(Xc1,Yc,11,'mean',1,[],'syst123',5);   %基本同PLS算法，只是变量要使用GA算法筛选出来的
plsrmse(Model,0);   %得出主成分数，0是个参数

plspvsm(Model,10,1); 
oneModel=plsmodel(Model,1,10,'mean','test',5);
predModel=plspredict(Xt1,oneModel,10,Yt);
plspvsm(predModel,10); 