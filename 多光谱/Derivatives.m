% ����X�����ԭʼ���ݣ�ÿһ�д���һ��������ÿһ�д���һ������
% ������Ҫ�����ݻ���Ϊѵ������Xc���Ͳ��Լ���Xt�������Ը�����Ҫ���û��ֱ���
train_ratio = 0.8; % 80% ����������ѵ����20% ���������ڲ���
num_samples = size(X, 1);
num_train_samples = round(train_ratio * num_samples);

% �����ݻ���Ϊѵ������Xc���Ͳ��Լ���Xt��
Xc = X(1:num_train_samples, :); % ѵ����
Xt = X(num_train_samples + 1:end, :); % ���Լ�

% ����ѵ������һ�׵�����΢�ִ���
dXc = diff(Xc, 1, 2);

% ������Լ���һ�׵�����΢�ִ���
dXt = diff(Xt, 1, 2);
