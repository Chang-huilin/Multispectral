 Model=ipls(Xc,Yc,10,'none',1,[],'syst123',5); %10Ϊ���ɷ֣��ɸ�Ϊ15��1Ϊ������������Ϊһ�����䣬"none"�ǹ���Ԥ������,����ѡ��'mean', 'auto', 'mscmean', 'mscauto', 'none'����syst123����5 ��ʾ���ý�����֤�ķ�����ÿ�ν�����֤��������������
 iplsplot(Model,'intlabel'); 
 plsrmse(Model,0);     %�ó����ɷ�����0�Ǹ�����
 
 num_total =10;   %���ɷ���
 %ʹ������������Ϊһ���������ѵ�����õ�һ��ģ��
 plspvsm(Model,num_total,1);
 oneModel=plsmodel(Model,1,num_total,'mean','test',5);  
 %����
 predModel=plspredict(Xc,oneModel,num_total,Yc);%���Rc������ṹ��predModel,���Yc2
 plspvsm(predModel,num_total,1);    %��ͼ���ڵ�RMSEP�ĳ�RMSEC�����ﺯ��Ĭ�������ʾRMSEP��ʵ�������RMSEC����Ҫ��һ��ͼ�ڵ�RMSEPΪRMSEC
%Ԥ��
 predModel=plspredict(Xt,oneModel,num_total,Yt);%���Rp��Yt2
 plspvsm(predModel,num_total,1,1);      %Ԥ�⼯�Ľ��  


 

 % ����PLSģ��
num_components = 10; % ����PLSģ�͵����ɷ���Ŀ
[XL,yl,XS,YS,beta,PCTVAR,MSE,stats] = plsregress(Xc, Yc, num_components);

% ��ѵ�����Ͻ���Ԥ��
Yc_predicted = [ones(size(Xc, 1), 1), Xc] * beta;

% �ڲ��Լ��Ͻ���Ԥ��
Xt_with_bias = [ones(size(Xt, 1), 1), Xt];
Yt_predicted = Xt_with_bias * beta;

% ����ѵ���������ϵ����Rc��
Rc = corr(Yc, Yc_predicted);

% ������Լ������ϵ����Rp��
Rp = corr(Yt, Yt_predicted);

% ����ѵ�����ľ�������RMSEC��
RMSEC = sqrt(mean((Yc - Yc_predicted).^2));

% ������Լ��ľ�������RMSEP��
RMSEP = sqrt(mean((Yt - Yt_predicted).^2));

% ����RPDֵ
RPD = std(Yc) / RMSEP;

% ������
disp(['ѵ���������ϵ�� Rc: ', num2str(Rc)]);
disp(['���Լ������ϵ�� Rp: ', num2str(Rp)]);
disp(['ѵ�����ľ�������� RMSEC: ', num2str(RMSEC)]);
disp(['���Լ��ľ�������� RMSEP: ', num2str(RMSEP)]);
disp(['RPDֵΪ: ', num2str(RPD)]);
