% �������ɭ��ģ��
numTrees = 100; % ���ɭ������������
rfModel = TreeBagger(numTrees, X, Y, 'Method', 'regression');

% ��ȡ���ɭ���е���
trees = rfModel.Trees;

% ��ʼ��������Ҫ�Ե÷�
importance = zeros(1, size(X, 2));

% ����ÿ������������Ҫ�Ե÷ֲ��ۼ�
for i = 1:numTrees
    tree = trees{i};
    treeImportance = predictorImportance(tree); % ���㵥������������Ҫ�Ե÷�
    importance = importance + treeImportance;
end

% ƽ��������Ҫ�Ե÷�
importance = importance / numTrees;

% ��������Ҫ�Ե÷ֽ�������
[sortedImportance, sortedIndices] = sort(importance, 'descend');

% ѡ��ǰk����Ҫ������������ѡ��ǰ10��������
topFeaturesIndices = sortedIndices(1:10);
RFX = X(:, topFeaturesIndices);

% ���ѡ�����������
disp('ѡ�����������');
disp(RFX);


%%% ��ͼ


% ָ��ѡ�������������
selectedIndices = [11,13,12,10,14,6,9,5,4,7];%����һ����RF�õ���ǰ10������������

% ѡ����������
selectedFeatures = X(:, selectedIndices);

% ���Ƴ�ʼ��������
figure;
plot(wavelength, X(1, :), 'LineWidth', 2, 'DisplayName', '��һУ׼����');
xlabel('wavelength(nm)');
ylabel('reflectance(%)');
hold on;

% ��ѡ����������ϻ��Ʒ���
scatter(wavelength(selectedIndices), selectedFeatures(1, :), 75, 'red', 'rs', 'LineWidth', 1.5, 'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'none', 'DisplayName', 'ѡ������');
legend('Location', 'southeast');
legend('Box','off')
title('��ʼ����������ѡ�������');

ax = gca; % ��ȡ��ǰ��������
ax.LineWidth = 1.5; % �����������������Ϊ1.5
set(gca, 'TickDir', 'out');
box off;
hold off;
