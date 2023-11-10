MCCV=plsmccv(X,Y,10,'center',1000,0.8);
 CARS=carspls(X,Y,MCCV.optPC,5,'center',50); 
 plotcars(CARS);
 SelectedVariables=CARS.vsel;

 Xt3=Xt(:,SelectedVariables);
 Xc3=Xc(:,SelectedVariables);

 Model=ipls(Xc3,Yc,10,'mean',1,[],'syst123',5);
 iplsplot(Model,'intlabel')
 plsrmse(Model,0)

 num_total =8;   %主成分数
 plspvsm(Model,num_total,1);        %更改主成分数
 oneModel=plsmodel(Model,1,num_total,'mean','syst123',5);
 predModel=plspredict(Xc3,oneModel,num_total,Yc);
  plspvsm(predModel,num_total)
 predModel=plspredict(Xt3,oneModel,num_total,Yt);
 plspvsm(predModel,num_total)

 Variables = xaxis(SelectedVariables,1);  %SelectedVariables选出来的变量从xaxis里摘出来,参数不变    