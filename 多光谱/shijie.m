% % PLS
% Model=ipls(Xc,Yc,10,'mean',1,[],'syst123',5); %10为主成分，可改为15，1为将整个光谱作为一个区间，"mean"是光谱预处理方法，”syst123“和5 表示采用交互验证的方法和每次交互验证所用样本的数量
% iplsplot(Model,'intlabel');
% plsrmse(Model,0);     %得出主成分数，0是个参数

% num_total =10;   %主成分数
% plspvsm(Model,num_total,1);
% oneModel=plsmodel(Model,1,num_total,'mean','test',5);  
% predModel=plspredict(Xc,oneModel,num_total,Yc);
% plspvsm(predModel,num_total,1,1);    %把RMSEP改成RMSEC
% predModel=plspredict(Xt,oneModel,num_total,Yt);
% plspvsm(predModel,num_total,1,1);      %预测集的结果  



% % CARS
% MCCV=plsmccv(X,Y,15,'center',1000,0.8);
% CARS=carspls(X,Y,MCCV.optPC,5,'center',50); 
% plotcars(CARS);
% SelectedVariables=CARS.vsel;

% Xt3=Xt(:,SelectedVariables);
% Xc3=Xc(:,SelectedVariables);

% Model=ipls(Xc3,Yc,10,'mean',1,[],'syst123',5);
% iplsplot(Model,'intlabel')
% plsrmse(Model,0)

% num_total =8;   %主成分数
% plspvsm(Model,num_total,1);        %更改主成分数
% oneModel=plsmodel(Model,1,num_total,'mean','syst123',5);
% predModel=plspredict(Xc3,oneModel,num_total,Yc);
% plspvsm(predModel,num_total)
% predModel=plspredict(Xt3,oneModel,num_total,Yt);
% plspvsm(predModel,num_total)

% Variables = xaxis(SelectedVariables,1);  %SelectedVariables选出来的变量从xaxis里摘出来,参数不变    


% SiPLS

% siModel=sipls(Xc,Yc,10,'mean',11,2,xaxis2,'syst123',5);
% siplstable(siModel);

% num_total =6;   %主成分数
% FinalModel=plsmodel(siModel,[ 7    8] ,num_total,'mean','syst123',5);
% plspvsm(FinalModel,num_total,1);
% oneModel=plsmodel(siModel,[ 7    8] ,num_total,'mean','test',5);
% predModel=plspredict(Xc,oneModel,num_total,Yc);
% plspvsm(predModel,num_total,1,1);
% predModel=plspredict(Xt,oneModel,num_total,Yt);
% plspvsm(predModel,num_total,1,1);      %预测集的结果 

ACO  E:\荣艳娜硕士\算法代码\ACO+SA+GA+siPLS\ACO+SA+GA+siPLS\ACO-PLS
Xcal=Xc;
Xtest=Xt;
Ycal=Yc;
Ytest=Yt;

Xtest=Xtest';
Xmon_sim1=Xtest;
save('Xmon_sim1.txt','Xmon_sim1','-ascii')
Xcal=Xcal';
Xcal_sim1=Xcal;
save('Xcal_sim1.txt','Xcal_sim1','-ascii')
ymon_sim1=Ytest;
save('ymon_sim1.txt','ymon_sim1','-ascii')
ycal_sim1=Ycal;
save('ycal_sim1.txt','ycal_sim1','-ascii'); 

    %运行aco_pls_main_code.m文件.变量2924图
    % 保留上面第一幅图片（红色曲线去除 不要关闭这个图片），删除下面第二幅图片。编辑-图形属性-delete删除图片
    % 运行aco_pls_selv文件.波长400-1000图
    % 运行aco_pls_cal文件.最终图

%得到选择的 xaxis即xaxis_1%%xaxis_1就是筛选变量，用到表格里
[m,n]=size(histo);
histo_1=zeros(m,1);
xaxis_1=zeros(m,1);
for i=1:m
    for j=1:n
        if histo(i,j) ~= 0
            histo_1(i,1) =i;
            xaxis_1(i,1) = xaxis(i,1);
            continue;
        end
    end
end
histo_1(all(histo_1==0,2),:)=[];
xaxis_1(all(xaxis_1==0,2),:)=[]; 

