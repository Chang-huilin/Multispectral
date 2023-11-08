% Xc_normalized �����Ļ��ͱ�׼�����ѵ������Yc ��ѵ������Ŀ��
% Xt_normalized �����Ļ��ͱ�׼����Ĳ��Լ���Yt �ǲ��Լ���Ŀ��

% �������ɷ����ķ�Χ
num_components_range = 1:10;

% ��ʼ��������֤�ľ�������RMSE������
rmse_cv = zeros(length(num_components_range), 1);

% ʹ�ý�����֤ѡ������ʵ����ɷ���
for i = 1:length(num_components_range)
    num_components = num_components_range(i);
    
    % ����PLSRģ��
    [XL,yl,XS,YS,beta,PCTVAR,MSE,stats] = plsregress(Xc, Yc, num_components);
    
    % ��ѵ�����Ͻ���Ԥ��
    Yc_predicted = [ones(size(Xc, 1), 1), Xc] * beta;
    
    % ���㽻����֤�ľ�������RMSE��
    rmse_cv(i) = sqrt(mean((Yc - Yc_predicted).^2));
end

% �ҵ���С�Ľ�����֤����������Ӧ�����ɷ���
optimal_num_components = num_components_range(rmse_cv == min(rmse_cv));

% ������ŵ����ɷ���
disp(['���ŵ����ɷ���Ϊ: ', num2str(optimal_num_components)]);

% ʹ�����ŵ����ɷ�������PLSRģ��
[num_components, Yc_predicted, Yt_predicted] = buildPLSRModel(Xc, Yc, Xt, optimal_num_components);

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

% ���庯�����ڽ���PLSRģ��
function [num_components, Yc_predicted, Yt_predicted] = buildPLSRModel(Xc, Yc, Xt, num_components)
    % ����PLSRģ��
    [XL,yl,XS,YS,beta,PCTVAR,MSE,stats] = plsregress(Xc, Yc, num_components); %#ok<*ASGLU>
    
    % ��ѵ�����Ͻ���Ԥ��
    Yc_predicted = [ones(size(Xc, 1), 1), Xc] * beta;
    
    % �ڲ��Լ��Ͻ���Ԥ��
    Xt_with_bias = [ones(size(Xt, 1), 1), Xt];
    Yt_predicted = Xt_with_bias * beta;
end


