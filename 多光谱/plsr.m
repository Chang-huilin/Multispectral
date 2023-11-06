Model=ipls(Xc,Yc,10,'none',1,[],'syst123',5); %10Ϊ���ɷ֣��ɸ�Ϊ15��1Ϊ������������Ϊһ�����䣬"none"�ǹ���Ԥ������,����ѡ��'mean', 'auto', 'mscmean', 'mscauto', 'none'����syst123����5 ��ʾ���ý�����֤�ķ�����ÿ�ν�����֤��������������
 iplsplot(Model,'intlabel'); %#ok<*ASGLU>
 plsrmse(Model,0);     %�ó����ɷ�����0�Ǹ�����
 
 num_total =10;   %���ɷ���
 %ѵ��
 plspvsm(Model,num_total,1);
 oneModel=plsmodel(Model,1,num_total,'mean','test',5);  
 %����
 predModel=plspredict(Xc,oneModel,num_total,Yc);%���Rc��Yc2
 plspvsm(predModel,num_total,1);    %��ͼ���ڵ�RMSEP�ĳ�RMSEC�����ﺯ��Ĭ�������ʾRMSEP��ʵ�������RMSEC����Ҫ��һ��ͼ�ڵ�RMSEPΪRMSEC
%Ԥ��
 predModel=plspredict(Xt,oneModel,num_total,Yt);%���Rp��Yt2
 plspvsm(predModel,num_total,1,1);      %Ԥ�⼯�Ľ��  





% �趨���ɷ��������Ը�����Ҫ������
num_components = 2;

% ʹ��plsregress��������PLSR��ģ
[~,~,~,~,coefficients] = plsregress(X, Y, num_components);

% ���PLSRģ�͵�ϵ��
disp('PLSRģ��ϵ��:');
disp(coefficients);

% ʹ��PLSRģ�ͽ���Ԥ�⣨�����X_pred������������������
X_pred = randn(10, 10);  % 10����������ÿ��������10������
Y_pred = [ones(size(X_pred, 1), 1), X_pred] * coefficients;  % Ԥ��Ŀ�����

% ���Ԥ����
disp('Ԥ����:');
disp(Y_pred);
