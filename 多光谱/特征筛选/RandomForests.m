% 构建随机森林模型
numTrees = 100; % 随机森林中树的数量
rfModel = TreeBagger(numTrees, X, Y, 'Method', 'regression');

% 获取随机森林中的树
trees = rfModel.Trees;

% 初始化特征重要性得分
importance = zeros(1, size(X, 2));

% 计算每棵树的特征重要性得分并累加
for i = 1:numTrees
    tree = trees{i};
    treeImportance = predictorImportance(tree); % 计算单棵树的特征重要性得分
    importance = importance + treeImportance;
end

% 平均特征重要性得分
importance = importance / numTrees;

% 对特征重要性得分进行排序
[sortedImportance, sortedIndices] = sort(importance, 'descend');

% 选择前k个重要的特征（这里选择前10个特征）
topFeaturesIndices = sortedIndices(1:10);
RFX = X(:, topFeaturesIndices);

% 输出选择的特征矩阵
disp('选择的特征矩阵：');
disp(RFX);


%%% 作图


% 指定选择的特征的索引
selectedIndices = [11,13,12,10,14,6,9,5,4,7];%由上一步的RF得到的前10个特征的索引

% 选择特征矩阵
selectedFeatures = X(:, selectedIndices);

% 绘制初始光谱曲线
figure;
plot(wavelength, X(1, :), 'LineWidth', 2, 'DisplayName', '第一校准变量');
xlabel('wavelength(nm)');
ylabel('reflectance(%)');
hold on;

% 在选择的特征点上绘制方框
scatter(wavelength(selectedIndices), selectedFeatures(1, :), 75, 'red', 'rs', 'LineWidth', 1.5, 'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'none', 'DisplayName', '选择特征');
legend('Location', 'southeast');
legend('Box','off')
title('初始光谱曲线与选择的特征');

ax = gca; % 获取当前坐标轴句柄
ax.LineWidth = 1.5; % 设置坐标轴线条宽度为1.5
set(gca, 'TickDir', 'out');
box off;
hold off;
