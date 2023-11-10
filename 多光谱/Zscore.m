% 假设X是你的原始数据，每一行代表一个样本，每一列代表一个特征
% 假设你要将数据划分为训练集（Xc）和测试集（Xt），可以根据需要设置划分比例
train_ratio = 0.8; % 80% 的数据用于训练，20% 的数据用于测试
num_samples = size(X, 1);
num_train_samples = round(train_ratio * num_samples);

% 将数据划分为训练集（Xc）和测试集（Xt）
Xc = X(1:num_train_samples, :); % 训练集
Xt = X(num_train_samples + 1:end, :); % 测试集

% 计算训练集的均值和标准差
mean_vals = mean(Xc);
std_devs = std(Xc);

% 对训练集进行Z-score归一化
normalized_Xc = (Xc - mean_vals) ./ std_devs;

% 使用训练集的均值和标准差对测试集进行Z-score归一化
normalized_Xt = (Xt - mean_vals) ./ std_devs;



%注意使用训练集的均值和标准差对Xc和Xt进行Z-score归一化。