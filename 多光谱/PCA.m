%主成分分析
% 
% [coeff1,score,latent1]=princomp(X);%原数据作主成分，SCORE为提取主成分后的变量，LATENT为每个主成分的贡献率 定性均需要此步骤% A为样本*变量时不用转置
scatter3(score(1:15,1),score(1:15,2),score(1:15,3),'ro')%按照1234分类进行画图 3D
hold on
scatter3(score(16:29,1),score(16:29,2),score(16:29,3),'g+')
hold on
scatter3(score(30:44,1),score(30:44,2),score(30:44,3),'ms')
 hold on
scatter3(score(45:59,1),score(45:59,2),score(45:59,3),'k*')
hold on
scatter3(score(60:74,1),score(60:74,2),score(60:74,3),'b+')
hold on
scatter3(score(75:89,1),score(75:89,2),score(75:89,3),'yp');
hold on
scatter3(score(90:104,1),score(90:104,2),score(90:104,3),'b>')
hold on
