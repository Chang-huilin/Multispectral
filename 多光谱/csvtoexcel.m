%% ����һ����csv�ļ�����ת��Ϊexcel�ļ�������һ��������������ȡ��������ڵ�ֵ��һ���������
%����1
% ָ���ļ���·��
folderPath = 'C:\Users\79365\OneDrive\����\���������\�ȷ�1\1';

% ��ȡ�ļ���������CSV�ļ�����Ϣ
fileList = dir(fullfile(folderPath, '*.csv'));

% ��ʼ��һ���յľ�������
dataMatrices = [];

% ѭ����ȡÿ��CSV�ļ������浽����������
for i = 1:length(fileList)
    % �����������ļ�·��
    filePath = fullfile(folderPath, fileList(i).name);
    
    % ʹ��readmatrix������ȡCSV�ļ�
    data = readmatrix(filePath,1,4);%�ӵڶ��е����п�ʼ��ȡ���ݣ���ʼΪ0��0
    
    % ����ȡ��������ӵ�����������
    dataMatrices{i} = data; %#ok<SAGROW>
end

% ����dataMatrices��һ����������CSV�ļ����ݵľ�������
% ����ͨ��dataMatrices{1}, dataMatrices{2}, ... ���ʸ�������

 % ʹ��cat��������ˮƽƴ��
mergedData = cat(1, dataMatrices{:});
 
% ����2

% ����"data"�����˴ӵڶ��п�ʼ��CSV�ļ�����
folderPath = 'C:\Users\79365\OneDrive\����\���������\�ȷ�2';

% ��ȡ�ļ���������CSV�ļ��б�
fileList = dir(fullfile(folderPath, '*.csv'));

% ��ʼ������X
X = [];

% ѭ����ȡÿ��CSV�ļ������뵽����X��
for i = 1:length(fileList)
    % ���������ļ�·��
    filePath = fullfile(folderPath, fileList(i).name);
    
    % ��ȡCSV�ļ�����
    data = csvread(filePath, 1, 4); %#ok<CSVRD> % ���CSV�ļ��а��������У�����ʹ��csvread(filePath, 1, 0)������������
    
    % �����ݰ��в��뵽����X��
    X = [X; data]; %#ok<AGROW>
end