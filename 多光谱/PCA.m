%���ɷַ���
% 
% [coeff1,score,latent1]=princomp(X);%ԭ���������ɷ֣�SCOREΪ��ȡ���ɷֺ�ı�����LATENTΪÿ�����ɷֵĹ����� ���Ծ���Ҫ�˲���% AΪ����*����ʱ����ת��
scatter3(score(1:15,1),score(1:15,2),score(1:15,3),'ro')%����1234������л�ͼ 3D
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