X_new=X(:,histo_1);   %将选择出来的变量合并成新的矩阵
X= X_new;

Xcc=Xcal0';
Xtt=Xtest';
 Xc2=Xcc(:,histo_1);
 Xt2=Xtt(:,histo_1);

Model=ipls(Xc2,Yc,15,'mean',1,[],'syst123',5); %10为主成分，可改为15，1为将整个光谱作为一个区间，"mean"是光谱预处理方法，”syst123“和5 表示采用交互验证的方法和每次交互验证所用样本的数量
iplsplot(Model,'intlabel');
plsrmse(Model,0);     %得出主成分数，0是个参数

num_total =5;   %主成分数
plspvsm(Model,num_total,1);
oneModel=plsmodel(Model,1,num_total,'mean','test',5);  
predModel=plspredict(Xc2,oneModel,num_total,Yc);
plspvsm(predModel,num_total,1,1);    %把RMSEP改成RMSEC
predModel=plspredict(Xt2,oneModel,num_total,Yt);
plspvsm(predModel,num_total,1,1);      %预测集的结果                                
 


%将筛选后的运行PLS主成分画图

UVE 无信息变量消除E:\荣艳娜硕士\算法代码\matlab code\算法(SH)\数据处理相关算法\UVE-PLS
 [mean_b,std_b,t_values,var_retain,RMSECVnew,Yhat,E]=plsuve(X,Y,20,144,2924,0.99);

 for i=1:47 %根据var_retain改
     X1(:,i) = X(:,(var_retain(1,i)));      %#ok<*SAGROW,*NASGU> %记得重新命名X1改成X
 end

 [Xc,Xt,Yc,Yt]=spxy(X,Y,96);        %#ok<*ASGLU> %66代表训练集划分的样本数量，重新划分运行PLS画图


% % % Boss E:\荣艳娜硕士\算法代码\matlab code\matlab code\code-boss
% Xcal=Xc;
% ycal=Yc;
% Xtest=Xt;
% ytest=Yt;
% nLV_max=10;
% fold=5;
% method='center';
% num_bootstrap=1000;
% BOSS=boss(Xcal,ycal,nLV_max,fold,method,num_bootstrap,0); 
% boss_rmsecv=BOSS.minRMSECV;
% boss_q2_cv=BOSS.Q2_max;
% boss_variable_index=BOSS.variable_index;
% [boss_rmsep,boss_rmsec,boss_q2_test,boss_q2_train, yfit, ypred]=predict(Xcal,ycal,Xtest,ytest,BOSS.variable_index==1,BOSS.optPC,method);

% [r,c]=find(BOSS.variable_index==1);

% Xt3=Xt(:,r);
% Xc3=Xc(:,r);
% xaxis2=xaxis(r);    %筛选出的变量

% Model=ipls(Xc3,Yc,10,'mean',1,1:12,'syst123',5);    %23为筛选出来的变量数，修改
% iplsplot(Model,'intlabel')
% plsrmse(Model,0)

% num_total =5;    %修改主成分数
% plspvsm(Model,num_total,1)
% oneModel=plsmodel(Model,1,num_total,'mean','syst123',5);
% predModel=plspredict(Xc3,oneModel,num_total,Yc);
% plspvsm(predModel,num_total)
% predModel=plspredict(Xt3,oneModel,num_total,Yt);
% plspvsm(predModel,num_total)

%预处理
%% SNV：  %X是样本*变量       
X=SNV(X); 
[Xc,Xt,Yc,Yt]=spxy(X,Y,86);
plot(1:3648,X)  %输出结果图，3648是变量数            

%% 一、二、三阶导：  在 \ D:\刘丽华1\硕\404\code\算法（CW)\算法（CW)\预处理\  目录下运行
[dx1]=DERIV(X,1);      %X是样本*变量
X1=X;
X=dx1;
[Xc,Xt,Yc,Yt]=spxy(X,Y,96);

[dx2]=DERIV(X,2);
X1=X;
X=dx2;
[Xc,Xt,Yc,Yt]=spxy(X,Y,86);

[dx3]=DERIV(X,3);
plot(1:2808,dx1);     % 输出结果图

%%center均值中心化：%X是样本*变量
[cdata,me,ctest]=center(X',1,X');   %如果变量*样本数 需要转置
plot(1:3648,cdata);  %输出结果图

