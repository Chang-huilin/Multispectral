close all
clear; clc

%% PLSR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varNames = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','r','s','t','u','v','w','x','y'};
nperm = 100;
ncomp = 25;
Y_data_name = 'yelvsu';
%% 
model_PLSR = PLSR_main(X,Y,ncomp,varNames,'no','yes',{'kfold',5},nperm,Y_data_name);
 

% �������Ѿ������� PLSR_main �����������ģ�ͣ�model��

% ��ȡʵ�ʹ۲�ֵ Y
actualY = Y;

% ��ȡģ�͵�Ԥ��ֵ YScores
predictedY = model_PLSR.YScore;

% ����вԤ��ֵ��ʵ�ʹ۲�ֵ�Ĳ��죩
residuals = actualY - predictedY;

% ������������ (RMSE)
rmse = sqrt(mean(residuals.^2));

% ��ʾ RMSE
disp(['RMSE: ', num2str(rmse)]);

predictedY = model.YScore;

% ����вԤ��ֵ��ʵ�ʹ۲�ֵ�Ĳ��죩
residuals = actualY - predictedY;

% ������������ (RMSE)
rmse = sqrt(mean(residuals.^2));


% Assuming 'model' is the structure containing the PLSR model outputs
MSE = model_PLSR.MSE;
R2 = model_PLSR.R2;

% Calculate RMSEP
RMSEP = sqrt(MSE / (1 - R2));

% Display the result
fprintf('RMSEP: %.4f\n', RMSEP);
