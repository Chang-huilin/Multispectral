%%center��ֵ���Ļ���%X������*����
[cdata,me,ctest]=center(X,1,X);   %�������*������ ��Ҫת��
plot(1:25,cdata);  %������ͼ

% ����X�����ԭʼ���ݣ�ÿһ�д���һ��������ÿһ�д���һ������
% ������Ҫ�����ݻ���Ϊѵ������Xc���Ͳ��Լ���Xt�������Ը�����Ҫ���û��ֱ���
train_ratio = 0.8; % 80% ����������ѵ����20% ���������ڲ���
num_samples = size(X, 1);
num_train_samples = round(train_ratio * num_samples);

% �����ݻ���Ϊѵ������Xc���Ͳ��Լ���Xt��
Xc = X(1:num_train_samples, :); % ѵ����
Xt = X(num_train_samples + 1:end, :); % ���Լ�

% ����ѵ������������ֵ
mean_vals = mean(Xc);

% ��ѵ�����������Ļ�����
centered_Xc = Xc - mean_vals;

% ʹ��ѵ������������ֵ�Բ��Լ��������Ļ�����
centered_Xt = Xt - mean_vals;%�����ȥ����ѵ�����ľ�ֵ�������ǲ��Լ��ľ�ֵ



%���ʹ��PLS/PLSR���н�ģ����ôcenter�Ľ��Ӧ����ԭʼ���ݵ�һ�¡