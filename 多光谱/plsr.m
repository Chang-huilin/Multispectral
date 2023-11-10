% Xc_normalized 是中心化和标准化后的训练集，Yc 是训练集的目标
% Xt_normalized 是中心化和标准化后的测试集，Yt 是测试集的目标

% 定义主成分数的范围
num_components_range = 1:10;

% 初始化交叉验证的均方根误差（RMSE）向量
rmse_cv = zeros(length(num_components_range), 1);

% 使用交叉验证选择最合适的主成分数
for i = 1:length(num_components_range)
    num_components = num_components_range(i);
    
    % 建立PLSR模型
    [XL,yl,XS,YS,beta,PCTVAR,MSE,stats] = plsregress(Xc, Yc, num_components);
    
    % 在训练集上进行预测
    Yc_predicted = [ones(size(Xc, 1), 1), Xc] * beta;
    
    % 计算交叉验证的均方根误差（RMSE）
    rmse_cv(i) = sqrt(mean((Yc - Yc_predicted).^2));
end

% 找到最小的交叉验证均方根误差对应的主成分数
optimal_num_components = num_components_range(rmse_cv == min(rmse_cv));

% 输出最优的主成分数
disp(['最优的主成分数为: ', num2str(optimal_num_components)]);

% 使用最优的主成分数建立PLSR模型
[num_components, Yc_predicted, Yt_predicted] = buildPLSRModel(Xc, Yc, Xt, optimal_num_components);

% 计算训练集的相关系数（Rc）
Rc = corr(Yc, Yc_predicted);

% 计算测试集的相关系数（Rp）
Rp = corr(Yt, Yt_predicted);

% 计算训练集的均方根误差（RMSEC）
RMSEC = sqrt(mean((Yc - Yc_predicted).^2));

% 计算测试集的均方根误差（RMSEP）
RMSEP = sqrt(mean((Yt - Yt_predicted).^2));

% 计算RPD值
RPD = std(Yc) / RMSEP;

% 输出结果
disp(['训练集的相关系数 Rc: ', num2str(Rc)]);
disp(['测试集的相关系数 Rp: ', num2str(Rp)]);
disp(['训练集的均方根误差 RMSEC: ', num2str(RMSEC)]);
disp(['测试集的均方根误差 RMSEP: ', num2str(RMSEP)]);
disp(['RPD值为: ', num2str(RPD)]);

% 定义函数用于建立PLSR模型
function [num_components, Yc_predicted, Yt_predicted] = buildPLSRModel(Xc, Yc, Xt, num_components)
    % 建立PLSR模型
    [XL,yl,XS,YS,beta,PCTVAR,MSE,stats] = plsregress(Xc, Yc, num_components); %#ok<*ASGLU>
    
    % 在训练集上进行预测
    Yc_predicted = [ones(size(Xc, 1), 1), Xc] * beta;
    
    % 在测试集上进行预测
    Xt_with_bias = [ones(size(Xt, 1), 1), Xt];
    Yt_predicted = Xt_with_bias * beta;
end


