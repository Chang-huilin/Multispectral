% ����X�����ԭʼ���ݣ�ÿһ�д���һ��������ÿһ�д���һ������
% ������Ҫ�����ݻ���Ϊѵ������Xc���Ͳ��Լ���Xt�������Ը�����Ҫ���û��ֱ���
train_ratio = 0.8; % 80% ����������ѵ����20% ���������ڲ���
num_samples = size(X, 1);
num_train_samples = round(train_ratio * num_samples);

% �����ݻ���Ϊѵ������Xc���Ͳ��Լ���Xt��
Xc = X(1:num_train_samples, :); % ѵ����
Xt = X(num_train_samples + 1:end, :); % ���Լ�

% ����ѵ�����ľ�ֵ�ͱ�׼��
mean_vals = mean(Xc);
std_devs = std(Xc);

% ��ѵ��������Z-score��һ��
normalized_Xc = (Xc - mean_vals) ./ std_devs;

% ʹ��ѵ�����ľ�ֵ�ͱ�׼��Բ��Լ�����Z-score��һ��
normalized_Xt = (Xt - mean_vals) ./ std_devs;



%ע��ʹ��ѵ�����ľ�ֵ�ͱ�׼���Xc��Xt����Z-score��һ����