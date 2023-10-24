%%划分样本3：2
num_total=12;
[z1 z2]=sort(Y);           %#ok<*ASGLU> %对Y进行排序，z1为排序结果，z2反映做了什么改变,作为索引
X1=X(1:5:num_total,:);   %训练与预测以3:2分(中间为5，若1:1分则中间为2）每5个分为一组，每组中 1、3、5 为训练；2、4为预测
X2=X(2:5:num_total,:);
X3=X(3:5:num_total,:);
X4=X(4:5:num_total,:);
X5=X(5:5:num_total,:);

Y1=Y(1:5:num_total,:);   
Y2=Y(2:5:num_total,:);
Y3=Y(3:5:num_total,:);
Y4=Y(4:5:num_total,:);
Y5=Y(5:5:num_total,:);

Xc=[X1;X3;X5];
Xt=[X2;X4];
Yc=[Y1;Y3;Y5];
Yt=[Y2;Y4]; %#ok<*NASGU>


%%划分样本2：1
X=NIR';
X=SNV(X); 
[z1 z2]=sort(Y);       %#ok<*NCOMMA> %对Y进行排序，按照2：1划分训练集和预测集
X=X(z2,:);
num_total=117;  
 t1=X(1:3:num_total,:);%这行代码的含义是从矩阵X中按照步长为3选取行，从第1行开始，一直选到第num_total行。冒号(:)表示选择该维度上的所有元素。所以，t1包含了X矩阵中每隔3行选取的行，从第1行开始，直到第num_total行。
 t2=X(2:3:num_total,:);
 t3=X(3:3:num_total,:);
 Xc=[t1;t3];
 Xt=t2;
 t1=z1(1:3:num_total,:);
 t2=z1(2:3:num_total,:);
 t3=z1(3:3:num_total,:);
 Yc=[t1;t3];
 Yt=t2;