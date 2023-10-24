            

%% 一、二、三阶导：  在 \ D:\刘丽华1\硕\404\code\算法（CW)\算法（CW)\预处理\  目录下运行
[dx1]=DERIV(X,1);      %X是样本*变量
[dx2]=DERIV(X,2);
[dx3]=DERIV(X,3);
plot(1:3648,dx1);     % 输出结果图

%%center均值中心化：%X是样本*变量
[cdata,me,ctest]=center(X',1,X');   %#ok<*ASGLU> %如果变量*样本数 需要转置
plot(1:3648,cdata);  %输出结果图

%MSC：%X是样本*变量
[xmsc,me,xtmsc]=MSC(x,first,last,xt);  %不需要输入
[xmsc,me]=MSC(X,1,3648);  %1为第一个变量 3648为最后一个变量
plot(1:3648,xmsc);  %输出结果图
