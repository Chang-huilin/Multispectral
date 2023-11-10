% 假设Z是你的原始矩阵
% 假设Z的大小为m x n，其中m为行数，n为列数

% 定义每次取均值的行数
chunk_size = 20;

% 获取矩阵Z的行数和列数
[m, n] = size(Z);

% 计算新矩阵Y的行数
num_chunks = floor(m / chunk_size);
Y = zeros(num_chunks, n);

% 按照每20行取均值，并保存到新矩阵Y中
for i = 1:num_chunks
    start_row = (i - 1) * chunk_size + 1;
    end_row = i * chunk_size;
    Y(i, :) = mean(Z(start_row:end_row, :), 1);
end

% Y矩阵中保存了按照每20行取均值的结果
% 你可以将Y保存到文件中或者进行其他处理
