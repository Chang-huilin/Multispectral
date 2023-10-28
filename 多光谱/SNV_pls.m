% snv
X=SNV(X);

x_values = linspace(650, 950, 25); % ��660��924֮������25���ȼ�����ֵ
plot(x_values, xmsc);
xlabel('Wavelength(nm)'); % �뽫'�������ǩ'�滻Ϊ����Ҫ��ʾ�ĺ������ǩ
ylabel('Reflectance(%)'); % �뽫'�������ǩ'�滻Ϊ����Ҫ��ʾ���������ǩ
title('MSC'); % �뽫'ͼ�����'�滻Ϊ����Ҫ��ʾ��ͼ�����

Model=ipls(Xc,Yc,10,'none',1,[],'syst123',5); %10Ϊ���ɷ֣��ɸ�Ϊ15��1Ϊ������������Ϊһ�����䣬"none"�ǹ���Ԥ������,����ѡ��'mean', 'auto', 'mscmean', 'mscauto', 'none'����syst123����5 ��ʾ���ý�����֤�ķ�����ÿ�ν�����֤��������������
 iplsplot(Model,'intlabel');
 plsrmse(Model,0);     %�ó����ɷ�����0�Ǹ�����
 
 num_total =10;   %���ɷ���
 %ѵ��
 plspvsm(Model,num_total,1);
 oneModel=plsmodel(Model,1,num_total,'mean','test',5);  
 %����
 predModel=plspredict(Xc,oneModel,num_total,Yc);%���Rc��Yc2
 plspvsm(predModel,num_total,1);    %��ͼ���ڵ�RMSEP�ĳ�RMSEC�����ﺯ��Ĭ�����RMSEP�����Ҫ���RMSEC����Ҫ��һ��ͼ�ڵ�RMSEPΪRMSEC
%Ԥ��
 predModel=plspredict(Xt,oneModel,num_total,Yt);%���Rp��Yt2
 plspvsm(predModel,num_total,1,1);      %Ԥ�⼯�Ľ��  