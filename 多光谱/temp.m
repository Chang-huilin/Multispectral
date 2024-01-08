close all
clear; clc

%% PLSR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varNames = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','r','s','t','u','v','w','x','y'};
nperm = 100;
ncomp = 25;
Y_data_name = 'yelvsu';
%% 
model_PLSR = PLSR_main(X,Y,ncomp,varNames,'no','yes',{'kfold',5},nperm,Y_data_name);
 

% 假设您已经运行了 PLSR_main 函数并获得了模型（model）

% 提取实际观测值 Y
actualY = Y;

% 提取模型的预测值 YScores
predictedY = model_PLSR.YScore;

% 计算残差（预测值与实际观测值的差异）
residuals = actualY - predictedY;

% 计算均方根误差 (RMSE)
rmse = sqrt(mean(residuals.^2));

% 显示 RMSE
disp(['RMSE: ', num2str(rmse)]);

predictedY = model.YScore;

% 计算残差（预测值与实际观测值的差异）
residuals = actualY - predictedY;

% 计算均方根误差 (RMSE)
rmse = sqrt(mean(residuals.^2));


% Assuming 'model' is the structure containing the PLSR model outputs
MSE = model_PLSR.MSE;
R2 = model_PLSR.R2;

% Calculate RMSEP
RMSEP = sqrt(MSE / (1 - R2));

% Display the result
fprintf('RMSEP: %.4f\n', RMSEP);
