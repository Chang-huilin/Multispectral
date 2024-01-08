%%center均值中心化：%X是样本*变量
[cdata,me,ctest]=center(X,1,X);   %如果变量*样本数 需要转置
plot(1:25,cdata);  %输出结果图

% 假设X是你的原始数据，每一行代表一个样本，每一列代表一个特征
% 假设你要将数据划分为训练集（Xc）和测试集（Xt），可以根据需要设置划分比例
train_ratio = 0.8; % 80% 的数据用于训练，20% 的数据用于测试
num_samples = size(X, 1);
num_train_samples = round(train_ratio * num_samples);

% 将数据划分为训练集（Xc）和测试集（Xt）
Xc = X(1:num_train_samples, :); % 训练集
Xt = X(num_train_samples + 1:end, :); % 测试集

% 计算训练集的特征均值
mean_vals = mean(Xc);

% 对训练集进行中心化处理
centered_Xc = Xc - mean_vals;

% 使用训练集的特征均值对测试集进行中心化处理
centered_Xt = Xt - mean_vals;%这里减去的是训练集的均值，而不是测试集的均值



%如果使用PLS/PLSR进行建模，那么center的结果应当与原始数据的一致。