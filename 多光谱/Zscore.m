
% 计算训练集的均值和标准差
mean_vals = mean(Xc);
std_devs = std(Xc);

% 对训练集进行Z-score归一化
normalized_Xc = (Xc - mean_vals) ./ std_devs;

% 使用训练集的均值和标准差对测试集进行Z-score归一化
normalized_Xt = (Xt - mean_vals) ./ std_devs;

Xc=normalized_Xc;
Xt=normalized_Xt;

%注意使用训练集的均值和标准差对Xc和Xt进行Z-score归一化。

clear normalized_Xc normalized_Xt mean_vals std_devs;