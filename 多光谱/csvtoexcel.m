%% 这是一个将csv文件批量转化为excel文件并存入一个数组矩阵，最后提取数组矩阵内的值到一个大矩阵内
%方法1
% 指定文件夹路径
folderPath = 'C:\Users\79365\OneDrive\桌面\多光谱数据\热风1\1';

% 获取文件夹内所有CSV文件的信息
fileList = dir(fullfile(folderPath, '*.csv'));

% 初始化一个空的矩阵数组
dataMatrices = [];

% 循环读取每个CSV文件并保存到矩阵数组中
for i = 1:length(fileList)
    % 构建完整的文件路径
    filePath = fullfile(folderPath, fileList(i).name);
    
    % 使用readmatrix函数读取CSV文件
    data = readmatrix(filePath,1,4);%从第二行第五列开始读取数据，初始为0，0
    
    % 将读取的数据添加到矩阵数组中
    dataMatrices{i} = data; %#ok<SAGROW>
end

% 现在dataMatrices是一个包含所有CSV文件数据的矩阵数组
% 可以通过dataMatrices{1}, dataMatrices{2}, ... 访问各个矩阵

 % 使用cat函数进行水平拼接
mergedData = cat(1, dataMatrices{:});
 
% 方法2

% 变量"data"包含了从第二行开始的CSV文件数据
folderPath = 'C:\Users\79365\OneDrive\桌面\多光谱数据\热风2';

% 获取文件夹中所有CSV文件列表
fileList = dir(fullfile(folderPath, '*.csv'));

% 初始化矩阵X
X = [];

% 循环读取每个CSV文件并插入到矩阵X中
for i = 1:length(fileList)
    % 构建完整文件路径
    filePath = fullfile(folderPath, fileList(i).name);
    
    % 读取CSV文件数据
    data = csvread(filePath, 1, 4); %#ok<CSVRD> % 如果CSV文件中包含标题行，可以使用csvread(filePath, 1, 0)来跳过标题行
    
    % 将数据按行插入到矩阵X中
    X = [X; data]; %#ok<AGROW>
end


%其他操作
% 保留偶数行的索引
evenRows = 2:2:size(mergedData, 1);

% 从 mergedData 中提取偶数行
evenRowsMatrix = mergedData(evenRows, :);%这里我们选择保留偶数行反射率的值，奇数行是25个固定的光谱


%或者

% 保留奇数行的索引
oddRows = 1:2:size(mergedData, 1);

% 从 mergedData 中提取奇数行
resultMatrix = mergedData(oddRows, :);


% 假设 resultMatrix 是一个包含奇数行的矩阵，其维度为 m x n

% 去掉前四列
resultMatrixWithoutFirstFourColumns = resultMatrix(:, 5:end);
   
X = resultMatrixWithoutFirstFourColumns;

%新建wavelength数据，表格第一行25个光谱值，复制黏贴即可，命名为WAVE
%或者
WAVE = WAVE(:, 5:end);%截取掉前4列，从第5列开始保留

%作图

plot(WAVE,X)