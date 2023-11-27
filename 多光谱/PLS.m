
Model=ipls(Xc,Yc,10,'none',1,[],'syst123',5); %10Ϊ���ɷ֣��ɸ�Ϊ15��1Ϊ������������Ϊһ�����䣬"none"�ǹ���Ԥ������,����ѡ��'mean', 'auto', 'mscmean', 'mscauto', 'none'��"syst123"��5 ��ʾ���ý�����֤�ķ�����ÿ�ν�����֤��������������
iplsplot(Model,'intlabel');
plsrmse(Model,0);
%�ó����ɷ�����0�Ǹ�����
%%

num_total =10;   %���ɷ���
%ʹ������������Ϊһ���������ѵ�����õ�һ��ģ��
plspvsm(Model,num_total,1);
oneModel=plsmodel(Model,1,num_total,'none','test',5);
%����
predModel=plspredict(Xc,oneModel,num_total,Yc);%���Rc������ṹ��predModel,���Yc2
Yc2 = predModel.Ypred(:, :, end);
plspvsm(predModel,num_total,1);    %��ͼ���ڵ�RMSEP�ĳ�RMSEC�����ﺯ��Ĭ�������ʾRMSEP��ʵ�������RMSEC����Ҫ��һ��ͼ�ڵ�RMSEPΪRMSEC
%Ԥ��
predModel=plspredict(Xt,oneModel,num_total,Yt);%���Rp��Yt2
Yt2 = predModel.Ypred(:, :, end);
plspvsm(predModel,num_total,1,1);      %Ԥ�⼯�Ľ��
%%
plot(Yc, Yc2, 'o', 'MarkerSize', 8, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'none'); % ��ɫ����ԲȦ��ʾУ����
hold on; 

% ����Ԥ�⼯��ɢ��ͼ���ú�ɫʵ���Ǻű�ʾ��
plot(Yt, Yt2, '*', 'MarkerSize', 8, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r'); % ��ɫʵ���Ǻű�ʾԤ�⼯
hold on;
x=0:0.05:0.2;
y=x;
plot(x,y);
hold on;
line([0, 90], [0, 90], 'Color', 'red', 'LineStyle', '--');%�Խ��ߣ��ӣ�0��0)����90��90��
xlabel('Measured value (%)','FontWeight', 'bold');        %�Ӵ֣�'FontWeight', 'bold'
ylabel('Predicted value (%)','FontWeight', 'bold');
legend('R_c=0.9885 RMSEP=3.6417','R_p=0.9717 RMSEP=5.7096','Location', 'Northwest','FontWeight', 'bold');

%% 

RPD = std(Yt) / predModel.RMSE(1, end);
disp(['RPDֵΪ: ', num2str(RPD)]);

varNames = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','r','s','t','u','v','w','x','y'};