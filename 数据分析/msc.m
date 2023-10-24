%MSC：%X是样本*变量
[xmsc,me,xtmsc]=MSC(x,first,last,xt);  %#ok<*ASGLU> %不需要输入
[xmsc,me]=MSC(X,1,140);  %1为第一个维度 140为最后一个
plot(1:140,xmsc);  %输出结果图
