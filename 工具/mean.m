% ����Z�����ԭʼ����
% ����Z�Ĵ�СΪm x n������mΪ������nΪ����

% ����ÿ��ȡ��ֵ������
chunk_size = 20;

% ��ȡ����Z������������
[m, n] = size(Z);

% �����¾���Y������
num_chunks = floor(m / chunk_size);
Y = zeros(num_chunks, n);

% ����ÿ20��ȡ��ֵ�������浽�¾���Y��
for i = 1:num_chunks
    start_row = (i - 1) * chunk_size + 1;
    end_row = i * chunk_size;
    Y(i, :) = mean(Z(start_row:end_row, :), 1);
end

% Y�����б����˰���ÿ20��ȡ��ֵ�Ľ��
% ����Խ�Y���浽�ļ��л��߽�����������
