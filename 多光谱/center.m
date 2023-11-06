%%center均值中心化：%X是样本*变量
[cdata,me,ctest]=center(X,1,X);   %如果变量*样本数 需要转置
plot(1:25,cdata);  %输出结果图