%MSC：%X是样本*变量
[xmsc,me,xtmsc]=MSC(x,first,last,xt);  %不需要输入
[xmsc,me]=MSC(X,1,3648);  %1为第一个变量 3648为最后一个变量
plot(1:3648,xmsc);  %输出结果图


%划分样本三种
 ZX=SNV(X); 

[dx1]=DERIV(X,1);      %X是样本*变量
X1=X;
X=dx1;

[dx2]=DERIV(X,2);
X1=X;
X=dx2;

ZX=X;
[z1, z2]=sort(Y);       %对Y进行排序，按照3：2划分训练集和预测集,z1为排序之后的理化值结果，z2为新的排列顺序
ZX2=ZX(z2,:);
num_total=72;
X1=ZX2(1:5:num_total,:);   %训练与预测以3:2分(中间为5，若1:1分则中间为2）每5个分为一组，每组中 1、3、5 为训练；2、4为预测
X2=ZX2(2:5:num_total,:);
X3=ZX2(3:5:num_total,:);
X4=ZX2(4:5:num_total,:);
X5=ZX2(5:5:num_total,:);

Y1=z1(1:5:num_total,:);   
Y2=z1(2:5:num_total,:);
Y3=z1(3:5:num_total,:);
Y4=z1(4:5:num_total,:);
Y5=z1(5:5:num_total,:);

Xc=[X1;X3;X5];
Xt=[X2;X4];
Yc=[Y1;Y3;Y5];
Yt=[Y2;Y4];


X=NIR';
X=SNV(X); 

[dx1]=DERIV(X,1);      %X是样本*变量
X1=X;
X=dx1;

[dx2]=DERIV(X,2);
X1=X;
X=dx2;

[z1, z2]=sort(Y);       %对Y进行排序，按照2：1划分训练集和预测集
X=X(z2,:);
num_total=150;  
 t1=X(1:3:num_total,:);
 t2=X(2:3:num_total,:);
 t3=X(3:3:num_total,:);
 Xc=[t1;t3];
 Xt=t2;
 t1=z1(1:3:num_total,:);
 t2=z1(2:3:num_total,:);
 t3=z1(3:3:num_total,:);
 Yc=[t1;t3];
 Yt=t2;


%%SPXY划分   D:\刘丽华1\硕\404\code\matlab code\matlab code
[Xc,Xt,Yc,Yt]=spxy(X,Y,48);        %66代表训练集划分的样本数量                           

%%画图语句，将校正集和预测集放在一张图里
plot(Yc,Yc2,'o')         %model , Yc2表示校正集的预测值
hold on
plot(Yt,Yt2,'*')          %premodel ， Yt2表示预测集的预测值
hold on
x=0:0.05:0.2;
y=x;
plot(x,y);
hold on;
xlabel('Measured value (mol·mL^{-1}·L^{-1})');        %单位要根据实际做出更改
ylabel('Predicted value (mol·mL^{-1}·L^{-1})');
legend('R_c=0.9258 RMSEC=0.011','R_p=0.9030 RMSEP=0.014');




%筛选变量在原图像上
X0=mean(X);
plot(xaxis,X0);
hold on;
plot(xaxis(MMb),X0(1,MMb),'ro');
hold on;
plot(xaxis(CARS),X0(1,CARS),'bs');
hold on;
plot(xaxis(BOSS),X0(1,BOSS),'m+');
hold on;
xlabel('Wavelength (nm)');

X01=mean(X1);
plot(xaxis,X01);
hold on;
plot(xaxis(first),X01(1,first),'ro');

X07=mean(X7);
plot(xaxis,X07);
hold on;
plot(xaxis(second),X07(1,second),'ro');

X09=mean(X9);
plot(xaxis,X09);
hold on;
plot(xaxis(third),X09(1,third),'ro');

%筛选变量对应波长
xaxisCha = xaxis(cha,:);
xaxisFen = xaxis(fen,:);
xaxisTang = xaxis(tang,:);
xaxisKa = xaxis(ka,:);
xaxisYou = xaxis(you,:);

%对应Y轴
X0=mean(X);
plot(xaxis,X0);
%%plot(xaxis,[X1;x2])
hold on;
plot(xaxis1(MMb),-0.2,'ro');
hold on;
plot(xaxis2(DMb),-0.25,'bs');
hold on;
plot(xaxis3(OMb),-0.3,'m+');
hold on;
plot(xaxis4(Mb),-0.35,'g*');
hold on;
xlabel('Wavelength (nm)');



%Y坐标123456
for i=1:5
    Y(20*(i-1)+1:20*i,1) = i;
end

%筛选出来的变量所对应的波长


%%%%Si筛选的区间变量提取
intervals = oneModel.selected_intervals;
allint = oneModel.allint;
[m,n]=size(intervals);
[m1,n1] = size(allint);
allints=zeros(m,2);
for j=1:n
    for i=1:m1
        if allint(i,1) == intervals(1,j)
            allints(j,:) = allint(i,2:3);
        end
    end
end
%提取对应的波长数
xaxisC = xaxis; 
rep1 = X; 
for i=1:n
    if i==1
        data1=rep1(:,allints(i,1):allints(i,2));
        xaxis1 = xaxisC(allints(i,1):allints(i,2));
        xaxis = xaxis1;
        X=data1;
    elseif i==2
        data2=rep1(:,allints(i,1):allints(i,2));
        xaxis2 = xaxisC(allints(i,1):allints(i,2));
        xaxis = [xaxis1;xaxis2];
        X=[data1,data2];
    elseif i==3
        data3= rep1(:,allints(i,1):allints(i,2));
        xaxis3 = xaxisC(allints(i,1):allints(i,2));
        xaxis = [xaxis1;xaxis2;xaxis3];
        X=[data1,data2,data3];
    elseif i==4
        data4= rep1(:,allints(i,1):allints(i,2));
        xaxis4 = xaxisC(allints(i,1):allints(i,2));
        xaxis = [xaxis1;xaxis2;xaxis3;xaxis4];
        X=[data1 data2 data3 data4];
    end
end


rep2 = Xc;
for i=1:n
    if i==1
        data1=rep2(:,allints(i,1):allints(i,2));
        Xc=data1;
    elseif i==2
        data2=rep2(:,allints(i,1):allints(i,2));
        Xc=[data1,data2];
    elseif i==3
        data3= rep2(:,allints(i,1):allints(i,2));
        Xc=[data1 data2 data3];
    elseif i==4
        data4= rep2(:,allints(i,1):allints(i,2));
        Xc=[data1 data2 data3 data4];
    end
end


rep3 = Xt;
for i=1:n
    if i==1
        data1=rep3(:,allints(i,1):allints(i,2));
        Xt=data1;
    elseif i==2
        data2=rep3(:,allints(i,1):allints(i,2));
        Xt=[data1,data2];
    elseif i==3
        data3= rep3(:,allints(i,1):allints(i,2));
        Xt=[data1 data2 data3];
    elseif i==4
        data4= rep3(:,allints(i,1):allints(i,2));
        Xt=[data1 data2 data3 data4];
    end
end

%%%%对于si区间筛选后又进一步变量筛选画的变量图
X0=mean(X);
[m,n]=size(X0);
[m1,n1]=size(xaxis1);
[m2,n2]=size(xaxis2);
[m3,n3]=size(xaxis3);
[m4,n4]=size(xaxis4);
for i=1:n
    for j=1:m1
        if xaxis1(j) == xaxis(i)
            X1(1,j) = X0(1,i);
        end
    end
     for j=1:m2
        if xaxis2(j) == xaxis(i)
            X2(1,j) = X0(1,i);
        end
     end
     for j=1:m3
        if xaxis3(j) == xaxis(i)
            X3(1,j) = X0(1,i);
        end
     end
     for j=1:m4
        if xaxis4(j) == xaxis(i)
            X4(1,j) = X0(1,i);
        end
    end
end
figure,plot(xaxis,X0);
hold on;
plot(xaxis1(MMb),X1(MMb),'m*');
figure,plot(xaxis,X0);
hold on;
plot(xaxis2(DMb),X2(DMb),'m*');
figure,plot(xaxis,X0);
hold on;
plot(xaxis3(OMb),X3(OMb),'m*');
figure,plot(xaxis,X0);
hold on;
plot(xaxis4(Mb),X4(Mb),'m*');
hold on;
xlabel('Wavelength (nm)');