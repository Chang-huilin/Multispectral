
% ����ѵ�����ľ�ֵ�ͱ�׼��
mean_vals = mean(Xc);
std_devs = std(Xc);

% ��ѵ��������Z-score��һ��
normalized_Xc = (Xc - mean_vals) ./ std_devs;

% ʹ��ѵ�����ľ�ֵ�ͱ�׼��Բ��Լ�����Z-score��һ��
normalized_Xt = (Xt - mean_vals) ./ std_devs;

Xc=normalized_Xc;
Xt=normalized_Xt;

%ע��ʹ��ѵ�����ľ�ֵ�ͱ�׼���Xc��Xt����Z-score��һ����

clear normalized_Xc normalized_Xt mean_vals std_devs;